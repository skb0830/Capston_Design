<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<jsp:include page='./inc/header.jsp' />
</head>

<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page='./inc/aside.jsp' />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<jsp:include page='./inc/nav.jsp' />



		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*,java.util.*"%>

		<%
			String notice_id = request.getParameter("no");
			String Title = "";
			String Content = "";
			String last_date = "";
			String last_editor = "";
			int i_editor = -1;

			//로그인 확인
			String sess = (String) session.getAttribute("email");

			// 데이터베이스 연결 정보
			String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
			String username = "manager";
			String password = "1234";

			// 데이터베이스 연결 및 문서 조회 처리
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			int user_auth = 0; //권한	
			try {
				
				
				int cnt_row = 0;
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);

				String sql ="";
				if (sess != null && !"null".equals(sess)) {
					sql = "SELECT * FROM Users where Email=? ";
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, sess);
					rs = stmt.executeQuery();
					while(rs.next()){
						user_auth = rs.getInt("auth");
					}

				}
				
				// 모든 문서를 조회
				sql = "SELECT * FROM Notice where notice_id=? ";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, notice_id);
				rs = stmt.executeQuery();
								
				// 조회된 문서 출력

				while (rs.next()) {
					//내용
					Title = rs.getString("Title");
					Content = rs.getString("Content");
					i_editor = rs.getInt("AuthorID");
					last_date = rs.getString("CreatedTime");
					cnt_row = rs.getRow();
				}

				if (cnt_row == 0) { // 내용이 없으면

					Content = "내용이 없습니다.<br/>";
				} else { //있으면 나머지 정보 가져오기
					stmt = conn.prepareStatement("Select * from Users where UserID = ?");
					stmt.setInt(1, i_editor);
					rs = stmt.executeQuery();

					while (rs.next()) {
						//내용
						last_editor = rs.getString("Username");
						cnt_row = rs.getRow();
					}

				}

			} catch (SQLException ex) {
				ex.printStackTrace();
				out.println("문서 조회 중 오류가 발생했습니다.");
			} catch (ClassNotFoundException ex) {
				ex.printStackTrace();
				out.println("문서 조회 중 오류가 발생했습니다.");
			} finally {
				// 연결 및 리소스 해제
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
		%>

		<div class="container-fluid py-sm-4">
			<div class="row">
				<div class="col-0 col-lg-2"></div>
				<div class="col-12 col-lg-8">
					<div class="card h-100">
						<div class="card-header">
							<h3><%=Title%>
								<p class="m-0" style="color: #bababa; font-size: 10px;">
									마지막 작성 시간 :
									<%=last_date%>
									<br /> 작성자 :
									<%=last_editor%></p>
							</h3>
						</div>
						<div class="card-body p-3">
							<div class="row">
								<div class="col-12">
								
									<%=Content%>
								</div>
								<div class="col-6 mt-4">
								<button class="btn btn-secondary" type="button" onClick="location.href='list_notice.jsp'">
								목록
								</button> 
								
								
								</div>
								<div class="col-6">
									<%
										//로그인 확인
										String str_btn = "";

										if (user_auth == 10) {
											str_btn = "<div class=\"text-end\"><button type=\"button\" onClick=\"location.href='create_notice.jsp?no="
													+ notice_id + "'\"";

											str_btn += "class=\"btn mb-0 btn-success\">내용 수정하기";

											str_btn += "</button> </div>";

										}
									%>
									<%=str_btn%>

								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-0 col-lg-2"></div>
			</div>

		</div>
	</main>

	<!--   Core JS Files   -->
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="../assets/js/soft-ui-dashboard.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>

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
