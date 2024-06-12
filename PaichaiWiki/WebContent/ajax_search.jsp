<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ page import="org.json.simple.*"%>

<%
 	
    request.setCharacterEncoding("utf-8");
    String search = request.getParameter("search_txt");
    JSONArray parser = new JSONArray();
    
    if(search!="null" && !"null".equals(search)){
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
            String sql = "SELECT DISTINCT title FROM pages WHERE title LIKE ? order by title limit 10;";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, "%" + search + "%");
            rs = stmt.executeQuery();
            // 조회된 문서 출력
            
            while (rs.next()) {
            	JSONObject obj = new JSONObject();
            	String rs_text = rs.getString("Title");
            	if(rs_text == "") continue;
            		obj.put("title",rs_text);
            	
           		parser.add(rs_text);
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
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    	
    }
%>

<%out.print(parser.toString());%>