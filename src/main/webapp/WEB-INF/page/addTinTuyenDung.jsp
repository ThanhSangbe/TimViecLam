

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container" style="margin-top: 100px;">
    <p class="text-center text-danger h3 p-3">Đăng tin tuyển dụng</p>
    <c:url value="/e/addTintuyendung" var="action" ></c:url>

    <form:form method="post" modelAttribute="tinTuyenDung" enctype="multipart/form-data" action="${action}">


        <div class="form-group">
            <label for="title">Tiêu đề</label>
            <form:input type="text" cssClass="form-control" path="title" id="title"/>
            <small class="form-text text-muted">
                <form:errors path="title" cssClass="text-danger"/>
            </small>
        </div>


        <div class="form-group">
            <label for="email">Nội dung </label>
            <form:textarea type="text" cssClass="form-control" path="descrip"/>
            <small class="form-text text-muted">
                <form:errors path="descrip" cssClass="text-danger"/>
            </small>
        </div>


        <div class="form-group">
            <label for="exampleInputEmail1">Kỹ năng</label>
            <form:textarea type="text" cssClass="form-control" path="skils"/>
            <small class="form-text text-muted">
                <form:errors path="skils" cssClass="text-danger"/>
            </small>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1">Kinh nghiệm</label>
            <form:textarea type="text" cssClass="form-control" path="experience"/>
            <small class="form-text text-muted">
                <form:errors path="experience" cssClass="text-danger"/>
            </small>
        </div>

        <div class="form-group">
            <label for="salary">Lương </label>
            <div class="input-group mb-2 mr-sm-2">
                <div class="input-group-prepend">
                    <div class="input-group-text">$</div>
                </div>
                <form:input type="number" cssClass="form-control" path="salary"/>
            </div>
        </div>

        <div class="form-group">
            <label for="exampleFormControlSelect1">Vị trí</label>
            <form:select class="form-control" id="job" path="idJob"  items="${jobs}" itemLabel="title" itemValue="id" />
        </div>
        <div class="form-group text-center"style="margin-bottom: 100px;">
            <!--<input type="submit" class="form-control btn btn-light " style="font-weight: 500; width: 30%;" value="Trở về">-->
            <input type="submit" class="form-control btn btn-info " style="font-weight: 500; width: 30%;" value="Đăng tin">
        </div>


    </form:form>
</div>
