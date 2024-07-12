<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<% try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3", "root", "");
%>
<nav class="navbar navbar-expand-md navbar-light bg-light">
    <a class="navbar-brand text-dark" href="index.jsp">Musically</a>
    <form method="get" class="form-inline" action="search.jsp" id="myForm">
        <input class="form-control mr-2 searchinput" type="search" name="searchname" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light bg-success" type="submit">Search</button>
    </form>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
<%
    Statement st = cn.createStatement();
    ResultSet rs = st.executeQuery("select * from category");
    int count = 0;
    while (rs.next()) {
%>
            <li class="nav-item active">
                <a class="navdropdown nav-link .nav-item.active" href="show_albums.jsp?id=<%=rs.getString("code")%>"><%=rs.getString("category")%></a>
            </li>
<%
        count++;
        if (count == 3) {
            break;
        }
    }
%>
            <li class="navdropdown nav-item active dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">More Categories</a>
                <div class="dropdown-menu bg-light" aria-labelledby="navbarDropdownMenuLink">
<%
    while (rs.next()) {
%>
                    <a class="dropdown-item" href="show_albums.jsp?id=<%=rs.getString("code")%>"><%=rs.getString("category")%></a>
<%
    }
%>
                </div>
            </li>
<%
    rs.beforeFirst();
    while(rs.next()){
%>
            <li class="nav-item active">
                <a class="nav-link hidnavitem" href="show_albums.jsp?id=<%=rs.getString("code")%>"><%=rs.getString("category")%></a>
            </li>
<%
    }
%>
        </ul>
    </div>
</nav>
<%
        cn.close();
    } catch (Exception er) {
        out.println(er.getMessage());
    }
%>