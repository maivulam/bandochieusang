<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
 var ok=0;namecdr="";sum_size=0;
 var hientai=new Date();
 mafile=new Array();
 //This file delete CDROM in database
 macdr=Request("id")+"";
 if(Session("login")!=1)Response.Redirect("thongtintv.asp");
 //get data from cdrom table
  sql="select * from cdrom where macdr='"+macdr+"'";
  RS.Open(sql,conn,1,2);  
  if(!RS.EOF){
   namecdr=RS("tencdr")+"";
   }
 RS.close();
 //get data from hoadon
 sql="select * from hoadon where macdr='"+macdr+"'";
 RS.Open(sql,conn,1,2);  
 i=0;
 while(!RS.EOF) {
    mafile[i]=RS("mafile")+"";
    RS.MoveNext(); 
    i++;
  }
 RS.close();
///Get data from cdrom.mdb
%>
<!--#INCLUDE FILE="khaibaocdrom.txt" -->
<%
function hienthi(st){
  //st is id of MP3
  if(st.indexOf("MP3")!=-1){
   sql="select * from mp3 where mamp3='"+st+"'";   
    RS.Open(sql,conn,1,2);
     if(!RS.EOF){
      sum_size+=RS("dlmp3");
      Response.write("<TD>"+RS("tenmp3")+"</TD>\n");     
      Response.write("<TD>MP3</TD>\n");     
      Response.write("<TD>"+Math.ceil(RS("dlmp3")*100)/100+"</TD>\n");     
      Response.write("<TD>"+RS("diachimp3")+"</TD>\n");     
     }
   RS.close();
  } 
 //st is id of MP4
 if(st.indexOf("MP4")!=-1){
   sql="select * from mp4 where mamp4='"+st+"'";   
    RS.Open(sql,conn,1,2);
     if(!RS.EOF){
      sum_size+=RS("dlmp4");
      Response.write("<TD>"+RS("tenmp4")+"</TD>\n");     
      Response.write("<TD>MP4</TD>\n");     
      Response.write("<TD>"+Math.ceil(RS("dlmp4")*100)/100+"</TD>\n");     
      Response.write("<TD>"+RS("diachimp4")+"</TD>\n");     
    }
   RS.close();
  } 
 //st is id of software
 if(st.indexOf("SW")!=-1){
   sql="select * from software where masw='"+st+"'";   
    RS.Open(sql,conn,1,2);
     if(!RS.EOF){
      sum_size+=RS("dlsw");
      Response.write("<TD>"+RS("tensw")+"</TD>\n");     
      Response.write("<TD>Software</TD>\n");     
      Response.write("<TD>"+Math.ceil(RS("dlsw")*100)/100+"</TD>\n");     
      Response.write("<TD>"+RS("diachisw")+"</TD>\n");     
     }
   RS.close();
  } 
 }

%>
<HTML>
<HEAD>
<TITLE>CDROM Burn Now......AZ-CDROM</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY  aLink=#ff0000 bgColor=#FFFFFF leftMargin=0 link=#0000ff style="MARGIN: 0px" text=#1100ff topMargin=0 vLink=#054bbb marginwidth="0" marginheight="0">
<FONT face="verdana" size=2><B>
 <%=hientai%><br>
<TABLE width="100%" border=1>
 <TR bgcolor="#ffccff">
   <TD colspan=5> <FONT face="verdana" size=3><B>Infomation About CDROM is Name=<%=namecdr%></B></FONT></TD>
 </TR>
 <TR bgcolor="#ccccdd">
   <TD><FONT face="verdana" size=2><B>Nr</B></FONT></TD>
   <TD><FONT face="verdana" size=2><B>Name</B></FONT></TD>
   <TD><FONT face="verdana" size=2><B>Type</B></FONT></TD>
   <TD><FONT face="verdana" size=2><B>Size(MB)</B></FONT></TD>
   <TD><FONT face="verdana" size=2><B>Location</B></FONT></TD>
 </TR>
 <%
 dem=1;
 for(i=0;i<mafile.length;i++) {
 if(i%2)maunen="#DDDDDD";
 else maunen="#FFFFFF";
 mai=mafile[i];
 %>
 <TR bgcolor=<%=maunen%>>
   <TD><%=dem%></TD>
    <%hienthi(mai);dem++;%> 
   </TR>
 <%}%>
 <TR bgcolor="#ffccff">
   <TD colspan=5> <FONT face="verdana" size=3><B>Infomation About CDROM is Name=<%=namecdr%>,Sum_size=<%=(Math.ceil(sum_size)*100)/100%>(MB)</B></FONT></TD>
 </TR>
 </TABLE>
<A href="javascript:self.close();">Close This Window</A>
</B></FONT>
<BR> 
<FONT face="verdana" size=1 color="#558A8B"><B>     
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy    
</B></FONT>    
<p>    
</BODY>        
</HTML>    
