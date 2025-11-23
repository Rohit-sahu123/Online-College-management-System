<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Upload Result</h2>

<form action="/teacher/result/upload" method="post">

    <label>Student Email:</label>
   <select name="studentEmail" class="form-control" required>
       <option value="">-- Select Student Email --</option>

       <c:forEach var="s" items="${students}">
           <option value="${s.email}">
               ${s.name} (${s.email})
           </option>
       </c:forEach>
   </select>



    <label>Subject:</label>
    <input type="text" name="subject" required>

    <label>Marks:</label>
    <input type="number" name="marks" required>

    <label>Grade:</label>
    <input type="text" name="grade" required>

    <button type="submit">Upload</button>
</form>


<c:if test="${param.success != null}">
    <p style="color:green;">Result Uploaded Successfully!</p>
</c:if>
