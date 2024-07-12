<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    try {
        if(request.getParameter("id").trim().length()==0){
            response.sendRedirect("edit_song.jsp?emptyid=1");
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
                    if(request.getParameter("song").trim().length()==0){
                        response.sendRedirect("edit_song.jsp?empty=1");
                    }
                    else{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                        String song=request.getParameter("song");
                        PreparedStatement ps=cn.prepareStatement("update song set title=? where sn=?");
                        ps.setString(1,song);
                        ps.setString(2,code);
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