<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    try {
        String searchname = request.getParameter("searchname");
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesgeet" href="admin/styles.css">
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
                    var sn = $(this).attr('id1');
                    var album_code = $(this).attr('id2');
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
        <div class="imagebg bg-dark">
            <div>
                <p class="bgimage-text-1">Find the Best songs, beat by beat</p>
                <p class="bgimage-text-2">Spotifi gives you access to the best music, anywhere. Start searching for songs by artist, album or genre and create your own playlist to share with your friends</p>
            </div>
        </div><br>
            <h1 class="text-dark headingfont-1 text-center"><u>Albums</u></h1>
                <div class="container">
                    <div class="row">
<%
    Statement st = cn.createStatement(); 
    ResultSet rs1 = st.executeQuery("select * from album where album_name like'%" + searchname + "%'");
    while (rs1.next()) {
%>                  
                        <div class="col-4 col-sm-4 col-md-3 col-lg-3 col-xl-3" >
                            <a href="show_songs.jsp?id=<%=rs1.getString("code")%>">
                                <img src="album/<%=rs1.getString("code")%>/<%=rs1.getString("code")%>.jpg" class="img-fluid albumimg">
                                <h3 class="text-dark text-left headingfont-2"><%=rs1.getString("album_name")%></h3>
                            </a>
                        </div>
<%
    }
%>
                    </div><hr>
                </div>
                <h1 class="text-dark headingfont-1 text-center"><u>Songs</u></h1>
                    <div class="container mt-5">
                        <div class="row">
<%
  ResultSet rs2=st.executeQuery("select * from song where title like'%" + searchname + "%'");                
  while(rs2.next()){
%>
                            <div class="col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
                                <div class="row">
                                    <div class="col-3">
                                        <img src="album/<%=rs2.getString("album_code")%>/<%=rs2.getString("album_code")%>.jpg" class="songimg" >
                                    </div>
                                    <div class="col-7">
                                        <h3 class="text-dark headingfont-3"><%=rs2.getString("title")%></h3>
                                    </div>
                                    <div class="col-2">
                                        <i class="fa fa-play text-dark" id1="<%=rs2.getInt("sn")%>" id2="<%=rs2.getString("album_code")%>"></i>
                                        <i class="fa fa-pause text-dark d-none" id1="<%=rs2.getInt("sn")%>" id2="<%=rs2.getString("album_code")%>"></i>
                                    </div>
                                </div><br>
                            </div>
<%
    }
%>
                        </div>
                        <div class="col-12 centerimg-2">
                            <div id="player">
                                <audio controls id="audioPlayer">     
                                    <source src="" id="main" type="audio/mp3">                   
                                </audio>
                            </div>
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