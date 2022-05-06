
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-top: 100px;">
    <p class="text-center text-danger h3 p-3">Đăng ký</p>
    <c:url value="/register2" var="action" ></c:url>
    <c:if test="${candidate != null}">

        <form:form method="post" modelAttribute="candidate" enctype="multipart/form-data" action="${action}">
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="Name">Họ và tên</label>

                        <form:input type="text" cssClass="form-control" path="fullname"/>
                        <small class="form-text text-muted">
                            <form:errors path="fullname" cssClass="text-danger"/>
                        </small>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="email">Email </label>
                        <form:input type="text" cssClass="form-control" path="email"/>
                        <small class="form-text text-muted">
                            <form:errors path="email" cssClass="text-danger"/>
                        </small>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Số điện thoại</label>
                        <form:input type="text" cssClass="form-control" path="phone"/>
                        <small class="form-text text-muted">
                            <form:errors path="phone" cssClass="text-danger"/>
                        </small>
                    </div>
                </div>
                <div class="col-sm-6">
                <label for="province">Địa chỉ</label>
                <form:select cssClass="custom-select" id="province" path="province" items="${provinces}" itemLabel="name" itemValue="id">
                    <option value="0">Chọn địa chỉ</option>
                </form:select>
            </div>
            </div>

            <div class="form-group">
                <label for="exampleFormControlSelect1">Lĩnh vực của bạn</label>
                <form:select class="form-control" id="job" path="idJob"  items="${jobs}" itemLabel="title" itemValue="id" />
            </div>
            <div class="form-group">
                <label for="exampleFormControlFile1">Upload CV</label>
                <form:input type="file" cssClass="form-control-file" path="fileCV"/>
            </div>
            <div class="form-group text-center"style="margin-bottom: 100px;">
                <!--<input type="submit" class="form-control btn btn-light " style="font-weight: 500; width: 30%;" value="Trở về">-->
                <input type="submit" class="form-control btn btn-info " style="font-weight: 500; width: 30%;" value="Đăng ký">
            </div>

        </form:form>
    </c:if>
    <c:if test="${employer != null}">
        <form:form method="post" modelAttribute="employer" enctype="multipart/form-data" action="${action}">
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="title">Tên tổ chức</label>

                        <form:input type="text" id="title" cssClass="form-control" path="title"/>
                        <small class="form-text text-muted">
                            <form:errors path="title" cssClass="text-danger"/>
                        </small>
                    </div>
                </div>
                <div class="col-sm-6">
                <label for="province">Địa chỉ</label>
                <form:select cssClass="custom-select" id="province" path="address" items="${provinces}" itemLabel="name" itemValue="id">
                    <option value="0">Chọn địa chỉ</option>
                </form:select>
            </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="country">Quốc gia</label>
                        <form:input type="text" cssClass="form-control" path="country" id="country"/>
                        <small class="form-text text-muted">
                            <form:errors path="country" cssClass="text-danger"/>
                        </small>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="slogan">Slogan</label>
                        <form:input type="text" cssClass="form-control" path="slogan" id="slogan"/>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <form:input type="text" cssClass="form-control" path="email" id="email"/>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label for="logo">Logo</label>
                <form:input type="file" cssClass="form-control-file" path="fileLogo"/>
            </div>
            <div class="form-group text-center"style="margin-bottom: 100px;">
                <input type="submit" class="form-control btn btn-info " style="font-weight: 500; width: 30%;" value="Đăng ký">
            </div>

        </form:form>
    </c:if>


</div>
