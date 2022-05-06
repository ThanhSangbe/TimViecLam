<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container" style="margin-top: 100px;">
    <div class="row">
        <div class="col-sm-3">
            <a href="">
                <c:if test="${item.idEmployer.logo.startsWith('http') == true}">
                    <img src="${item.idEmployer.logo}" class="img-fluid" style="width: 80%;">
                </c:if>
                <c:if test="${item.idEmployer.logo.startsWith('http') != true}">
                    <img src="/resources/images/${item.idEmployer.logo}" class="img-fluid" style="width: 80%;">
                </c:if>
            </a>
        </div>
        <div class="col-sm-7 d-flex flex-column justify-content-center">
            <p>  <a href="" class="h3 text-danger">${item.idEmployer.title}</a></p>
            <p>${item.idEmployer.slogan}</p>
        </div>
        <div class="col-sm-2  d-flex align-items-center justify-content-center ">
            <a href="" class="btn btn-warning" style="width: 100%; font-weight: 600;">Ứng tuyển</a>
        </div>
    </div>   
    <p class="h5 mt-5"><strong>Chi tiết công việc</strong></p> 
    <hr>
    <div class="row">
        <div class="col-sm-12 p-3" style="font-size: 20px; color: tomato;">
            ${item.title}
        </div>
        <div class="col-sm-12 p-3" style="font-size: 20px;">
            <strong>Lương: ${item.salary} $ </strong>
        </div>
    </div>
    <div class="row bg-light">
        <div class="col-sm-12 p-3" >
            <strong style="font-size: 20px;">Mô tả công việc: </strong><br>
            ${item.descrip}
        </div>
        <div class="col-sm-12 p-3" >
            <strong style="font-size: 20px;">Yêu cầu kỹ năng: </strong><br>
            ${item.skils}
        </div>
        <div class="col-sm-12 p-3" >
            <strong style="font-size: 20px;">Kinh nghiệm: </strong><br>
            ${item.experience}
        </div>

    </div>
</div>    

