<%-- 
    Document   : change_pass.jsp
    Created on : 29 Mar, 2023, 3:29:33 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" import="java.sql.*,javax.servlet.http.Cookie" pageEncoding="UTF-8"%>

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
                    if(request.getParameter("cp").trim().length()==0 || request.getParameter("np").trim().length()==0 || request.getParameter("rp").trim().length()==0){
                        response.sendRedirect("change_pass.jsp?empty=1");
                    }
                    else{
                        String cp=request.getParameter("cp").trim();
                        String np=request.getParameter("np").trim();
                        String rp=request.getParameter("rp").trim();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                        Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
                        if(rs.next()){
                            if(cp.equals(rs.getString("password"))){
                                if(np.equals(rp)){
                                    PreparedStatement ps = cn.prepareStatement("update admin set password=? where email=?");
                                    ps.setString(1,np);
                                    ps.setString(2,email);
                                    if(ps.executeUpdate()>0){
                                        response.sendRedirect("dashboard.jsp?success=1");  
                                    }
                                    else{
                                        response.sendRedirect("changepass.jsp?again=1");  
                                    }
                                }
                                else{
                                     response.sendRedirect("changepass.jsp?mismatch=1");  
                                }
                            }
                            else{
                            response.sendRedirect("changepass.jsp?invalid_pass=1");
                            }
                        }
                        else{
                            response.sendRedirect("dashboard.jsp");
                        }
                    }
                }
            }
            catch(Exception er){
                out.println(er.getMessage());
            }
%>