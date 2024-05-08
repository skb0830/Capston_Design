<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // 데이터베이스 연결 정보
    String url = "jdbc:mysql://localhost:3306/PaichaiwikiDB";
    String dbUsername = "manager";
    String dbPassword = "1234";

    // 사용자가 입력한 정보 가져오기
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");

    // 비밀번호 일치 여부 확인
    if (!password.equals(confirmPassword)) {
        out.println("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
        return; // 비밀번호가 일치하지 않으면 회원가입을 중단합니다.
    }

    // 데이터베이스 연결 및 회원가입 처리
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // 회원가입 정보를 Users 테이블에 삽입
        String sql = "INSERT INTO Users (Username, Email, Password) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, password);
        int rowsAffected = stmt.executeUpdate();

        // 회원가입 성공 여부 확인
        if (rowsAffected > 0) {
            out.println("회원가입이 완료되었습니다!");
        } else {
            out.println("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
        out.println("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
    } catch (ClassNotFoundException ex) {
        ex.printStackTrace();
        out.println("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
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
