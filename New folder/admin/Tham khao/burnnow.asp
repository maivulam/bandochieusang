<%@language=JScript%>
<!--#INCLUDE FILE="khaibaogiaodich.txt" -->
<%
 var ok=0;matv="";thanhtoan=0;
 var price_hcm=15000;price_vn=20000;price_ovn=8;
 //This file delete CDROM in database
 macdr=Request("id")+"";
 if(Session("login")!=1)Response.Redirect("thongtintv.asp");
  //delete from cdrom table
  sql="select * from cdrom where macdr='"+macdr+"'";
  RS.Open(sql,conn,1,2);  
  if(!RS.EOF){
    matv=RS("matv")+""; 
    ok=1;
   }
 RS.close();
 ////
if(ok==1){
sql="select * from thanhvien where matv='"+matv+"'";
RS.Open(sql,conn,1,2);  
 if(!RS.EOF) {
    loaitv=RS("loaitv");
    vndtv=RS("vndtv");
    usdtv=RS("usdtv");
    if(loaitv=="HCM"&&vndtv>=price_hcm){
      thanhtoan=1;
      RS("vndtv")=vndtv-price_hcm;
     } 
    if(loaitv=="VN"&&vndtv>=price_vn){
      thanhtoan=1;
      RS("vndtv")=vndtv-price_vn;
     } 
    if(loaitv=="OVN"&&usdtv>=price_ovn){
      thanhtoan=1;
      RS("usdtv")=vndtv-price_ovn;
     }
    if(thanhtoan==1){ 
     RS.Update(); 
     ok=2;
    }
  }
 RS.close();
}
if(ok==2){
 sql="select * from cdrom where macdr='"+macdr+"'";
 RS.Open(sql,conn,1,2);  
 if(!RS(EOF)){
  RS("xongcdr")=1;  
  RS.Update();
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
 Error:CDROM not Burn!  <BR>  
 <%if(thanhtoan==0){%>
  Member is not enough money to make CDROM.<BR>
 <%}%>
 <A href="notburn.asp">CDROM not burn</A>
</B></FONT>
<BR> 
<FONT face="verdana" size=1 color="#558A8B"><B>     
Copyright @ 2001 by  AZ-CDROM-Nguyen Duc Quy    
</B></FONT>    
<p>    
</BODY>        
</HTML>    
