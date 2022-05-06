<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/" />">
            <img src="https://res.cloudinary.com/thanhsang123/image/upload/v1644411033/logo_za7jii.png" style="width: 250px;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link"  href="<c:url value="/" />" style="font-size: 20px;">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="font-size: 20px;">Tìm việc IT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="font-size: 20px;">Kết nối</a>
                </li>
                <sec:authorize access="hasRole('ROLE_A')">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/admin/statistics" />" style="font-size: 20px;">Thống kê</a>
                    </li> 
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_E')">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/e/addTintuyendung" />" style="font-size: 20px;">Tạo tin</a>
                    </li> 
                </sec:authorize>

                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/dangnhap" />" style="font-size: 20px;">Đăng nhập</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="font-size: 20px; cursor: pointer;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Đăng ký
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="<c:url value="/register" />?type=1">Nhà tuyển dụng</a>
                            <a class="dropdown-item" href="<c:url value="/register" />?type=2">Ứng viên</a>
                        </div>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name != null}">

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" style="font-size: 20px; cursor: pointer;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Hello ${pageContext.request.userPrincipal.name}
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <sec:authorize access="hasRole('ROLE_C')">
                                <a class="nav-link" style="font-size: 15px;" href="<c:url value="/c/edit"/>">Thông tin tài khoản</a>
                            </sec:authorize>                            
                            <a class="nav-link" style="font-size: 15px;" href="<c:url value="/logout" />">Đăng xuất</a>
                        </div>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>