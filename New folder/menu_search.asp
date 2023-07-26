<%@language="jscript" CODEPAGE="65001"%>
<%
  /****
  18/10/2011
  - Tìm theo ten duong
  28/4/2011
  - Da giai quyet truong hop khong tim thay gi
  25/4/2011
  -Tim kiem theo duong va tu
    ***/
  //Kiem trapassword
   if(Session("logincs6")!=1)Response.Write("<script>window.parent.location='index.asp';</script>");//Response.Redirect("index.asp");
  //Khai bao du lieu 
   var d, t;
   var tuyenduong = new Array();
   var matuyenduong =new Array();
   d = new Date();
   t = d.getTime()/10;
   ketqua=0;
   //Lay du lieu
   timkiem=Request("timkiem")+""; // cau truy van
   loaitimkiem=Request("loaitimkiem")+"";
   ///Bo dau tieng viet
   function locdau(str) {  
  		str= str.toLowerCase();  
  		str= str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g,"a");  
  		str= str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g,"e");  
  		str= str.replace(/ì|í|ị|ỉ|ĩ/g,"i");  
  		str= str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g,"o");  
  		str= str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g,"u");  
  		str= str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g,"y");  
  		str= str.replace(/đ/g,"d");
  		str= str.replace(/"|'/g,"");
  		return (str);  
 	 }   
   timkiem=locdau(timkiem);///loai bo dau tieng viet
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
	if(kv=="quanbinhthanh"){
   					path=Server.MapPath("/db/quanbinhthanh.mdb");
   					khuvuc="Quận Bình Thạnh";
   					}
//////////////////XONG PHAN CHON FILE DATA////////////////////////////   
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr);    
   // tim theo ten tu dieu khien
	if(timkiem!="undefined"&&timkiem!=""&&loaitimkiem=="tentdk"){
	sql="SELECT tudieukhien.maTDK,tudieukhien.tenTDK, tuyenduong.maDuong, tuyenduong.tenDuong FROM tudieukhien INNER JOIN tuyenduong ON tudieukhien.maDuong=tuyenduong.maDuong WHERE tudieukhien.tenTDK LIKE 'N%"+timkiem+"%' OR tudieukhien.khongdauTDK LIKE '%"+timkiem+"%'ORDER BY tuyenduong.maDuong ASC"; 
	RS.Open(sql,conn,1,2); 
	if (!RS.EOF) ketqua=1;
	}
	// tim theo ten duong
	if(timkiem!="undefined"&&timkiem!=""&&loaitimkiem=="tenduong"){
	sql="SELECT * FROM tuyenduong WHERE tenDuong LIKE 'N%"+timkiem+"%' OR khongdauDuong LIKE '%"+timkiem+"%'ORDER BY maDuong ASC"; 
	RS.Open(sql,conn,1,2); 
	if (!RS.EOF) ketqua=1;
	}
	%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hien thi cac tu dieu khien trong database access</title>
</head>
<body >
<!--Phan hien thi ket qua-->
  <!-- hien thi ket qua tim theo tu dieu khien-->
  <%if(timkiem!="undefined"&&loaitimkiem=="tentdk"&&ketqua==1){%>
 				<font size="4" color="#FF0000">Kết quả tìm kiếm:</font><br>
 				<%i=1;
             	RS.MoveFirst();
       			while(!RS.EOF) {
       	        	%> 
 					<b><%=i%>.<a href="display.asp?kv=<%=kv%>&maDuong=<%=RS("maDuong")%>&maTDK=<%=RS("maTDK")%>" target="display">Tủ điều khiển <%=RS("tenTDK")+""%></a></b><br>
 					Thuộc <%=RS("tenDuong")+""%>  &nbsp; <a href="admin/updatetdk.asp?kv=<%=kv%>&maTDK=<%=RS("maTDK")%>" target="display" title="Chỉnh sửa thông tin"><img border="0" src="images/repair.jpg" width="20" height="18" ></a><br>	
             		<%RS.MoveNext();
                	i++;
                	}
       				RS.Close();
  	}%>
  <!-- hien thi ket qua tim theo ten duong-->
  <%if(timkiem!="undefined"&&loaitimkiem=="tenduong"&&ketqua==1){%>
 				<font size="4" color="#FF0000">Kết quả tìm kiếm:</font><br>
 				<%i=1;
             	RS.MoveFirst();
       			while(!RS.EOF) {
       	        	%> 
 					<%=i%>.<a href="display.asp?kv=<%=kv%>&maDuong=<%=RS("maDuong")%>" target="display"><%=RS("tenDuong")+""%></a><br>
 					<%
 					tenduong=RS("tenDuong")+"";
 					RS.MoveNext();
                	i++;
                }
       			RS.Close();
  	}%>
   <!-- hien thi ket qua khong tim thay du lieu-->
   <%if(timkiem!="undefined"&&ketqua==0) {%>
	 	 <font size="4" color="#FF0000">Không tìm thấy dữ liệu !<br>
	 	 Vui lòng kiểm tra lại thông tin cần tìm</font>	 	 
	 	 
   <%}%> 
<!--Het phan chen noi dung -->
</body>          
</html>