<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="">
    <div class="row">
        <div class="col - sm - 8">
            <label for="quy">Thống kê theo quý</label>
            <select class="custom-select" name="quy" id="quy">
                <option value="1">Quý 1</option>
                <option value="2">Quý 2</option>
                <option value="3">Quý 3</option>
                <option value="4">Quý 4</option>
            </select></div>
        <div class="col-sm-4 d-flex">
            <button class="btn btn-primary align-self-end">Thống kê</button></div>
    </div>
</form>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger mt-4">${errMsg}</div>
</c:if>
<c:if test="${items != null}">
    <table class="table mt-4">
        <thead>
            <tr>
                <th scope="col">Vị trí</th>
                <th scope="col">Số lần ứng tuyển</th>

            </tr>
        </thead>
        <tbody>
            <c:forEach items="${items}" var="item">

            <tr>
                <td>${item[0]}</td>
                <td>${item[1]}</td>

            </tr>

        </c:forEach>
    </tbody>
    </table>
</c:if>
<div>
    <canvas id="chart"></canvas>
</div>
<script>
    let lables = [], minfo = []
    <c:forEach items="${items}" var = "item">
    lables.push('${item[0]}')
    minfo.push('${item[1]}')
    </c:forEach>
    window.onload = function () {
        monthChart("chart", lables, minfo)
    }
</script>
