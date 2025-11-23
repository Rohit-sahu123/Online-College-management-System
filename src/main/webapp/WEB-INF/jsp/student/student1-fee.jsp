<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fees - Student</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    margin:0;
    font-family:Inter, Arial, sans-serif;
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;

    /* ✨ New Gradient Background */
    background: linear-gradient(135deg, #4f46e5, #6d28d9, #3b82f6);
    background-size: 400% 400%;
    animation: fancyBG 10s ease infinite;

    overflow-y:auto;
}

/* Smooth animation */
@keyframes fancyBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Keep the rest same */

.card-custom{width:95%;max-width:1000px;border-radius:16px;padding:24px;
box-shadow:0 8px 30px rgba(2,6,23,.6);background:rgba(255,255,255,0.03);color:#e6eef8}
h1{font-weight:700;letter-spacing:0.4px}
.fee-row{display:flex;justify-content:space-between;align-items:center;padding:12px;
border-radius:10px;background:rgba(255,255,255,0.03);margin-bottom:10px}
.badge-due{background:#ff6b6b;color:#fff;padding:6px 10px;border-radius:999px}
.badge-paid{background:#22c55e;color:#042; padding:6px 10px;border-radius:999px}
</style>

</head>
<body>

<div class="bg-anim"></div>

<div class="card-custom">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1>Fees</h1>
        <a href="/student1/dashboard" class="btn btn-sm btn-light">Back</a>
    </div>

    <p class="text-muted">Summary of outstanding and paid fees.</p>

    <!-- Summary -->
    <div class="d-flex gap-3 mb-3">
        <div class="p-3 rounded-3" style="background:rgba(255,255,255,0.02);flex:1">
            <div class="small text-muted">Total Due</div>
            <div class="h4">₹ <c:out value="${totalDue}" /></div>
        </div>
        <div class="p-3 rounded-3" style="background:rgba(255,255,255,0.02);flex:1">
            <div class="small text-muted">Last Payment</div>
            <div class="h4">₹ <c:out value="${lastPaymentAmount}" /></div>
        </div>
    </div>

    <!-- Fee list -->
    <div>
        <c:forEach var="f" items="${feeList}">
            <div class="fee-row">
                <div>
                    <strong><c:out value="${f.description}" /></strong><br>
                    <span class="small text-muted">
                        Due Date: <c:out value="${f.dueDate}" />
                    </span>
                </div>

                <div class="text-end">
                    <c:choose>
                        <c:when test="${f.status == 'Paid'}">
                            <span class="badge-paid">Paid</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge-due">Due</span>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div> <!-- fee-row -->
        </c:forEach>
    </div>

</div> <!-- card-custom -->

</body>
</html>
