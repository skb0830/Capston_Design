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
			//로그인 없이 접근
			String sess = (String) session.getAttribute("email");
			if (sess == null || "null".equals(sess)) {
				out.println("<script>");
				out.println("alert(\"비정상적인 접근입니다.\");");
				out.println("history.back();");
				out.println("</script>");
			}
			
			String Title = "";
			String Content = "";
			String notice_id = request.getParameter("no");
			if(notice_id == null || "null".equals(notice_id)){
				notice_id = "-1";
			}

			// 데이터베이스 연결 정보
			String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
			String username = "manager";
			String password = "1234";
			// 데이터베이스 연결 및 문서 조회 처리
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);

				// 모든 문서를 조회
				String sql = "select * from Notice where notice_id=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, notice_id);
				rs = stmt.executeQuery();
				// 조회된 문서 출력		        
				while (rs.next()) {
					//내용
					Title = rs.getString("Title");
					Content = rs.getString("Content");
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

		<div class="container-fluid py-sm-4 p-0">
			<div class="row">
				<div class="col-xl-2 col-sm-0"></div>
				<div class="col-xl-8 col-sm-12">
					<div class="card h-100">
						<form action="create_notice_process.jsp" method="post">
							<div class="card-header pb-0">
								<div class="row">
									<div class="col form-group">
										<label for="example-text-input" class="form-control-label">제목</label>
										<input class="form-control" type="text" value="<%=Title %>" name="title"
											id="title"> <input class="d-none" type="text"
											value="<%=notice_id%>" name="notice_id" id="notice_id">
									</div>
								</div>
							</div>
					<div class="card-body pt-0">
					<div class="row">
					    	<div class="col form-group mb-0">
						        <label for="example-text-input" class="form-control-label">내용</label>
						    </div>
					    </div>
						<div class="row">
							<div class="col">
								<textarea id="content" name="content"><%=Content%></textarea>
							</div>
						</div>
						<div class="row pt-2">
							<div class="col text-end">
								<button type="submit" class="btn bg-gradient-dark mb-0">작성</button>
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
