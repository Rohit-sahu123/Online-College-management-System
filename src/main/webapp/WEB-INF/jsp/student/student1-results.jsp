<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2 style="text-align:center; color:#4CAF50; margin-bottom:20px;">
    My Results
</h2>

<table style="width:100%; border-collapse:collapse; font-size:18px;">
    <tr style="background:#4CAF50; color:white;">
        <th style="padding:10px;">Subject</th>
        <th style="padding:10px;">Marks</th>
        <th style="padding:10px;">Grade</th>
    </tr>

    <c:forEach var="r" items="${results}">
        <tr style="text-align:center; background:#f8f8f8;">
            <td style="padding:10px;">${r.subject}</td>
            <td style="padding:10px;">${r.marks}</td>
            <td style="padding:10px;">${r.grade}</td>
        </tr>
    </c:forEach>
</table>

<c:if test="${empty results}">
    <p style="color:red; text-align:center; margin-top:20px;">
        No results uploaded yet.
    </p>
</c:if>
