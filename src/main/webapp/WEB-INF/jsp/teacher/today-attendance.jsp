<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h3>Today Attendance (Present Students)</h3>
<p>Date: ${date}</p>
<p>Total Present: <b>${presentCount}</b></p>

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <tr style="background:#f2f2f2;">
        <th>Student ID</th>
        <th>Student Name</th>
        <th>Subject</th>
        <th>Scan Time</th>
        <th>Status</th>
    </tr>

    <c:forEach var="r" items="${todayList}">
        <tr>
            <td>${r.studentId}</td>
            <td>${r.studentName}</td>
            <td>${r.subject}</td>
            <td>${r.scanTime}</td>
            <td>${r.status}</td>
        </tr>
    </c:forEach>
</table>
<script>
    setTimeout(function () {
        location.reload();
    }, 50000);
</script>
