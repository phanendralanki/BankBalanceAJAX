
<%@page import="java.sql.*;"%>
<%@page import="org.json,simple.JSONArray;"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.JSONParser.ParseException"%>

<% 
    JSONArray list = new JSONArray();
    Connection con;
    PreparedStatement pst;
    ResultSet rs; 

    Class.forName("com.mysql.jdbc.Driver");
    String accno = request.getParameter("ano");
    
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankAjax","root","user");
    
    pst = con.prepareStatement("select *from bank where accno =?");
    
    pst.setString(1,accno);
    
    rs = pst.executeQuery();
    
    if(rs.next()==true){
        String name = rs.getString("accname");
        String balance = rs.getString("balance");
        
        JSONObject obj = new JSONObject();
        
        obj.put("name",name);
        obj.put("balance",balance);
        
        list.add(obj);
    }

out.println(list.toJSONString());
out.flush();
%>

