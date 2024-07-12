package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class albumtable_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<link rel=\"stylesheet\" href=\"styles.css\">\n");
      out.write("<table class=\"dbkit-table\">\n");
      out.write("    <tbody class=\"tbody\">\n");

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
            try{
                String code = request.getParameter("id");
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
                Statement st=cn.createStatement();
                ResultSet rs = st.executeQuery("select * from album");
                while(rs.next()){
                    while(rs.getString("cat_code")==code){

      out.write("\n");
      out.write("                    <tr id=\"");
      out.print(rs.getString("code"));
      out.write("\">\n");
      out.write("\t\t\t<td>");
      out.print(rs.getString("album_name"));
      out.write("</td>\n");
      out.write("                        <td><a href=\"show_song.jsp?id=");
      out.print(rs.getString("code"));
      out.write("\" id=\"album\"><i>Show Songs</i></a></td>\n");
      out.write("                        <td id=\"edit\"><i rel=\"");
      out.print(rs.getString("code"));
      out.write("\" class=\"editt\">Edit Album</i></td>\n");
      out.write("                        <td id=\"delete\"><i rel=\"");
      out.print(rs.getString("code"));
      out.write("\" class=\"deletee\">Delete Album</i></td>\n");
      out.write("                    </tr>\n");

                    }
                }
                cn.close();
            }   
            catch(Exception e){
                out.println(e.getMessage());
            }
        }
    }
    catch(Exception er){
        response.sendRedirect("search.jsp");
    }

      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>");
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
