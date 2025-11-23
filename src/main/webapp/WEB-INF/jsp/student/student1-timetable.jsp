<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Timetable</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body{font-family:Inter, Arial;background:linear-gradient(180deg,#071021,#0b1220);color:#eef3ff;padding:30px}
.container-box{max-width:1100px;margin:0 auto;background:rgba(255,255,255,0.03);padding:20px;border-radius:12px;box-shadow:0 8px 30px rgba(2,6,23,.6)}
table{backdrop-filter: blur(6px)}
.slot{transition:transform .18s ease}
.slot:hover{transform:translateY(-6px)}
/* subtle moving grid behind */
.grid-anim{position:fixed;inset:0;pointer-events:none;background-image:radial-gradient(rgba(255,255,255,0.02) 1px, transparent 1px);background-size:60px 60px;opacity:.8;mix-blend-mode:overlay;animation:gridShift 20s linear infinite}
@keyframes gridShift{from{background-position:0 0}to{background-position:200px 200px}}
</style>
</head>
<body>
<div class="grid-anim"></div>
<div class="container-box">
<div class="d-flex justify-content-between align-items-center mb-3">
<h2>Week Timetable</h2>
<a href="/student1/dashboard" class="btn btn-light btn-sm">Back</a>
</div>


<table class="table table-borderless text-light">
<thead>
<tr class="small text-muted">
<th>Day</th>
<th>Time</th>
<th>Subject</th>
<th>Batch</th>
<th>Room</th>
</tr>
</thead>
<tbody>
<c:forEach var="t" items="${timetable}">
<tr class="slot">
<td><c:out value="${t.day}"/></td>
<td><c:out value="${t.time}"/></td>
<td><c:out value="${t.subject}"/></td>
<td><c:out value="${t.batch}"/></td>
<td><c:out value="${t.room}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</body>
</html>