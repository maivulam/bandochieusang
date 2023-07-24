<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
 var ok=0;
 //This file delete member in database
 matv=Request("id")+"";
 if(Session("login")!=1)Response.Redirect("thongtintv.asp");
  //delete from cdrom table
  sql="select * from thanhvien where matv='"+matv+"'";
  RS.Open(sql,conn,1,2);  
  if(!RS.EOF){
    RS.Delete();
    RS.Update(); 
    ok=1;
   }
 RS.close();
 //Delte cdrom contact with member
 var RStam=Server.CreateObject("ADODB.Recordset");
 sql1="select * from cdrom where matv='"+matv+"'";
 RS.Open(sql1,conn,1,2);  
  while(!RS.EOF){
   macdr=RS("macdr")+"";
   sql2="select * from hoadon where macdr='"+macdr+"'";
   RStam.Open(sql2,conn,1,2);  
    while(!RStam.EOF){
      RStam.Delete();
      RStam.Update();
      RStam.Movenext();
    }
    RStam.close();  
   RS.Delete();
   RS.Update();
   RS.MoveNext();
  }
 RS.close();   
 ////
 if(ok==1)Response.Redirect("viewmember.asp");

%>
<HTML>
<HEAD>
<TITLE>Delete member......AZ-CDROM</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY  aLink=#ff0000 bgColor=#FFFFFF leftMargin=0 link=#0000ff style="MARGIN: 0px" text=#3366cc topMargin=0 vLink=#054bbb marginwidth="0" marginheight="0">
<FONT face="verdana" size=3 color="red"><B>
 Error? Member not DELETE! Sorry <BR>  
 <A href="viewmember.asp">View member</A>
</B></FONT>
<BR> 
<FONT face="verdana" size=1 color="#558A8B"><B>     
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy    
</B></FONT>    
<p>    
</BODY>        
</HTML>    
