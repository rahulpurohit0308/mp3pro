<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    try {
        if(request.getParameter("id").trim().length()==0){
            response.sendRedirect("show_song.jsp?emptyid=1");
        }
        else{
            if(request.getParameter("title").trim().length()==0 || request.getParameter("descrip").trim().length()==0){
                response.sendRedirect("show_song.jsp?empty=1");
            }
            else{
                String title = request.getParameter("title");
                String descrip = request.getParameter("descrip");
                String dt = new java.util.Date() + "";
                String code = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select MAX(sn) from song");
                int sn = 0;
                if (rs.next()) {
                    sn = rs.getInt(1);
                }
                sn++;
                PreparedStatement ps = cn.prepareStatement("insert into song values (?,?,?,?,?)");
                ps.setInt(1, sn);
                ps.setString(2, title);
                ps.setString(3, descrip);
                ps.setString(4, dt);
                ps.setString(5, code);
                if (ps.executeUpdate() > 0) {
%>
                    <div class="sales-report-area mt-5 mb-5">
                        <div class="col-12 mt-5">
                            <h3>Add Song :</h3>
                            <div class="card">
                                <div class="card-body">        
                                    <div class="form-control">
                                        <form method="post" ACTION="add_song.jsp?id=<%=code%>&sn=<%=sn%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                                            <b>Add Song</b> <input type="file" name="uploadFile" size="40" style="border:1px solid black;">
                                            <input type="submit" name="Submit" class="btn btn-primary" style="border:1px solid black;" value="Submit">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%
                } 
                else{
                    response.sendRedirect("album.jsp?id=" + code);
                }
            }
        }
    }
    catch (Exception er){
        out.println(er.getMessage());
    }
%>