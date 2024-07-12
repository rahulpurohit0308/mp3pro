<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("id").trim().length()==0){
        response.sendRedirect("show_album.jsp?emptyid=1");
    }
    else{
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
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .editformm{
                display:none;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <!-- amchart css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <!-- others css -->
        <link rel="stylesheet" href="assets/css/typography.css">
        <link rel="stylesheet" href="assets/css/default-css.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <!-- modernizr css -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
        <script>
            $(document).on("click",".insert",function(){
                var title = $(".song").val();
                var des = $(".songdes").val();
                var id = "<%=code%>";
                $.post(
                        "addsong.jsp",{title:title,descrip:des,id:id},function(data){
                         data=data.trim();
                         $(".form").html(data);
                    });
            });
            $(document).on("click",".deletee",function(){
                var id = $(this).attr("rel");
                $("#"+id).fadeOut(1000);
                $.post(
                    "deletesong.jsp",{id:id},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#msg").attr("class","alert alert-warning");
                            $("#msg").html("Record Deleted");
                        }
                    });
            });
            var id=0;
            $(document).on("click",".editt",function(){
                id=$(this).attr("rel");
                $.post(
                    "editsong.jsp",{id:id},function(data){
                        $(".form").html(data);
                        $("#songgg").focus();
                    });
            });
            $(document).on("click",".updatee",function(){
                var song=$("#songgg").val();
                var des = $("#des").val();
                $.post(
                    "updatesong.jsp",{id:id,song:song,des:des},function(data){
                        data=data.trim();
                        if(data=="Success"){
                            $("#msg").attr("class","alert alert-primary");
                            $("#msg").text("Song Updated");
                            $(".form").load("songform.jsp");
                            $(".tbody").load("songtable.jsp",{id:"<%=code%>"});
                        }
                    });
            });
        </script>
    </head>
    <body>
        <div class="main-content">
        <div class="main-content">
            <div class="header-area">
                <div class="row align-items-center">
                    <div class="col-md-6 col-sm-8 clearfix"></div>
                        <div class="col-md-6 col-sm-4 clearfix">
                            <ul class="notification-area pull-right">
                                <li><h6><a href="logout.jsp?id=<%=email%>">Logout</a></h6></li>
                            </ul>
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
                        <div class="col-sm-6 clearfix"></div>
                    </div>
                </div>
                <div id="msg" class=""></div>
                <div class="sales-report-area mt-5 mb-5">
                    <div class="col-12 mt-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="form">
                                    <div class="form-group">
                                        <label for="example-datetime-local-input" class="col-form-label">Song Name : </label>
                                        <input class="form-control song" type="Text" name="song" id="example-datetime-local-input">
                                        <label for="example-datetime-local-input" class="col-form-label">Song Description : </label>
                                        <textarea class="form-control songdes" type="Text" name="descrip" id="example-datetime-local-input"></textarea>
                                        <input type="submit" class="btn btn-primary insert" style="margin: 6px" value="Add">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="editformm">                  
                    <div class="sales-report-area mt-5 mb-5">
                        <div class="col-12 mt-5">
                            <div class="card">
                                <div class="card-body">   
                                    <div class="editform"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-5 mb-5">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-center">
                                    <h4 class="header-title mb-0">Songs</h4>
                                </div>
                                <div class="market-status-table mt-4">
                                    <div class="table-responsive">
                                        <jsp:include page="songtable.jsp" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
        <!-- bootstrap 4 js -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/metisMenu.min.js"></script>
        <script src="assets/js/jquery.slimscroll.min.js"></script>
        <script src="assets/js/jquery.slicknav.min.js"></script>
        <!-- start chart js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
        <!-- start highcharts js -->
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <!-- start zingchart js -->
        <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
        <script>
        zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
        ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
        </script>
        <!-- all line chart activation -->
        <script src="assets/js/line-chart.js"></script>
        <!-- all pie chart -->
        <script src="assets/js/pie-chart.js"></script>
        <!-- others plugins -->
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
                response.sendRedirect("dashboard.jsp");
            }
        }
%>