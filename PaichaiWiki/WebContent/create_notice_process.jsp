<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	//로그인 없이 접근
	String sess = (String) session.getAttribute("email");
	if (sess == null || "null".equals(sess)) {
		out.println("<script>");
		out.println("alert(\"비정상적인 접근입니다.\");");
		out.println("history.back();");
		out.println("</script>");
	}

	// 데이터베이스 연결 정보
	String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
	String username = "manager";
	String password = "1234";

	// 사용자가 입력한 정보 가져오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String notice_id = request.getParameter("notice_id");

	// 데이터베이스 연결 및 문서 작성 처리
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, username, password);

		//사용자 id 가져오기 
		String id_sql = "Select * from Users where email = ?";
		stmt = conn.prepareStatement(id_sql);
		stmt.setString(1, sess);
		rs = stmt.executeQuery();

		int user_id = -1;
		String user_name = "";
		while (rs.next()) {
			user_id = rs.getInt("UserID");
			user_name = rs.getString("Username");
		}
		
		String sql = "";
		int auto_increase = 0;
		int rowsAffected = 0;
		if("-1".equals(notice_id)){ // 신규
			sql = "INSERT INTO Notice (Title, Content, AuthorID,AuthorName) VALUES (?, ?, ?,?)";
			stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setInt(3, user_id);
			stmt.setString(4, user_name);

			rowsAffected = stmt.executeUpdate();
			
			rs = stmt.getGeneratedKeys();
			if (rs.next()) {
				auto_increase = rs.getInt(1);
			}
		}else{ // 수정
			sql = "update Notice set Title=? , Content=? , AuthorID=? , AuthorName=? where notice_id=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, content);
			stmt.setInt(3, user_id);
			stmt.setString(4, user_name); 
			stmt.setString(5, notice_id);
			
			rowsAffected = stmt.executeUpdate();
			auto_increase = Integer.parseInt(notice_id);
			
		}
		
		
		// 문서 작성 성공 여부 확인
		if (rowsAffected > 0) {
			out.println("<script>");
			out.println("alert(\"문서 작성이 완료되었습니다!\");");
			out.println("location.replace(\"/view_notice.jsp?no=" + auto_increase + "\")");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert(\"문서 작성 중 오류가 발생했습니다. 다시 시도해주세요.\");");
			out.println("history.back();");
			out.println("</script>");
		}
	} catch (SQLException ex) {
		ex.printStackTrace();
		out.println("문서 작성 중 오류가 발생했습니다. 다시 시도해주세요.");
	} catch (ClassNotFoundException ex) {
		ex.printStackTrace();
		out.println("문서 작성 중 오류가 발생했습니다. 다시 시도해주세요.");
	} finally {
		// 연결 및 리소스 해제
		try {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}
%>
