<%@tag body-content="scriptless" description="Layout dùng chung"
	pageEncoding="UTF-8"%>
<%@attribute name="pageTitle" required="true" type="java.lang.String"%>
<html>
<head>
<title>${pageTitle}</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Theme style -->
<!-- DataTables -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/select2/dist/css/select2.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/app.css">
	
<!-- jQuery 3 -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>


</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-black sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/_header.jsp"></jsp:include>
		<jsp:include page="/_leftNav.jsp"></jsp:include>
		<div class="content-wrapper">
			<jsp:doBody />
		</div>
		<footer class="main-footer">
			<div class="container">
				<strong>Copyright &copy; 2018</strong>
			</div>
			<!-- /.container -->
		</footer>
	</div>
	<!-- ./wrapper -->


	<!-- Bootstrap 3.3.7 -->
	
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- DataTables -->
	<script src="${pageContext.request.contextPath}/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
		<script
	src="${pageContext.request.contextPath}/resources/js/datatable-base.js"></script>
	
	<script 
		src="${pageContext.request.contextPath}/resources/bower_components/select2/dist/js/select2.min.js"></script>
		
		<script 
		src="${pageContext.request.contextPath}/resources/bower_components/select2/dist/js/i18n/vi.js"></script>
		
	<script 
		src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/fastclick/lib/fastclick.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/js/sweetalert.min.js"></script>
	
	<script
		src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/deleteRecord.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/parsley/parsley.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/parsley/i18n/vi.js"></script>
	
	<script>
		$('#form').parsley();
	</script>
</body>
</html>
