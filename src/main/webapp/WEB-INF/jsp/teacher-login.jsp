<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Manage Teachers</title></head>
<body>
<h2>All Teachers</h2>
<a href="/admin/add-teacher">➕ Add New Teacher</a><br/><br/>
<table border="1" cellpadding="8">
  <tr><th>ID</th><th>Name</th><th>Email</th><th>Subject</th></tr>
  <c:forEach var="t" items="${teachers}">
    <tr>
      <td>${t.id}</td>
      <td>${t.name}</td>
      <td>${t.email}</td>
      <td>${t.subject}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
