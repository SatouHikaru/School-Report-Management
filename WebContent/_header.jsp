<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<header class="main-header">
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/trangchu" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>N</b>5</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Nhóm</b> 5</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
		<input value="<%=session.getAttribute("maGV") %>" type="hidden"/>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs"> <%= session.getAttribute("userName") %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                 <%=session.getAttribute("userName") %>
                </p>
              </li>
              
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="doimatkhau" class="btn btn-default btn-flat">Đổi mật khẩu</a>
                </div>
                <div class="pull-right">
                  <a href="dangxuat" class="btn btn-default btn-flat">Đăng xuất</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>