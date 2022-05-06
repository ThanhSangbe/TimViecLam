<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="container p-5" style="margin-top: 100px;" >
    <c:url value="/search" var="action"/>
    <form:form method="get" action="${action}" modelAttribute="search" cssClass="needs">
        <div class="form-row">
            <div class="col-sm-6" >
                <label for="keyword">Từ khóa</label>
                <form:input type="text" path="keyword" cssClass="form-control"  placeholder="Nhập từ khóa tìm kiếm" style=" padding: 10px 10px; "/>
            </div>
            <div class="col-sm-4">
                <label for="province">Địa chỉ</label>
                <form:select cssClass="custom-select" id="province" path="province" items="${provinces}" itemLabel="name" itemValue="id">
                    <option value="0">Chọn địa chỉ</option>
                </form:select>
            </div>
            <div class="col-sm-2 d-flex">
                <form:button Class="btn btn-danger align-self-end" style="padding: 5px 30px;font-size: 20px;" >Tìm kiếm</form:button>
                </div>
            </div>
    </form:form>
    <c:if test="${title != null}">
        Kết quả tìm kiếm ${title}
        <c:if test="${not empty message}">
            <p>Rất tiếc kết quả tìm kiếm không có</p>
        </c:if>
    </c:if>

    <c:if test="${errMsg != null}">
        <div class="alert alert-danger">
            ${errMsg}
        </div>
    </c:if>
    <c:if test="${message == null}">
        <%--<c:if test="${Tintuyendungs != null && candidates == null}">--%>
        <sec:authorize access="isAnonymous()">
            <div class="container">
                <p class="h4 mb-4 mt-3">Tin tuyển dụng</p>
                <c:forEach var="item" items="${Tintuyendungs}">
                    <div class="row mt-4 d-flex" style="border: 2px solid appworkspace;">

                        <div class="col-sm-3" >
                            <a href="/detail?id=${item.id}" >
                                <c:if test="${item.idEmployer.logo.startsWith('http') == true}">
                                    <img src="${item.idEmployer.logo}" class="img-fluid" style="width: 170px;">
                                </c:if>
                                <c:if test="${item.idEmployer.logo.startsWith('http') == false}">
                                    <img src="/resources/images/${item.idEmployer.logo}" class="img-fluid" style="width: 170px;">
                                </c:if>
                            </a> 
                        </div>
                        <div class="col-sm-6">
                            <a href="/detail?id=${item.id}" >
                                <p class="h5 text-dark">${item.title}</p><br>
                                <p>${item.idEmployer.title}</p></a>
                        </div>

                        <div class="col-sm-3 d-flex">
                            <a href="<c:url value='/addDontuyendung' />?id=${item.id}" class="btn btn-warning align-self-center" >Ứng tuyển</a>
                        </div>
                    </div>
                </c:forEach>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_C')">
                <div class="container">
                    <p class="h4 mb-4">Tin tuyển dụng</p>
                    <c:forEach var="item" items="${Tintuyendungs}">
                        <div class="row mt-4 d-flex" style="border: 2px solid appworkspace;">

                            <div class="col-sm-3" >
                                <a href="/detail?id=${item.id}" >
                                    <c:if test="${item.idEmployer.logo.startsWith('http') == true}">
                                        <img src="${item.idEmployer.logo}" class="img-fluid" style="width: 170px;">
                                    </c:if>
                                    <c:if test="${item.idEmployer.logo.startsWith('http') == false}">
                                        <img src="/resources/images/${item.idEmployer.logo}" class="img-fluid" style="width: 170px;">
                                    </c:if>
                                </a> 
                            </div>
                            <div class="col-sm-6">
                                <a href="/detail?id=${item.id}" >
                                    <p class="h5 text-dark">${item.idEmployer.title}</p><br>
                                    <p>${item.title}</p></a>
                            </div>

                            <div class="col-sm-3 d-flex">
                                <a href="<c:url value='/addDontuyendung' />?id=${item.id}" class="btn btn-warning align-self-center" >Ứng tuyển</a>
                            </div>
                        </div>
                    </c:forEach>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_E')">
                    <p class="text-center h3 mb-3 mt-3">Các ứng viên xung quanh bạn</p>
                    <%--<c:if test="${candidates != null && Tintuyendungs != null}">--%>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Họ và tên</th>
                                <th scope="col">Chuyên ngành</th>
                                <th scope="col">Công việc</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">CV</th>
                            </tr>
                        </thead>
                        <c:forEach items="${candidates}" var="item">

                            <tr>
                                <th>${item.fullname}</th>
                                <td>${item.major}</td>
                                <td>${item.idJob}</td>
                                <td>${item.phone}</td>
                                <td>${item.email}</td>
                                <td><a href="${item.cv}">Link</a></td>
                            </tr>
                    </div>
                </c:forEach>
                </table>
                <%--</c:if>--%>
            </sec:authorize>

        </c:if>
    </div>
</div>


