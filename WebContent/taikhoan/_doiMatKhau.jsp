<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<div class="content">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">Đổi mật khẩu</h3>
				</div>
				<div class="box-body">
					<!-- Công cụ lọc -->
					<div class="row">
						<div class="col-md-6">
							<form method="post" action="doimatkhau">
								<div class="box-body">								
									<div class="form-group">
										<label for="exampleInputPassword1">Mật khẩu cũ</label> <input
											type="password" class="form-control" name="oldPassword"
											id="exampleInputPassword1" placeholder="">
									</div>
									
									<div class="form-group">
										<label for="exampleInputPassword1">Mật khẩu mới</label> <input
											type="password" class="form-control" name="newPassword"
											id="exampleInputPassword1" placeholder="">
									</div>
									
									<div class="form-group">
										<label for="exampleInputPassword1">Xác nhận mật khẩu</label> <input
											type="password" class="form-control" name="password"
											id="exampleInputPassword1" placeholder="">
									</div>
									
								</div>
								<!-- /.box-body -->
								
								<p style="color: red">${ message }</p>
								
								<div class="box-footer">
									<button type="submit" value="submit" name="submit" class="btn btn-flat btn-primary">Lưu lại</button>
									<a href="" class="btn btn-default btn-flat">Trở về</a>
								</div>
							</form>
						</div>
	
					</div>
	
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</body>
</html>