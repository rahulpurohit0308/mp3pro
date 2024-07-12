<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    try {
        String code = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel ="stylesheet" href="styles.css">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script src="jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function() {
                var audio = document.getElementById('audioPlayer');
                var isPaused = false;
                var resumePosition = 0;
                var currentPlayingSong = null;
                $(".fa-play").click(function() {
                    var sn = $(this).attr('id');
                    var album_code = "<%=code%>";
                    audio.src = "album/" + album_code + "/" + sn + ".mp3";
                    if (currentPlayingSong && currentPlayingSong !== this) {
                        $(currentPlayingSong).siblings(".fa-pause").addClass("d-none");
                        $(currentPlayingSong).removeClass("d-none");
                        $(currentPlayingSong).siblings(".fa-play").addClass("d-none");
                        currentPlayingSong = null;
                    }
                    if (isPaused) {
                        audio.currentTime = resumePosition;
                    }
                    audio.play();
                    $(this).addClass("d-none");
                    $(this).siblings(".fa-pause").removeClass("d-none");
                    currentPlayingSong = this;
                    isPaused = false;
                });

                $(".fa-pause").click(function() {
                    audio.pause();
                    resumePosition = audio.currentTime;
                    $(this).addClass("d-none");
                    $(this).siblings(".fa-play").removeClass("d-none");
                    isPaused = true;
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div class="container mscontent">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 centerimg">      
                    <img src="album/<%=code%>/<%=code%>.jpg" class="albumimg-2"><br>
                </div>
                <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 bg-secondary centersong">
<%
    Statement st = cn.createStatement();
    ResultSet rs2 = st.executeQuery("select * from song where album_code='" + code + "'");
    while(rs2.next()) {
%>                  
                    <div class="row mt-3">
                        <h3 class="text-light col-10"><%=rs2.getString("title")%></h3> 
                        <i class="fa fa-play text-light mt-2" id="<%=rs2.getInt("sn")%>"></i>
                        <i class="fa fa-pause text-light mt-2 d-none"></i>
                    </div><hr>
<%
    }
%>
                </div>
            </div><br>
            <div class="row">       
<%
        ResultSet rs3 = st.executeQuery("select * from song where album_code='" + code + "'");
        if(rs3.next()) {
%> 
                <div id="player" class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6 centerimg">
                    <audio controls id="audioPlayer">     
                        <source src="album/<%=rs3.getString("album_code")%>/<%=rs3.getInt("sn")%>.mp3" id="main" type="audio/mp3">                   
                    </audio>
                </div>
<%
    }
%>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
<%
        cn.close();
    } catch (Exception er) {
        out.println(er.getMessage());
    }
%>