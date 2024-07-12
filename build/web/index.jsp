<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");
%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel ="stylesheet" href="styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div class="imagebg bg-dark">
            <div class="mx-5">
                <p class="bgimage-text-1">Find the Best songs, beat by beat</p>
                <p class="bgimage-text-2">Musically gives you access to the best music, anywhere. Start searching for songs by artist, album or genre and create your own playlist to share with your friends.</p>
            </div>
        </div><br>
        <%
            PreparedStatement ps1 = cn.prepareStatement("select * from category");
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
        %>
        <div class="container">
            <h3 class="text-dark headingfont-1"><u><%=rs1.getString("category")%></u></h3>
            <div class="row">
                <%
                    PreparedStatement ps2 = cn.prepareStatement("select * from album where cat_code=?");
                    ps2.setString(1, rs1.getString("code"));
                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
                %>
                <div class="col-4 col-sm-4 col-md-3 col-lg-3">
                    <a href="show_songs.jsp?id=<%=rs2.getString("code")%>">               
                        <img src="album/<%=rs2.getString("code")%>/<%=rs2.getString("code")%>.jpg" class="img-fluid albumimg"><br>
                        <h4 style="text-align:left" class="text-dark headingfont-2"><%=rs2.getString("album_name")%></h4><br>
                    </a>
                </div>
                <%
                        }
                %>
            </div>
        </div>
<%
                            }
%>
        <jsp:include page="footer.jsp" />
    </body>
</html>
<%
        cn.close();
    } catch (Exception er) {
        out.println(er.getMessage());
    }
%>