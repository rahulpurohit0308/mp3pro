package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');

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
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");

      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html class=\"no-js\" lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("    <title>mp3 dashboard</title>\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"shortcut icon\" type=\"image/png\" href=\"assets/images/icon/favicon.ico\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/font-awesome.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/themify-icons.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/metisMenu.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/owl.carousel.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/slicknav.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://www.amcharts.com/lib/3/plugins/export/export.css\" type=\"text/css\" media=\"all\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/typography.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/default-css.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/styles.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/responsive.css\">\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("    <script src=\"assets/js/vendor/modernizr-2.8.3.min.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        $(document).on(\"click\",\".inserttt\",function(){\n");
      out.write("            var cat = $(\"#cat\").val();\n");
      out.write("                $.post(\n");
      out.write("                    \"categories.jsp\",{cat:cat},function(data){\n");
      out.write("                        data=data.trim();\n");
      out.write("                        if(data==\"Success\"){\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-success\");\n");
      out.write("                            $(\"#msg\").html(\"Record Inserted\");\n");
      out.write("                            $(\".form\").load(\"catform.jsp\");\n");
      out.write("                            $(\".tbody\").load(\"cattable.jsp\");\n");
      out.write("                        }\n");
      out.write("                        else{\n");
      out.write("                            $(\"#msg\").attr(\"class\",\"alert alert-danger\");\n");
      out.write("                            $(\"#msg\").html(\"Try Again\");\n");
      out.write("                        }\n");
      out.write("                    });\n");
      out.write("            });\n");
      out.write("        $(document).on(\"click\",\".deletee\",function(){\n");
      out.write("            var id = $(this).attr(\"rel\");\n");
      out.write("            $(\"#\"+id).fadeOut(1000);\n");
      out.write("            $.post(\n");
      out.write("                \"deletecat.jsp\",{id:id},function(data){\n");
      out.write("                    data=data.trim();\n");
      out.write("                    if(data==\"Success\"){\n");
      out.write("                        $(\"#msg\").attr(\"class\",\"alert alert-warning\");\n");
      out.write("                        $(\"#msg\").html(\"Record Deleted\");\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("        });\n");
      out.write("        var id=0;\n");
      out.write("        $(document).on(\"click\",\".editt\",function(){\n");
      out.write("            id=$(this).attr(\"rel\");\n");
      out.write("            $(\"#msg\").attr(\"class\",\"\");\n");
      out.write("            $(\"#msg\").text(\"\");\n");
      out.write("            $.post(\n");
      out.write("                \"editcat.jsp\",{id:id},function(data){\n");
      out.write("                    $(\".form\").html(data);\n");
      out.write("                    $(\"#catt\").focus();\n");
      out.write("                });\n");
      out.write("        });\n");
      out.write("        $(document).on(\"click\",\".updatee\",function(){\n");
      out.write("            var cat=$(\"#catt\").val();\n");
      out.write("            $.post(\n");
      out.write("                \"updatecat.jsp\",{id:id,cat:cat},function(data){\n");
      out.write("                    data=data.trim();\n");
      out.write("                    if(data==\"Success\"){\n");
      out.write("                        $(\"#msg\").attr(\"class\",\"alert alert-primary\");\n");
      out.write("                        $(\"#msg\").text(\"Record Updated\");\n");
      out.write("                        $(\".form\").load(\"catform.jsp\");\n");
      out.write("                        $(\".tbody\").load(\"cattable.jsp\");\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("        });\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"main-content\">\n");
      out.write("        <div class=\"main-content\">\n");
      out.write("            <div class=\"header-area\">\n");
      out.write("                <div class=\"row align-items-center\">\n");
      out.write("                    <div class=\"col-md-6 col-sm-4 clearfix\"></div>\n");
      out.write("                        <div class=\"col-md-6 col-sm-4 clearfix\">\n");
      out.write("                            <ul class=\"notification-area pull-right\">\n");
      out.write("                                <li><h6><a href=\"logout.jsp?id=");
      out.print(email);
      out.write("\">Logout</a></h6></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"page-title-area\">\n");
      out.write("                    <div class=\"row align-items-center\" style=\"padding-top: 20px; padding-bottom: 20px\">\n");
      out.write("                        <div class=\"col-sm-6\">\n");
      out.write("                            <div class=\"breadcrumbs-area clearfix\">\n");
      out.write("                                <h4 class=\"page-title pull-left\" >Dashboard</h4>\n");
      out.write("                                <ul class=\"breadcrumbs pull-left\">\n");
      out.write("                                    <li><a href=\"dashboard.jsp\">Home</a></li>\n");
      out.write("                                    <li><span>Dashboard</span></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-6 clearfix\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"main-content-inner\">\n");
      out.write("                    <div id=\"msg\"></div>\n");
      out.write("                    <div class=\"sales-report-area mt-5 mb-5\">\n");
      out.write("                        <div class=\"col-12 mt-5\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"form\">\n");
      out.write("                                        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "catform.jsp", out, false);
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row mt-5 mb-5\">\n");
      out.write("                        <div class=\"col-12\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <div class=\"d-sm-flex justify-content-between align-items-center\">\n");
      out.write("                                        <h4 class=\"header-title mb-0\">Categories</h4>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"market-status-table mt-4\">\n");
      out.write("                                        <div class=\"table-responsive\">\n");
      out.write("                                            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "cattable.jsp", out, false);
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <script src=\"assets/js/vendor/jquery-2.2.4.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/owl.carousel.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/metisMenu.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/jquery.slimscroll.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/jquery.slicknav.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js\"></script>\n");
      out.write("        <script src=\"https://code.highcharts.com/highcharts.js\"></script>\n");
      out.write("        <script src=\"https://cdn.zingchart.com/zingchart.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("        zingchart.MODULESDIR = \"https://cdn.zingchart.com/modules/\";\n");
      out.write("        ZC.LICENSE = [\"569d52cefae586f634c54f86dc99e6a9\", \"ee6b7db5b51705a13dc2339db3edaf6d\"];\n");
      out.write("        </script>\n");
      out.write("        <script src=\"assets/js/line-chart.js\"></script>\n");
      out.write("        <script src=\"assets/js/pie-chart.js\"></script>\n");
      out.write("        <script src=\"assets/js/plugins.js\"></script>\n");
      out.write("        <script src=\"assets/js/scripts.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

                    cn.close();
                }   
            catch(Exception er){
                out.println(er.getMessage());
            }
                }
            }
            catch(Exception e){
                response.sendRedirect("index.jsp");
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
