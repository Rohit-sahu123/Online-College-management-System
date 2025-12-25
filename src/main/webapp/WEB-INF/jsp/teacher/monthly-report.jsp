<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>Monthly Attendance Report (All Students)</h3>
<p>Month: ${month}/${year}</p>

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <tr style="background:#f2f2f2;">
        <th>Student ID</th>
           <th>Student Name</th>
           <th>Month</th>
           <th>Present Days</th>
           <th>Total Days</th>
           <th>Percent %</th>
    </tr>

    <c:forEach var="r" items="${reportList}">
        <tr>
            <td>${r.studentId}</td>
            <td>${r.studentName}</td>
            <td>${r.month}</td>
            <td>${r.totalAttendance}</td>
            <td>${r.totalDays}</td>
            <td>${r.percent}</td>
        </tr>
    </c:forEach>
</table>




<a href="/teacher/monthly-report/present-percent/pdf?month=12&year=2025"
   style="
     padding:10px 15px;
     background:#fd7e14;
     color:white;
     text-decoration:none;
     border-radius:5px;">
   📄 Present % PDF (All Students)
</a>
