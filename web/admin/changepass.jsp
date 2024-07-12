<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
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
            Statement st=cn.createStatement();
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>mp3 dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/metisMenu.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.min.css">
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <link rel="stylesheet" href="assets/css/typography.css">
    <link rel="stylesheet" href="assets/css/default-css.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
    <div>
        <div class="main-content">
            <div class="header-area">
                <div class="row align-items-center">
                    <div class="col-md-6 col-sm-8 clearfix">
                    </div>
                    <div class="col-md-6 col-sm-4 clearfix">
                    </div>
                </div>
            </div>
            <div class="page-title-area">
                <div class="row align-items-center" style="padding-top: 20px; padding-bottom: 20px">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left" >Dashboard</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="dashboard.jsp">Home</a></li>
                                <li><span>Dashboard</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                    </div>
                </div>
            </div>
            <div class="main-content-inner">
                <div class="sales-report-area mt-5 mb-5">
<div class="col-12 mt-5">
    <div class="card">
        <div class="card-body">
            <form method="post" action="categories.jsp">
                <div class="form-group">
                    <label for="example-datetime-local-input" class="col-form-label">Add Category</label>
                    <input class="form-control" type="Text" name="cat" id="example-datetime-local-input">
                    <input type="submit" class="btn btn-primary" style="margin: 6px" value="Add">
                </div>
            </form>
        </div>
    </div>
                </div>
                </div>
                <div class="row mt-5 mb-5">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-center">
                                    <h4 class="header-title mb-0">Categories</h4>
                                </div>
                                <div class="market-status-table mt-4">
                                    <div class="table-responsive">
                                        <table class="dbkit-table">
        <%                        
        ResultSet rs=st.executeQuery("select * from category where category is not NULL");
        while(rs.next()){
        %>
                                            <tr class="heading-td">
                                                <td class="mv-icon"><%=rs.getString("category")%></td>
                                                <td class="coin-name"><a href="show_album.jsp?id=<%=rs.getString("code")%>">Show Albums</a></td>
                                                <td class="coin-name"><a href="edit.jsp?id=<%=rs.getString("code")%>">Edit Category</a></td>
                                                <td class="sell"><a href="delete.jsp?id=<%=rs.getString("code")%>">Delete Category</a></td>
                                            </tr>
        <%
                    }
        %>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <script src="assets/js/line-chart.js"></script>
    <script src="assets/js/pie-chart.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
    
</body>
</html>
<%
                    cn.close();
                }   
            catch(Exception er){
                out.println(er.getMessage());
            }
                }
            }
            catch(Exception er){
                response.sendRedirect("search.jsp");
            }
%>