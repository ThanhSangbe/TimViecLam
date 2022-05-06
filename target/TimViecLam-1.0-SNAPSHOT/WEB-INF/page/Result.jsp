

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container p-5" style="margin-top: 100px;">
    <c:url value="/search" var="action"/>
    <form:form method="get" action="${action}" modelAttribute="search" cssClass=" needs">
        <div class="form-row">
            <div class="col-sm-6" >
                <label for="keyword">Từ khóa</label>
                <form:input type="text" path="keyword" cssClass="form-control"  placeholder="Nhập từ khóa tìm kiếm" style=" padding: 10px 10px; "/>
            </div>
            <div class="col-sm-4">
                <label for="province">Địa chỉ</label>
                <form:select cssClass="custom-select" id="province" path="province" items="${provinces}" itemLabel="name" itemValue="id"></form:select>
            </div>
            <div class="col-sm-2 d-flex">
                <form:button Class="btn btn-danger align-self-end" style="padding: 5px 30px;font-size: 20px;" >Tìm kiếm</form:button>
            </div>
        </div>
    </form:form>
</div>
<div class="container">
    <p class="h4 mb-4">Kết quả tìm kiếm:${title}</p>
    <c:choose>
        <c:when test="${not empty message}">
            <p>Rất tiếc kết quả tìm kiếm không có</p>
        </c:when>
        <c:otherwise>

            <c:forEach var="item" items="${Tintuyendungs}">
                <div class="row mb-3" style="margin-bottom: 15px;">
                    <div class="col-sm-3">
                        <a href="">
                            <div class="text-center"> <img src="resources/images/${item.idEmployer.logo}" class="card-img-top" style="width: 170px;"></div>   
                        </a>
                    </div>
                    <div class="col-sm-7 bg-light">
                        <p><a href="/detail?id=${item.id}" class="text-danger h3">${item.title}</a></p>
                        <p>${item.idEmployer.title}</p>
                        <p><i class="fas fa-map-marker-alt"></i> ${item.idEmployer.address}</p>
                        <p><i class="fas fa-dollar-sign"></i> Lương: <strong>${item.salary}</strong></p>
                    </div>
                    <div class="col-sm-2 bg-light d-flex align-items-center justify-content-center ">
                        <a href="" class="btn btn-warning">Ứng tuyển</a>
                    </div>
                </div>
            </c:forEach>

        </c:otherwise>
    </c:choose>

</div>