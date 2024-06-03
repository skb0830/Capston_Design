<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
    String username = "manager";
    String password = "1234";

    // 입력된 이메일과 비밀번호 가져오기
    String email = request.getParameter("email");
    String inputPassword = request.getParameter("password");

    // 데이터베이스 연결 및 쿼리 실행
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // 데이터베이스 연결
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        // 사용자 인증을 위한 쿼리 작성
        String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, inputPassword);
        rs = stmt.executeQuery();

        // 결과 확인하여 로그인 처리
        if (rs.next()) {
            // 로그인 성공
            // 세션에 사용자 이메일을 저장합니다.
            session.setAttribute("email", email);
            // 로그인 성공 후 페이지로 리다이렉트합니다.
            response.sendRedirect("welcome.jsp");
        } else {
            // 로그인 실패
            out.println("Invalid email or password. Please try again.");
            response.sendRedirect("login.jsp?f=1");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
    } finally {
        // 연결 및 리소스 해제
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>


