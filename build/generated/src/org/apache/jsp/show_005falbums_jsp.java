package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class show_005falbums_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");

     try{
                    String code=request.getParameter("id");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                    Statement st=cn.createStatement();
                    ResultSet rs=st.executeQuery("select * from category");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\" integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\" integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-secondary\">\n");
      out.write("        <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"index.jsp\">Spotifi</a>\n");
      out.write("            <form method=\"post\" class=\"form-inline my-2 my-lg-2 mx-3\" action=\"search.jsp\">\n");
      out.write("                <input class=\"form-control mr-sm-2\" type=\"search\" name=\"searchname\" placeholder=\"Search\" aria-label=\"Search\">\n");
      out.write("                <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Search</button>\n");
      out.write("            </form>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("              <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("              <ul class=\"navbar-nav ml-auto\">\n");

        int count=0;
        while(rs.next()){

      out.write("\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                  <a class=\"nav-link\" href=\"show_albums.jsp?id=");
      out.print(rs.getString("code"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("category"));
      out.write("</a>\n");
      out.write("                </li>\n");

        count++;
        if(count==3){
            break;
        }
        }

      out.write("\n");
      out.write("                <li class=\"nav-item active dropdown\">\n");
      out.write("                  <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdownMenuLink\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                    More Categories\n");
      out.write("                  </a>\n");
      out.write("                  <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdownMenuLink\">\n");

        while(rs.next()){

      out.write("\n");
      out.write("                    <a class=\"dropdown-item text-light bg-dark\" href=\"show_albums.jsp?id=");
      out.print(rs.getString("code"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("category"));
      out.write("</a> \n");

        }

      out.write("\n");
      out.write("                  </div>\n");
      out.write("                </li>\n");
      out.write("              </ul>\n");
      out.write("            </div>\n");
      out.write("          </nav><br>\n");
      out.write("          <div class=\"container\">\n");

                  ResultSet rs2=st.executeQuery("select * from category where code='"+code+"'");                
                  while(rs2.next()){

      out.write("     \n");
      out.write("<h1 class=\"text-warning\">");
      out.print(rs2.getString("category"));
      out.write("</h1>\n");

                  }

      out.write("\n");
      out.write("          </div><br>\n");
      out.write("<div class=\"container\">\n");
      out.write("    <div class=\"row\">\n");

                  ResultSet rs1=st.executeQuery("select * from album where cat_code='"+code+"'");                
                  while(rs1.next()){

      out.write("       \n");
      out.write("                  <div class=\"col-sm-4\">\n");
      out.write("                      <a href=\"show_songs.jsp?id=");
      out.print(rs1.getString("code"));
      out.write("\">               \n");
      out.write("                  <img src=\"album/");
      out.print(rs1.getString("code"));
      out.write('/');
      out.print(rs1.getString("code"));
      out.write(".jpg\" style=\"width:300px;height:300px;\" class=\"img-fluid\"><br>\n");
      out.write("                  <h3 style=\"text-align:left\" class=\"text-white\">");
      out.print(rs1.getString("album_name"));
      out.write("</h3><br>\n");
      out.write("                  </div>\n");

                  }

      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                    cn.close();
                }   
            catch(Exception er){
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
