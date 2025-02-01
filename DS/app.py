from flask import Flask, render_template, request, jsonify, redirect, url_for
import mysql.connector
import logging

app = Flask(__name__)

# Configure Logging
logging.basicConfig(level=logging.DEBUG)

# Database configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'sumanth@2004',
    'database': 'bloodreportdb'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/')
def home():
    return render_template('index.html')

# Route to show tables
@app.route('/show_tables')
def show_tables():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES;")
    tables = cursor.fetchall()
    conn.close()
    return render_template('tables.html', tables=tables)

# Route to display data from a selected table
@app.route('/show_data/<table_name>')
def show_data(table_name):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(f"SELECT * FROM {table_name};")
    data = cursor.fetchall()
    columns = cursor.column_names
    conn.close()
    return render_template('Results.html', columns=columns, data=data, table_name=table_name)

# Route to execute a custom query
@app.route('/Queries', methods=['GET', 'POST'])
def custom_query():
    if request.method == 'POST':
        query = request.form['query']
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        try:
            cursor.execute(query)
            result = cursor.fetchall()
            columns = cursor.column_names
        except mysql.connector.Error as e:
            conn.close()
            return f"Error executing query: {str(e)}"
        conn.close()
        return render_template('Results.html', columns=columns, data=result, query=query)
    return render_template('Queries.html')

# Route to list stored procedures
@app.route('/procedures')
def list_procedures():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SHOW PROCEDURE STATUS WHERE Db = 'bloodreportdb';")
    procedures = cursor.fetchall()
    conn.close()

    # Mapping for custom display names
    custom_procedure_names = {
        'CheckHealthRanges': 'Check Health Ranges',
        'FixAppointment': 'Fix Appointment',
        'GetAppointmentDetails': 'Get Appointment Details',
        'GetLabsByTests': 'Get Labs by Tests'
    }

    procedures_with_display_names = [
        (proc[1], custom_procedure_names.get(proc[1], proc[1].replace('_', ' '))) for proc in procedures
    ]
    return render_template('procedures.html', procedures=procedures_with_display_names)

# Route to execute a specific procedure
@app.route('/execute_procedure/<procedure_name>', methods=['GET', 'POST'])
def execute_procedure(procedure_name):
    if request.method == 'POST':
        # Get form parameters
        args = request.form.to_dict()
        params = [None if value == '' else value for value in args.values()]
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        try:
            cursor.callproc(procedure_name, params)
            conn.commit()
            
            results = []
            columns = []
            for result in cursor.stored_results():
                results.extend(result.fetchall())
                columns = result.column_names
            conn.close()

            return render_template('Results.html', columns=columns, data=results, procedure_name=procedure_name)

        except mysql.connector.Error as e:
            conn.close()
            if e.errno == 45000:
                result_message = "Appointment Clashing. Please choose another time slot."
            else:
                result_message = f"An unexpected error occurred: {str(e)}"
            return render_template('Results.html', result_message=result_message)

    else:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT PARAMETER_NAME
            FROM information_schema.PARAMETERS
            WHERE SPECIFIC_NAME = %s AND ROUTINE_TYPE = 'PROCEDURE';
        """, (procedure_name,))
        procedure_params = [row[0] for row in cursor.fetchall()]
        conn.close()

        custom_titles = {
            'input_haemoglobin': 'Hemoglobin Level',
            'input_WBCCount': 'WBC Count',
            'input_plateletCount': 'Platelet Count',
            'input_cholesterol': 'Cholesterol Level',
            'input_bloodSugar': 'Blood Sugar Level',
            'app_purpose': 'Appointment Purpose',
            'app_date': 'Appointment Date',
            'p_patient_id': 'Patient ID',
            'test_ids': 'Test ID'
        }

        return render_template('procedure_form.html', procedure_name=procedure_name, procedure_params=procedure_params, custom_titles=custom_titles)

# Health Check Page
@app.route('/health_check', methods=['GET', 'POST'])
def health_check():
    if request.method == 'POST':
        hb = request.form.get('haemoglobin')
        wbc = request.form.get('wbc')
        platelets = request.form.get('platelets')
        cholesterol = request.form.get('cholesterol')
        sugar = request.form.get('sugar')

        params = [None if value == '' else value for value in [hb, wbc, platelets, cholesterol, sugar]]
        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.callproc('CheckHealthRanges', params)
            results = []
            for result in cursor.stored_results():
                results = result.fetchall()
        finally:
            conn.close()

        return render_template('Results.html', results=results)

    return render_template('Results.html')

# Appointment Page
@app.route('/appointment', methods=['GET', 'POST'])
def appointment():
    if request.method == 'POST':
        patient_id = request.form.get('patient_id')

        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.callproc('GetAppointmentDetails', [patient_id])
            appointments = []
            for result in cursor.stored_results():
                appointments = result.fetchall()
        finally:
            conn.close()

        return render_template('Results.html', appointments=appointments)

    return render_template('Results.html')

# Lab Search Page
@app.route('/lab_search', methods=['GET', 'POST'])
def lab_search():
    if request.method == 'POST':
        test_ids = request.form.get('test_ids')

        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.callproc('GetLabsByTests', [test_ids])
            labs = []
            for result in cursor.stored_results():
                labs = result.fetchall()
        finally:
            conn.close()

        return render_template('Results.html', labs=labs)

    return render_template('Results.html')

@app.route('/fix_appointment', methods=['GET', 'POST'])
def fix_appointment():
    result_message = ""
    if request.method == 'POST':
        patient_id = request.form.get('patient_id')
        doctor_id = request.form.get('doctor_id')
        appointment_id = request.form.get('appointment_id')

        params = [patient_id, doctor_id, appointment_id]
        params = [None if not value else value for value in params]

        conn = get_db_connection()
        cursor = conn.cursor()

        try:
            cursor.callproc('FixAppointment', params)
            conn.commit()
            result_message = "Appointment successfully created."

        except mysql.connector.Error as e:
            if e.errno == 45000:
                result_message = "Appointment Clashing. Please choose another time slot."
            else:
                result_message = f"An unexpected error occurred while processing your request. Please try again later."

        finally:
            conn.close()

        return render_template('Results.html', result_message=result_message)

    return render_template('Results.html', result_message=result_message)


if __name__ == "__main__":
    app.run(debug=True)
