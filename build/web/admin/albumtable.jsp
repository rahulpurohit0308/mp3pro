<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="styles.css">
<table class="dbkit-table">
    <tbody class="tbody">
<%
    try{
        Cookie c[]=request.getCookies();
        String email=null;
        for(int i=0; i<c.length; i++){
            if(c[i].getName().equals("login")){
                email = c[i].getValue();
                break;
            }
        }
        if(email==null){
            response.sendRedirect("index.jsp");
        }
        else{
            try{
                String code = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                Statement st=cn.createStatement();
                ResultSet rs = st.executeQuery("select * from album where cat_code='"+code+"'");
                while(rs.next()){
%>
                    <tr id="<%=rs.getString("code")%>">
			<td><%=rs.getString("album_name")%></td>
                        <td><a href="show_song.jsp?id=<%=rs.getString("code")%>" id="album"><i>Show Songs</i></a></td>
                        <td id="edit"><i rel="<%=rs.getString("code")%>" class="editt"><span class="fa fa-edit"></span></i></td>
                        <td id="delete"><i rel="<%=rs.getString("code")%>" class="deletee"><span class="fa fa-trash"></span></i></td>
                    </tr>
<%
                }
                cn.close();
            }   
            catch(Exception e){
                out.println(e.getMessage());
            }
        }
    }
    catch(Exception er){
        response.sendRedirect("search.jsp");
    }
%>
    </tbody>
</table>