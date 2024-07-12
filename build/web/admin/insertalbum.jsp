<%@page contentType="text/html" import="java.sql.*,java.util.*,java.io.File" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("id").trim().length()==0){
        response.sendRedirect("show_album.jsp?emptyid=1");
    }
    else{
        if(request.getParameter("album").trim().length()==0 || request.getParameter("des").trim().length()==0){
            response.sendRedirect("show_album.jsp?empty=1");
        }
            LinkedList l = new LinkedList();
            for (int i = 0; i <= 9; i++) {
                l.add(i + "");
            }
            for (char c = 'A'; c <= 'Z'; c++) {
                l.add(c + "");
            }
            for (char c = 'a'; c <= 'z'; c++) {
                l.add(c + "");
            }
            Collections.shuffle(l);
            String code = "";
            for (int i = 0; i < 8; i++) {
                code = code + l.get(i);
            }
            try {
                String album_name = request.getParameter("album");
                String des = request.getParameter("des");
                String dt = new java.util.Date() + "";
                String cat_code = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");
                Statement st = cn.createStatement();

                ResultSet rs = st.executeQuery("select MAX(sn) from album");
                int sn = 0;
                if (rs.next()) {
                    sn = rs.getInt(1);
                }
                sn++;
                code=code+"_"+sn;


                PreparedStatement ps = cn.prepareStatement("insert into album values (?,?,?,?,?,?)");

                ps.setInt(1, sn);
                ps.setString(2, code);
                ps.setString(3, album_name);
                ps.setString(4, des);
                ps.setString(5, dt);
                ps.setString(6, cat_code);

                if (ps.executeUpdate() > 0){
                    File fr = new File(request.getRealPath("/") + "/album/"+code);
                    fr.mkdir();
%>
                    <div class="sales-report-area mt-5 mb-5">
                        <div class="col-12 mt-5">
                            <h3>Add Album Image :</h3>
                            <div class="card">
                                <div class="card-body">        
                                    <div class="form-control">
                                        <form method="post" ACTION="file_upload_process.jsp?id=<%=code%>&catcode=<%=cat_code%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                                            <b>Add Image</b> <input type="file" name="uploadFile" size="40" style="border:1px solid black;">
                                            <input type="submit" name="Submit" class="btn btn-primary" style="border:1px solid black;" value="Submit">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<%
                } else {
                    out.println("Error");
                }
            
        } catch (Exception er) {
            out.println(er.getMessage());
        }
    }
%>