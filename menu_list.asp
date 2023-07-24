<%@language="jscript" CODEPAGE="65001"%>
<%
  /****
  Ver 1.00 22/4/2011
  -Da liet ke theo kieu thu muc trong 2 bang duongBinhChanh +tdkBinhchanh
  -Can lam tiep phan tim kiem + cap nhat dieu chinh
  ***/
  //Kiem tra password
    if(Session("logincs6")!=1)Response.Write("<script>window.parent.location='index.asp';</script>"); //Response.Redirect("index.asp");
  //Khai bao du lieu 
   var d, t;
 	d = new Date();
	t = d.getTime()/10; 
	khuvuc="";
	var tuyenduong = new Array();
	var matuyenduong =new Array();
   //Ket noi du lieu
   var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
///////CHON FILE DATA THEO QUAN HUYEN////////   	
   	//Lay du lieu
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
	if(kv=="quantanphu"){
   					path=Server.MapPath("/db/quantanphu.mdb");
   					khuvuc="Quận Tân Phú";
   					}
	if(kv=="quantanbinh"){
   					path=Server.MapPath("/db/quantanbinh.mdb");
   					khuvuc="Quận Tan Bình";
   					}
//////////////////XONG PHAN CHON FILE DATA////////////////////////////   
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr);    
   sql="SELECT * FROM tuyenduong ORDER BY maDuong ASC";
   RS.Open(sql,conn,1,2); 
   //Luu ten duong va ma duong
   i=0;
   RS.MoveFirst();
   while(!RS.EOF)
    {
       tuyenduong[i]=RS("tenDuong")+"";
       matuyenduong[i]=RS("maDuong")+"";
       i++;
       RS.MoveNext();
     }
    RS.Close(); 
	sql="SELECT * FROM tudieukhien"; //
	RS.Open(sql,conn,1,2); 	
 	%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<script src="/js/jquery.js"></script>
<title>Hien thi cac tu dieu khien trong database access</title>
</head>
<BODY >
<!-- Bat dau tren noi dung-->
<ol><font size="4"><b><%=khuvuc%></b>
      <% 
       j=0;
       while(j<tuyenduong.length)
       { %> 
	 	<li><%=tuyenduong[j]%>
	 		<ol >	
			   	<font size="3">
			   	<%
			   	RS.MoveFirst();
       			while(!RS.EOF) {
       	        if(matuyenduong[j]==RS("maduong")) {%> 
 					<li><a href="display.asp?kv=<%=kv%>&maDuong=<%=matuyenduong[j]%>&maTDK=<%=RS("maTDK")%>" target="display"><%=RS("tenTDK")+""%></a>
 					&nbsp; <a href="admin/updatetdk.asp?kv=<%=kv%>&maTDK=<%=RS("maTDK")%>" target="display" title="Chỉnh sửa thông tin"><img border="0" src="images/repair.jpg" width="20" height="18" ></a></li>	
             		<%
             		}
             		RS.MoveNext();
                	}%>
       			</font>	       
			</ol>
	    </li>
	       <%j++;
       }
       RS.Close();
       %>
</font>
</ol>
<script>function handler(event) {
  var $target = $(event.target);
  if( $target.is("li") ) {
    $target.children().toggle();
  }
}
$("ol").click(handler).find("ol").hide();
</script>
 
       <!--Het phan chen noi dung -->
      
       
</BODY>          
</HTML>