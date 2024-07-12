<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    try{
        if(request.getParameter("id").trim().length()==0){
            response.sendRedirect("show_album.jsp?emptyid=1");
        }
        else{
            Cookie c[]=request.getCookies();
            String email=null;
            String code=request.getParameter("id");
            for(int i=0;i<c.length;i++){
                if(c[i].getName().equals("login")){
                    email=c[i].getValue();
                    break;
                }
            }
            if(email==null){
                  response.sendRedirect("index.jsp");
            }
            else{
                  try{
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                      PreparedStatement ps=cn.prepareStatement("delete from album where code='"+code+"'");
                      PreparedStatement ps1=cn.prepareStatement("delete from song where album_code='"+code+"'");
                      ps1.executeUpdate();
                      if(ps.executeUpdate()>0){
                        out.println("Success");
                      }
                      else{
                        out.println("Error");
                      }
                    cn.close();
                }
                catch(Exception er){
                    response.sendRedirect(er.getMessage());
                }
            }
        }
  }
  catch(Exception e){
      out.println("dashboard.jsp");
  }  
%>