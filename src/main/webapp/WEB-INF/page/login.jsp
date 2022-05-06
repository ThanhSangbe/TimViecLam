
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jstl/core" %>
<div class="container" style="margin-top: 150px;">
    <p class="text-center h3 p-3">Đăng nhập vào FindDev</p>
    <form method="post" action="<c:url value="/dangnhap" />">

        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="form-group  ">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" class="form-control" name="username" id="username" >
                </div>
            </div>
            <div class="col-3"></div>
            <div class="col-3"></div>
            <div class="col-6"> 
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" class="form-control" name="password" id="password" >
                </div>
            </div>
            <div class="col-3"></div>
        </div>
        <div class="form-group text-center">
            <input type="submit" class="form-control btn btn-danger " style="font-weight: 500; width: 20%;" value="Đăng nhập">
        </div>
    </form>
</div>