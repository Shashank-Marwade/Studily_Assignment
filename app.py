from flask import Flask,jsonify
import mysql.connector


mydb = mysql.connector.connect(host='localhost',user='root',password='sam',db='school')
cur=mydb.cursor()

app=Flask(__name__)


@app.route('/student') #retrive all data from student  http://127.0.0.1:5000/student
def get_student_info():

    '''
    query="Select sub.Sub_name form subjectAlloted subA join subject sub on subA.subj_code= sub.sub_code where Teacher_ID=(Select Teacher_ID from Teacher where Name=’name’)"
    query="SELECT std_name FROM student WHERE opt_sub1='Hindi' order by section"
    query="SELECT teacher_name FROM teacher teach INNER JOIN subject_allot sub on teach.teacher_id=sub.teacher_id where sub.section='C'"
    query="SELECT sub_code,sub_name FROM subject_ WHERE sub_code IN (SELECT S.sub_code from Teacher te INNER JOIN Subject_allot S ON te.teacher_id=S.teacher_id where te.teacher_name = 'Mr. X')"
    query="Select sub_code,sub_name from Subject_ where opt='Y'"
    '''
    query='SELECT * FROM student'

    result=cur.fetchall()
    for rec in result:
        print(rec)

    #suppose data from student Table
    student_tab=[{"enr_no":"102","std_name":"Shubham","section":"A","opt_sub1":"Hindi","opt_sub2":"Eng"},
    {"enr_no":"103","std_name":"Deepak","section":"B","opt_sub1":"Marathi","opt_sub2":"Eng"},
    {"enr_no":"104","std_name":"Shashank","section":"C","opt_sub1":"Eng","opt_sub2":"Hindi"}]

    return jsonify({'student':student_tab})

app.run(port=5000)