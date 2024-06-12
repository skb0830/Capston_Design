<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">

<head>

<jsp:include page='./inc/header.jsp' />
</head>

<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page='./inc/aside.jsp' />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<jsp:include page='./inc/nav.jsp' />

		<%
		
			String username = "";
			String email = "";
			String password = "";
			String confirmPassword = "";

			String check = request.getParameter("check");
			boolean username_null = false;
			boolean email_null = false;
			boolean password_null = false;
			boolean confirmPassword_null = false;

			boolean is_diff_pw = false;
			String err_msg = "";

			boolean is_regi_success = false;

			//빈칸 확인
			if (check != null && check != "null") {
				username = request.getParameter("username");
				email = request.getParameter("email");
				password = request.getParameter("password");
				confirmPassword = request.getParameter("confirm_password");
				out.println(username);

				if (username == "")
					username_null = true;
				if (email == "")
					email_null = true;
				if (password == "")
					password_null = true;
				if (confirmPassword == "")
					confirmPassword_null = true;

			}
		%>
		<div class="container">
			<div class="row mt-5">
				<div class="col-xl-4 col-lg-5 col-md-7 mx-auto">
					<div class="card z-index-0">
						<div class="card-header text-center pt-4">
							<h5>회원가입</h5>
						</div>
						<div class="card-body">
							<form action="register2.jsp?check=1" method="post"
								role="form text-left">
								<div class="mb-3">
									<div
										class="form-group <%if (username_null)
				out.println("has-danger");%>">
										<input type="text" name="username"
											class="form-control <%if (username_null)
				out.println("is-invalid");%>"
											placeholder="사용자명" value="<% out.println(username);%>" />
									</div>
								</div>
								<div class="mb-3">
									<div
										class="form-group <%if (email_null)
				out.println("has-danger");%>">
										<input type="email" name="email"
											class="form-control <%if (email_null)
				out.println("is-invalid");%>"
											placeholder="이메일" value="<%=email%>">
									</div>
								</div>
								<div class="mb-3">
									<div
										class="form-group <%if (password_null)
				out.println("has-danger");%>">
										<input type="password" name="password"
											class="form-control <%if (password_null)
				out.println("is-invalid");%>"
											placeholder="비밀번호" value="<%=password%>">
									</div>
								</div>


								<div class="mb-3">
									<div
										class="form-group <%if (confirmPassword_null)
				out.println("has-danger");%>">
										<input type="password" name="confirm_password"
											class="form-control <%if (confirmPassword_null)
				out.println("is-invalid");%>"
											placeholder="비밀번호 확인" value="<%=confirmPassword%>">
									</div>
								</div>
								<p class="text-sm mt-0 mb-0" style="color: #ea0606;"><%=err_msg%></p>
								<div class="form-check form-check-info text-left">
									<input class="form-check-input" type="checkbox" value=""
										id="flexCheckDefault" checked=""> <label
										class="form-check-label" for="flexCheckDefault"> I
										agree the <a href="javascript:;"
										class="text-dark font-weight-bolder">정보 수집 동의 ?</a>
									</label>
								</div>
								<div class="text-center">
									<button type="submit"
										class="btn bg-gradient-dark w-100 my-4 mb-2">회원가입</button>
								</div>
								<p class="text-sm mt-3 mb-0">
									<a href="javascript:;" class="text-dark font-weight-bolder">계정
										찾기</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>

		</div>
	</main>

	<!--   Core JS Files   -->
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>

	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
</body>

</html>
