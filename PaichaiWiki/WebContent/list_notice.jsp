<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page='./inc/header.jsp' />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
</head>

<body class="g-sidenav-show  bg-gray-100">
	<jsp:include page='./inc/aside.jsp' />
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<jsp:include page='./inc/nav.jsp' />

		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*,java.util.*"%>
		<%
			request.setCharacterEncoding("utf-8");

			String sess = (String) session.getAttribute("email");

			// 데이터베이스 연결 정보
			String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
			String username = "manager";
			String password = "1234";
			// 데이터베이스 연결 및 문서 조회 처리
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			String str_viewtable = "";
			int user_auth=0;
			try {
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
				sql = "select * from Notice where is_open=1 order by CreatedTime desc;";
				stmt = conn.prepareStatement(sql);

				rs = stmt.executeQuery();
				while (rs.next()) {
					str_viewtable += "<tr>";
					str_viewtable += "<td>";
					str_viewtable += "<a href=\"view_notice.jsp?no=" + rs.getString("notice_id") + "\">" + rs.getString("Title") + "</a>";
					str_viewtable += "</td><td class=\"align-middle text-center\">";
					str_viewtable += rs.getString("AuthorName");
					str_viewtable += "</td><td class=\"align-middle text-center\">";
					str_viewtable += rs.getString("CreatedTime");
					str_viewtable += "</tr>";

					//내용
				}

			} catch (SQLException ex) {
				ex.printStackTrace();
				out.println("조회 중 오류가 발생했습니다.");
			} catch (ClassNotFoundException ex) {
				ex.printStackTrace();
				out.println("조회 중 오류가 발생했습니다.");
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

		<div class="container-fluid py-sm-4 p-0">
			<div class="row">
				<div class="col-xl-2 col-sm-0"></div>
				<div class="col-xl-8 col-sm-12">
					<div class="card h-100">
						<form action="create_notice.jsp" method="post">
							<div class="card-header pb-0">
								<div class="row ">
									<div class="col-6">
										<h3>공지사항</h3>
									</div>
									<%
										if (user_auth==10) {
									%>
									<div class="col-6 text-end">
										<button type="submit" class="btn btn-info mb-0 text-end">작성하기</button>
									</div>
									<%
										}
									%>
								</div>
							</div>
							<div class="card-body pt-0">
								<div class="table-responsive p-0">
									<div class="table align-items-center mb-0">
										<table class="table align-items-center mb-0">
											<thead>
												<tr>
													<th class="font-weight-bolder align-middle" style="width:70%;">제목</th>
													<th class="font-weight-bolder align-middle text-center">작성자</th>
													<th class="font-weight-bolder align-middle text-center">작성일</th>
												</tr>
											</thead>
											<tbody>
												<%=str_viewtable%>
											</tbody>
										</table>

									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div class="col-xl-2 col-sm-0"></div>
			</div>
		</div>
	</main>
	<!-- summernote -->
	<script>
		$(document)
				.ready(
						function() {
							$('#content')
									.summernote(
											{
												toolbar : [
														[ 'style', [ 'style' ] ],
														[
																'font',
																[
																		'bold',
																		'underline',
																		'clear' ] ],
														[ 'fontname',
																[ 'fontname' ] ],
														[ 'color', [ 'color' ] ],
														[
																'para',
																[ 'ul', 'ol',
																		'paragraph' ] ],
														[ 'table', [ 'table' ] ],
														[
																'insert',
																[
																		'link',
																		'picture',
																		'video' ] ],
														[ 'view', [ 'help' ] ], ],
												popover : {
													image : [
															[
																	'image',
																	[
																			'resizeFull',
																			'resizeHalf',
																			'resizeQuarter',
																			'resizeNone' ] ], ]
												},
												lang : 'ko-KR',
												height : 350,
												minHeight : 350,
												maxHeight : 350,
												focus : true,
												resize : false,
												disableDragAndDrop : true,

											});
						});
	</script>
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
