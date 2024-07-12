<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
     try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
%>
<div class="container-fluid footer mt-5">
    <div class="row mt-3 text-center" style="justify-content:space-between">
        <div class="col-3 col-sm-3 col-md-3 col-lg-2 col-xl-2 text-center mb-5">
            <p class="footerhd"><u>Categories</u></p>
<%
            Statement st = cn.createStatement();  
            ResultSet rs2=st.executeQuery("select * from category");                
            while(rs2.next()){
%>
            <a href="show_albums.jsp?id=<%=rs2.getString("code")%>" class="ftcontent"><%=rs2.getString("category")%></a><br>
<%
                }
%>
        </div>
        <div class="col-3 col-sm-3 col-md-3 col-lg-2 col-xl-2 text-center">
            <p class="footerhd"><u>Communities</u></p>
            <a href="about.jsp" class="ftcontent">For Artists</a><br>
            <a href="jobs.jsp" class="ftcontent">Developers</a><br>
            <a href="record.jsp" class="ftcontent">Advertising</a><br>
            <a href="jobs.jsp" class="ftcontent">Investors</a><br>
            <a href="record.jsp" class="ftcontent">Vendors</a><br>
        </div>
        <div class="col-3 col-sm-3 col-md-3 col-lg-2 col-xl-2 text-center">
            <p class="footerhd"><u>Useful Links</u></p>
            <a href="support.jsp" class="ftcontent">Support</a><br>
            <a href="mobile.jsp" class="ftcontent">Mobile App</a><br>
        </div>
    </div>
</div>      
<%
                    cn.close();
                }   
            catch(Exception er){
                out.println(er.getMessage());
            }
%>