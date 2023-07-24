<%@language="jscript" CODEPAGE="65001"%>
<%
/*
hinhanh.asp
01/12/2011
- Hien thi hinh anh thuc te cua tu dieu khien
*/
  //Kiem trapassword
    if(Session("logincs6")!=1)Response.Write("<script>window.parent.location='index.asp';</script>");//Response.Redirect("index.asp");
 //Lay du lieu tu de the hien 	
 	maTDK=Request("maTDK")+"";
 	
 	sql="123";
 	queryError="";
if(maTDK!="undefined"){
   var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
   var fs=Server.CreateObject("Scripting.FileSystemObject");
   ///////CHON FILE DATA THEO QUAN HUYEN////////   	
  
   kv=Request("kv")+"";
  
   if(kv=="undefined") kv="quan12";
   if(kv=="quan12"){
       path=Server.MapPath("/db/quan12.mdb");   
       khuvuc="Quận 12";
   }
   if(kv=="quangovap"){
       path=Server.MapPath("/db/quangovap.mdb");
       khuvuc="Quận Gò Vấp";
   }
   if(kv=="quanbinhthanh"){
       path=Server.MapPath("/db/quanbinhthanh.mdb");
       khuvuc="Quận Bình Thạnh";
   }
   
      
	//////////////////XONG PHAN CHON FILE DATA////////////////////////////   
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr); 
   sql="SELECT * FROM tudieukhien WHERE maTDK="+maTDK+"";
   RS.Open(sql,conn,1,2);  
   if(RS.EOF) queryError+="Thông tin về tủ điều khiển cần hiển thị hình anh không hợp lệ<br>";
   //if(fs.FileExists("c:\123.txt"))queryError+="File cần kiểm tra có<br>"; 
}// end of if(maTDK!="undefined")
 %>
<html> 
<head> 
<meta http-equiv="content-type" content="text/html; charset=utf-8" /> 
<title>Hien thi hinh anh thuc te cua tu dieu khien</title> 
</head> 
<body> 
<%if (queryError=="") {%>
	<font size="4"><b>Tủ điều khiển <%=RS("tenTDK")%> </b></font><br>
	<img src="images/<%=kv%>/tdk/<%=maTDK%>.jpg" width="600"><br>

       
<%} else {%>
<font size="4" color="red"><%=queryError%></font><br>
<%
 }
RS.Close();
conn.Close();
%>
<a href="javascript: history.go(-1)">Back</a>
</body> 
</html>