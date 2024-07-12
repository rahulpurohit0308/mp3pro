package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\r');
      out.write('\n');

    try {
        String searchname = request.getParameter("searchname");
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <link rel=\"stylesgeet\" href=\"admin/styles.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link rel =\"stylesheet\" href=\"styles.css\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.4.js\" integrity=\"sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("        <script src=\"jquery-3.6.4.min.js\"></script>\r\n");
      out.write("        <script>\r\n");
      out.write("            $(document).ready(function() {\r\n");
      out.write("                var audio = document.getElementById('audioPlayer');\r\n");
      out.write("                var isPaused = false;\r\n");
      out.write("                var resumePosition = 0;\r\n");
      out.write("                var currentPlayingSong = null;\r\n");
      out.write("                $(\".fa-play\").click(function() {\r\n");
      out.write("                    var sn = $(this).attr('id1');\r\n");
      out.write("                    var album_code = $(this).attr('id2');\r\n");
      out.write("                    audio.src = \"album/\" + album_code + \"/\" + sn + \".mp3\";\r\n");
      out.write("                    if (currentPlayingSong && currentPlayingSong !== this) {\r\n");
      out.write("                        $(currentPlayingSong).siblings(\".fa-pause\").addClass(\"d-none\");\r\n");
      out.write("                        $(currentPlayingSong).removeClass(\"d-none\");\r\n");
      out.write("                        $(currentPlayingSong).siblings(\".fa-play\").addClass(\"d-none\");\r\n");
      out.write("                        currentPlayingSong = null;\r\n");
      out.write("                    }\r\n");
      out.write("                    if (isPaused) {\r\n");
      out.write("                        audio.currentTime = resumePosition;\r\n");
      out.write("                    }\r\n");
      out.write("                    audio.play();\r\n");
      out.write("                    $(this).addClass(\"d-none\");\r\n");
      out.write("                    $(this).siblings(\".fa-pause\").removeClass(\"d-none\");\r\n");
      out.write("                    currentPlayingSong = this;\r\n");
      out.write("                    isPaused = false;\r\n");
      out.write("                });\r\n");
      out.write("\r\n");
      out.write("                $(\".fa-pause\").click(function() {\r\n");
      out.write("                    audio.pause();\r\n");
      out.write("                    resumePosition = audio.currentTime;\r\n");
      out.write("                    $(this).addClass(\"d-none\");\r\n");
      out.write("                    $(this).siblings(\".fa-play\").removeClass(\"d-none\");\r\n");
      out.write("                    isPaused = true;\r\n");
      out.write("                });\r\n");
      out.write("            });\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "nav.jsp", out, false);
      out.write("\r\n");
      out.write("        <div class=\"imagebg bg-dark\">\r\n");
      out.write("            <div>\r\n");
      out.write("                <p class=\"bgimage-text-1\">Find the Best songs, beat by beat</p>\r\n");
      out.write("                <p class=\"bgimage-text-2\">Spotifi gives you access to the best music, anywhere. Start searching for songs by artist, album or genre and create your own playlist to share with your friends</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div><br>\r\n");
      out.write("            <h1 class=\"text-dark headingfont-1 text-center\"><u>Albums</u></h1>\r\n");
      out.write("                <div class=\"container\">\r\n");
      out.write("                    <div class=\"row\">\r\n");

    Statement st = cn.createStatement(); 
    ResultSet rs1 = st.executeQuery("select * from album where album_name like'%" + searchname + "%'");
    while (rs1.next()) {

      out.write("                  \r\n");
      out.write("                        <div class=\"col-4 col-sm-4 col-md-3 col-lg-3 col-xl-3\" >\r\n");
      out.write("                            <a href=\"show_songs.jsp?id=");
      out.print(rs1.getString("code"));
      out.write("\">\r\n");
      out.write("                                <img src=\"album/");
      out.print(rs1.getString("code"));
      out.write('/');
      out.print(rs1.getString("code"));
      out.write(".jpg\" class=\"img-fluid albumimg\">\r\n");
      out.write("                                <h3 class=\"text-dark text-left headingfont-2\">");
      out.print(rs1.getString("album_name"));
      out.write("</h3>\r\n");
      out.write("                            </a>\r\n");
      out.write("                        </div>\r\n");

    }

      out.write("\r\n");
      out.write("                    </div><hr>\r\n");
      out.write("                </div>\r\n");
      out.write("                <h1 class=\"text-dark headingfont-1 text-center\"><u>Songs</u></h1>\r\n");
      out.write("                    <div class=\"container mt-5\">\r\n");
      out.write("                        <div class=\"row\">\r\n");

  ResultSet rs2=st.executeQuery("select * from song where title like'%" + searchname + "%'");                
  while(rs2.next()){

      out.write("\r\n");
      out.write("                            <div class=\"col-12 col-sm-12 col-md-6 col-lg-6 col-xl-6\">\r\n");
      out.write("                                <div class=\"row\">\r\n");
      out.write("                                    <div class=\"col-3\">\r\n");
      out.write("                                        <img src=\"album/");
      out.print(rs2.getString("album_code"));
      out.write('/');
      out.print(rs2.getString("album_code"));
      out.write(".jpg\" class=\"songimg\" >\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-7\">\r\n");
      out.write("                                        <h3 class=\"text-dark headingfont-3\">");
      out.print(rs2.getString("title"));
      out.write("</h3>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"col-2\">\r\n");
      out.write("                                        <i class=\"fa fa-play text-dark\" id1=\"");
      out.print(rs2.getInt("sn"));
      out.write("\" id2=\"");
      out.print(rs2.getString("album_code"));
      out.write("\"></i>\r\n");
      out.write("                                        <i class=\"fa fa-pause text-dark d-none\" id1=\"");
      out.print(rs2.getInt("sn"));
      out.write("\" id2=\"");
      out.print(rs2.getString("album_code"));
      out.write("\"></i>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div><br>\r\n");
      out.write("                            </div>\r\n");

    }

      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"col-12 centerimg-2\">\r\n");
      out.write("                            <div id=\"player\">\r\n");
      out.write("                                <audio controls id=\"audioPlayer\">     \r\n");
      out.write("                                    <source src=\"\" id=\"main\" type=\"audio/mp3\">                   \r\n");
      out.write("                                </audio>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("                </body>\r\n");
      out.write("            </html>\r\n");

        cn.close();
    } catch (Exception er) {
        out.println(er.getMessage());
    }

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
