<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%  
    if(request.getParameter("cat").trim().length()>0){
        LinkedList l = new LinkedList();
        for(int i=0;i<=9;i++){
            l.add(i+"");
        }
        for(char c='A';c<='Z';c++){
            l.add(c+"");
        }
        for(char c='a';c<='z';c++){
            l.add(c+"");
        }
        Collections.shuffle(l);
        String code="";
        for (int i=0;i<8;i++){
            code=code+l.get(i);
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mp3","root","");
            Statement st=cn.createStatement();
            int sn=0;
            ResultSet rs=st.executeQuery("select MAX(sn) from category");
            if(rs.next()){
                sn=rs.getInt(1);
            }
            sn++;
            code=code+"_"+sn;
            String category=request.getParameter("cat");
            PreparedStatement ps = cn.prepareStatement("insert into category values (?,?,?)");
            ps.setInt(1,sn);
            ps.setString(2,code);
            ps.setString(3,category);
            if(ps.executeUpdate()>0){
                out.println("Success");
            }
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
    }
%>