<%@language="jscript" CODEPAGE="65001"%>
<%
/*
updatetdk.asp
02/5/2011
- cap nhat hien thi hinh anh + thong tin moi tu diue khien tren ban do
*/
 /////KHAI BAO KET NOI DATABASE//////
 var conn=Server.CreateObject("ADODB.Connection");
   var RS=Server.CreateObject("ADODB.Recordset");
   path=Server.MapPath("/db/binhchanh.mdb");
   connStr="DBQ=" + path + ";Driver={Microsoft Access Driver (*.mdb)}";
   conn.Open(connStr); 
 //Lay du lieu  	
 maTDK=Request("maTDK")+"";//0
 update=Request("update")+"";//hidden
 tenTDK=Request("tenTDK")+"";//1
 diachiTDK=Request("diachiTDK")+"";//2
 latTDK=Request("latTDK")+"";//3
 longTDK=Request("longTDK")+"";//4
 accTDK=Request("accTDK")+"";//5
 maDuong=Request("maDuong")+"";//6
 makhTDK=Request("makhTDK")+"";//7
 idmTDK=Request("idmTDK")+"";//8
 rccbTDK=Request("rccbTDK");//9
 dateTDK=Request("dateTDK")+"";//10
 noteTDK=Request("noteTDK")+"";//11
 ////
 var tuyenduong = new Array();
 var matuyenduong =new Array();
 d = new Date();
 sql="123";
 queryError="";
 //Kiem trapassword
 if(Session("login")!=1)Response.Write("<script>window.parent.location='/index.asp';</script>");//Response.Redirect("index.asp");
 if (Session("level")<1) queryError=queryError+"Bạn không có quyền cập nhật thông tin</br>";
//////////THUC HIEN CAP NHAT KHI CO YEU CAU//////////////
function Homnay(){
	var d, s = "";
	d = new Date();
	s += (d.getMonth() + 1) + "/";
	s += d.getDate() + "/";
	s += d.getYear();
	return(s);
}
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
///KIEM TRA DU LIEU CAP NHAT
updateError="";
if(parseFloat(latTDK)>0&&parseFloat(longTDK)>0&&parseFloat(accTDK)>0) {updateError="";} else {updateError+="Kinh độ, vĩ độ, độ chính xác phải là <b>số >0<b><br>";}

///CÂP NHAT DU LIEU
if(update=="yes" && updateError==""){
 	sql="SELECT * FROM tudieukhien WHERE maTDK="+maTDK+"";
	RS.Open(sql,conn,1,2); 
	RS("tenTDK")=tenTDK;//1
	RS("khongdauTDK")=locdau(tenTDK);
	RS("diachiTDK")=diachiTDK;//2
	RS("latTDK")=parseFloat(latTDK);///3
	RS("longTDK")=parseFloat(longTDK);//4
	RS("accTDK")=parseInt(accTDK);//5
	RS("maDuong")=maDuong;//6
	RS("makhTDK")=makhTDK;//7
	RS("idmTDK")=idmTDK;//8
	RS("rccbTDK")=rccbTDK;//9
	RS("dateTDK")=dateTDK;//10
	RS("noteTDK")=noteTDK;//11
	RS("userUpdateTDK")=Session("username");//12
	RS("dateUpdateTDK")=Homnay();//13
	RS.Update();
	RS.Close();
}

//////////HIEN THI THONG TIN DE CAP NHAT/////////////////
if(maTDK!="undefined"){
   //Lay du lieu ve ten duong va maduong
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
//Lay du lieu va tu dieu khien
   sql="SELECT * FROM tudieukhien WHERE maTDK="+maTDK+"";
   RS.Open(sql,conn,1,2); 
   if(!RS.EOF)
	{
		RS.MoveFirst();
		maTDK=RS("maTDK");
		maDuong=RS("maDuong");
		tenTDK=RS("tenTDK");
    	diachiTDK=RS("diachiTDK");
    	latTDK=RS("latTDK"); 
    	longTDK=RS("longTDK");
    	accTDK=RS("accTDK");
    	idmTDK=RS("idmTDK");
    	makhTDK=RS("makhTDK");
    	dateTDK=RS("dateTDK");
		noteTDK=RS("noteTDK");
		rccbTDK=RS("rccbTDK");
		rccbs="Chưa lắp đặt";
    	if(RS("rccbTDK")==1)rccbs="Đã lắp đặt";
   }
}
if(maTDK=="undefined" || RS.EOF)queryError+="Thông tin về tủ điều khiển cần cập nhật không hợp lệ</br>";  
 %>
<html> 
<head> 
 <meta http-equiv="Content-Language" content="en-us">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
 <title>Cap nhat thiet bi tu dieu khien</title> 
</head> 
<body onload="initMap()"> 
<%if (queryError=="") {%>
<form method="GET" action="updatetdk.asp">
<input type="hidden" name="update" value="yes">
<input type="hidden" name="maTDK" value="<%=maTDK%>">
<table border="0" width="100%" id="table1">
	<tr>
		<td colspan="4"><font size="4">Cập nhật thiết bị cho tủ điều khiển</font> <font color="#0000FF"><b><%=tenTDK%></b></font> bởi <%=Session("name")%> [ <a href="/admin/userman.asp"><%=Session("username")%></a> ]
		</td>
	</tr>
	<tr>
		<td width="15%">1.Tên tủ điều khiển</td>
		<td width="35%"><input type="text" name="tenTDK" size="20" value="<%=tenTDK%>"></td>
		<td width="15%">7.Mã khách hàng</td>
		<td width="35%"><input type="text" name="makhTDK" size="20" value="<%=makhTDK%>"></td>
	</tr>
	<tr>
		<td>2.Địa chỉ tủ điều khiển</td>
		<td><input type="text" name="diachiTDK" size="20" value="<%=diachiTDK%>"></td>
		<td>8.Loại tủ điều khiển</td>
		<td>
		<select size="1" name="idmTDK">
			 <%if(idmTDK==75){%> 	
				<option value="75" selected >75 A</option>
			    <option value="50" >50 A</option>
			 <%} else {%>
				<option value="75" >75 A</option>
			    <option value="50" selected>50 A</option>
			<%}%>	
		</select>
		</td>
	</tr>
	<tr>
		<td>3.Kinh độ(lat)</td>
		<td><input type="text" name="latTDK" size="20" value="<%=latTDK%>"></td>
		<td>9.RCCB</td>
		<td>
		 <select size="1" name="rccbTDK">
		 <%if(rccbTDK==1){%> 	
				<option value="1" selected >Đã lắp đặt</option>
			    <option value="0" >Chưa lắp đặt</option>
			 <%} else {%>
				<option value="1" >Đã lắp đặt</option>
			    <option value="0" selected>Chưa lắp đặt</option>
			<%}%>	
		</select>
	    </td>
	</tr>
	<tr>
		<td >4.Vĩ độ (long)</td>
		<td ><input type="text" name="longTDK" size="20" value="<%=longTDK%>"></td>
		<td >10.Ngày lắp đặt</td>
		<td ><input type="text" name="dateTDK" size="20" value="<%=dateTDK%>"></td>
	</tr>
	<tr>
		<td >5.Độ chính xác</td>
		<td ><input type="text" name="accTDK" size="20" value="<%=accTDK%>"></td>
		<td >11.Ghi chú</td>
		<td ><input type="text" name="noteTDK" size="20" value="<%=noteTDK%>"></td>
	</tr>
	<tr>
		<td >6.Thuộc đường</td>
		<td ><select size="1" name="maDuong">
			 <% 
       		j=0;
       		while(j<tuyenduong.length)
       		 { 
       		  if(matuyenduong[j]==maDuong){%> 	
				<option value="<%=matuyenduong[j]%>" selected><%=tuyenduong[j]%></option>
			  <%} else {%>
				<option value="<%=matuyenduong[j]%>"><%=tuyenduong[j]%></option>
				<%}
			j++;
			}
			%>	
		</select></td>
		<td >12.</td>
		<td ></td>
	</tr>
	<tr>
		<td colspan="4"><input type="submit" value="Cập nhật thông tin" />
		  <%if(update=="yes") {
		  	if (updateError==""){%> <font color="#0000FF" ><b>Thông tin đã được cập nhật !</b></font>
			 <%} else {%><font color="#FF0000" ><b>Cập nhật không thành công vì:</b> <%=updateError%> </font>
			 <%}
			} %>
		</td>
	</tr>
	</table>
</form>	
<div id="map_canvas" style="height: 500; width: 100%;"></div>
<%	RS.Close();%>
<%}else {%>
<font color="#FF0000"><b><%=queryError%></b></font>
<%}%>
</body> 
</html>