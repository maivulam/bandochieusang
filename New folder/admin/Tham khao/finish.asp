<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
 if(Session("login")!=1)Response.Redirect("thongtintv.asp");
 var ok=0;
 var RStam=Server.CreateObject("ADODB.Recordset");
 //Get data from url
 macdr=Request("id")+"";
 //Move cdrom->cdrombk
 sql1="select * from cdrombk";
  RStam.Open(sql1,conn,1,2);
 //get data from cdrom table
  sql="select * from cdrom where macdr='"+macdr+"'";
  RS.Open(sql,conn,1,2);  
  while(!RS.EOF){
    RStam.Addnew();
    RStam("macdr")=RS("macdr");
    RStam("tencdr")=RS("tencdr");
    RStam("matv")=RS("matv");
    RStam("slcdr")=RS("slcdr");
    RStam("ghichucdr")=RS("ghichucdr");
    RStam("tgghicdr")=RS("tgghicdr");
    RStam("xongcdr")=RS("xongcdr");
    RStam.Update();
    RS.Delete();
    RS.Update(); 
    RS.MoveNext();  
    ok=1;
   }
 RS.close();
 RStam.close(); 
//Move hoadon->hoadonbk
 sql1="select * from hoadonbk";
 RStam.Open(sql1,conn,1,2);
 //get data from hoadon table
  sql="select * from hoadon where macdr='"+macdr+"'";
  RS.Open(sql,conn,1,2);  
  while(!RS.EOF){
    RStam.Addnew();
    RStam("macdr")=RS("macdr");
    RStam("mafile")=RS("mafile");
    RStam.Update();
    RS.Delete();
    RS.Update(); 
    RS.Movenext();
    ok=2;
   }
 RS.close();
 RStam.close();
//
if(ok!=0)Response.Redirect("burn.asp");
%>
<HTML>
<HEAD>
<TITLE>Finish CDROM......AZ-CDROM</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<META content="Microsoft FrontPage 4.0" name=GENERATOR></HEAD>
<BODY  aLink=#ff0000 bgColor=#FFFFFF leftMargin=0 link=#0000ff style="MARGIN: 0px" text=#3366cc topMargin=0 vLink=#054bbb marginwidth="0" marginheight="0">
<FONT face="verdana" size=3 color="red"><B>
 Finish ERROR! <BR>  
 <A href="burn.asp">CDROM burn</A>
</B></FONT>
<BR> 
<FONT face="verdana" size=1 color="#558A8B"><B>     
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy    
</B></FONT>    
<p>    
</BODY>        
</HTML>    
