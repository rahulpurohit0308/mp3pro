<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    try {
        if(request.getParameter("id").trim().length()==0){
            response.sendRedirect("edit_album.jsp?emptyid=1");
        }
        else{
            Cookie c[]=request.getCookies();
            String code = request.getParameter("id");
            String email=null;
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
                    if(request.getParameter("album").trim().length()==0||request.getParameter("des").trim().length()==0){
                        response.sendRedirect("show_album.jsp?empty=1");
                    }
                    else{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                        String albumname=request.getParameter("album");
                        String des=request.getParameter("des");
                        PreparedStatement ps=cn.prepareStatement("update album set album_name=?, descrip=? where code=?");
                        ps.setString(1,albumname);
                        ps.setString(2,des);
                        ps.setString(3,code);
                        if(ps.executeUpdate()>0){
                            out.println("Success");
                        }
                        else{
                            out.println("Error");
                        }
                    }
                }
                catch(Exception er){
                    out.println(er.getMessage());
                }
            }
        }
    }
    catch(Exception e){
        out.println(e.getMessage());
    }
%>