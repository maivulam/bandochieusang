<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
 var ok=0;
 //This file delete CDROM in database
 macdr=Request("id")+"";
 if(Session("login")!=1)Response.Redirect("thongtintv.asp");
  //delete from cdrom table
  sql="select * from cdrom where macdr='"+macdr+"'";
  RS.Open(sql,conn,1,2);  
  if(!RS.EOF&&(RS("xongcdr")+"")!=1){
    RS.Delete();
    RS.Update(); 
    ok=1;
   }
 RS.close();
 ////
 if(ok==1){
 sql="select * from hoadon where macdr='"+macdr+"'";
 RS.Open(sql,conn,1,2);  
 while(!RS.EOF) {
    RS.Delete();
    RS.Update(); 
    ok=2;
    RS.MoveNext(); 
  }
 RS.close();
 Response.Redirect("notburn.asp");
}
%>
<HTML>
<HEAD>
<TITLE>Xoa CDROM......AZ-CDROM</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY  aLink=#ff0000 bgColor=#FFFFFF leftMargin=0 link=#0000ff style="MARGIN: 0px" text=#3366cc topMargin=0 vLink=#054bbb marginwidth="0" marginheight="0">
<FONT face="verdana" size=3 color="red"><B>
 CDROM not DELETE! CDROM is burning <BR>  
 <A href="notburn.asp">CDROM not burn</A>
</B></FONT>
<BR> 
<FONT face="verdana" size=1 color="#558A8B"><B>     
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy    
</B></FONT>    
<p>    
</BODY>        
</HTML>    
