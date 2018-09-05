<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%= session.getAttribute("userName") %></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
        <%
      	if (session.getAttribute("admin") != null) {
      %>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Tìm nhanh menu...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Danh mục</li>
        
        <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/trangChu.jsp' ? 'active' : ''}">
          <a href="${pageContext.request.contextPath}/trangchu">
            <i class="fa fa-book"></i> <span>Trang chủ</span>
          </a>          
        </li>
        
        <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/hocba/danhSach.jsp' ? 'active' : ''}">
          <a href="${pageContext.request.contextPath}/danhsachhocba">
            <i class="fa fa-book"></i> <span>Quản lý học bạ</span>
          </a>          
        </li>
        
         <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Quản lý học sinh</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/hocsinh/danhSach.jsp' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/danhsachhocsinh"><i class="fa fa-circle-o"></i> Danh sách</a></li>
            <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/hocsinh/them.jsp' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/themhocsinh"><i class="fa fa-circle-o"></i> Thêm mới</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-university"></i> <span>Quản lý lớp</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/lop/danhSach.jsp' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/danhsachlop"><i class="fa fa-circle-o"></i> Danh sách</a></li>
            <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/lop/them.jsp' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/LopFormServlet?maLop=0"><i class="fa fa-circle-o"></i> Thêm mới</a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-users"></i> <span>Quản lý giáo viên</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/giaovien/danhSach.jsp' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/danhsachgiaovien"><i class="fa fa-circle-o"></i> Danh sách</a></li>
            <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/giaovien/them.jsp' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/themgiaovien"><i class="fa fa-circle-o"></i> Thêm mới</a></li>
          </ul>
        </li>
        
        <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/diem/danhSachLop.jsp' ? 'active' : ''}">
          <a href="${pageContext.request.contextPath}/DanhSachLopCuaGiaoVien?maGV=1&maHK=1">
            <i class="fa fa-bullseye"></i> <span>Quản lý điểm</span>
          </a>
        </li>
        
        <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/monhoc/danhSach.jsp' ? 'active' : ''}">
          <a href="${pageContext.request.contextPath}/danhsachmonhoc">
            <i class="fa fa-language"></i> <span>Quản lý môn học</span>
          </a>
        </li>
       
        <li class="${pageContext.request.requestURI eq '/QuanLyHocBa/phuhuynh/danhSach.jsp' ? 'active' : ''}">
          <a href="${pageContext.request.contextPath}/danhsachphuhuynh">
            <i class="fa fa-male"></i> <span>Quản lý phụ huynh</span>
          </a>
        </li>
        
        <li class="#">
          <a href="#">
            <i class="fa fa-book"></i> <span>Quản lý liên lạc</span>
          </a>
        </li>
       <%} %>
        </ul>
    </section>
    <!-- /.sidebar -->
  </aside>