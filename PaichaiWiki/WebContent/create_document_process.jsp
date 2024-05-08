<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<% 
	request.setCharacterEncoding("UTF-8");
%>

<%
    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB?useUnicode=true&characterEncoding=UTF-8";

    String username = "manager";
    String password = "1234";

    // 사용자가 입력한 정보 가져오기
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // 데이터베이스 연결 및 문서 작성 처리
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // 문서 정보를 Pages 테이블에 삽입
        String sql = "INSERT INTO Pages (Title, Content) VALUES (?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, content);
        int rowsAffected = stmt.executeUpdate();

        // 문서 작성 성공 여부 확인
        if (rowsAffected > 0) {
            out.println("문서 작성이 완료되었습니다!");
        } else {
            out.println("문서 작성 중 오류가 발생했습니다. 다시 시도해주세요.");
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
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
