<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" style="margin-top: 100px;">
    <div class="jumbotron text-center">
        <h3>Thông tin cá nhân</h3>
    </div>
    <c:url value='/c/edit' var="action"/>"
    <form:form modelAttribute="candidate" action="${action}" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="fullname">Họ và tên</label>
            <form:input id="fullname" cssClass="form-control" path="fullname" />
        </div>
        <div class="form-group">
            <label for="major">Chuyên ngành đào tạo</label>
            <form:input id="major" cssClass="form-control" path="major" />
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <form:input id="email" cssClass="form-control" path="email" />
        </div>
        <div class="form-group">
            <label for="phone">Số điện thoại</label>
            <form:input id="phone" cssClass="form-control" path="phone" />
        </div>
        <div class="form-group">
            <label for="cv">CV</label>
            <c:if test="${candidate.cv != null}">
                <form:input type="file" id="cv" cssClass="form-control" path="cv" value="cv"/>
            </c:if>
            <c:if test="${candidate.cv == null}">
                <form:input type="file" id="cv" cssClass="form-control" path="fileCV"  />
            </c:if>
        </div>
        <div class="form-group">
            <label class="my-1 mr-2" for="job">Công việc</label>
            <form:select class="form-control" id="job" path="idJob"  items="${jobs}" itemLabel="title" itemValue="id" />
        </div>
        <div class="form-group">
            <label class="my-1 mr-2" for="province">Địa chỉ</label>
            <form:select class="form-control" id="province" path="province"  items="${provinces}" itemLabel="name" itemValue="id" />
        </div>
        <div class="form-group text-center"style="margin-bottom: 100px;">
            <input type="submit" class="form-control btn btn-info " style="font-weight: 500; width: 30%;" value="Lưu thông tin">
        </div>
    </form:form>
</div>

