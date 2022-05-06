
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-top: 100px;">

    <p class="text-center h3 p-3">Đăng ký</p>
    <c:url value="/register1" var="action" /> 
    <form:form method="POST" modelAttribute="user" action="${action}">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="form-group">
                    <label for="tendangnhap">Tên đăng nhập</label>
                    <form:input type="text" cssClass="form-control" path="username"/>
                    <small class="form-text text-muted"><form:errors path="username" cssClass="text-danger" /></small> 
                </div>
            </div>
            <div class="col-3"></div>

            <div class="col-3"></div>
            <div class="col-6"> 
                <div class="form-group">
                    <label for="matkhau">Mật khẩu</label>
                    <form:input type="password" cssClass="form-control" path="password"/>
                </div>
            </div>
            <div class="col-3"></div>
            
            <div class="col-3"></div>
            <div class="col-6"> 
                <div class="form-group">
                    <label for="matkhau">Nhập lại mật khẩu</label>
                    <form:input type="password" cssClass="form-control" path="confirmPassword"/>
                </div>
            </div>
            <div class="col-3"></div>
            <div class="col-3" hidden></div>
            <div class="col-6" hidden>
                <div class="form-group" hidden>
                    <label for="tendangnhap">Tên đăng nhập</label>
                    <form:input type="text" cssClass="form-control" path="userRole"/>
                    <small class="form-text text-muted"><form:errors path="userRole" cssClass="text-danger" /></small> 
                </div>
            </div>
            <div class="col-3" hidden></div>
            <div class="col-3"></div>
            <div class="col-6 form-group text-center">
                <input type="submit" class="form-control btn btn-info " style="font-weight: 500; width: 50%; margin-bottom: 100px; margin-top: 20px;" value="Tiếp theo">
            </div>
            <div class="col-3"></div>
        </div>
    </form:form>
</div>
