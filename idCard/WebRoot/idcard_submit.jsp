<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
String path = request.getContextPath();
request.setCharacterEncoding("utf-8");
String v_mid = request.getParameter("v_mid");
String v_idtype = request.getParameter("v_idtype");
String v_idnumber = request.getParameter("v_idnumber");
String v_idname = request.getParameter("v_idname");
com.capinfo.crypt.Md5 md5 = new com.capinfo.crypt.Md5("");
md5.hmac_Md5(java.net.URLEncoder.encode(v_mid + v_idtype + v_idnumber + v_idname,"UTF-8"), "bhgmD5P1qazxsw23");//第一个参数是加密参数，第二个参数是加密密钥，测试密钥：test，正式上线之前注意修改
byte b[]= md5.getDigest();
String v_mac = md5.stringify(b);//订单数字指纹
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>身份验证</title>
  </head>
  <body>
    <form id="test1" name="test1" method="post" action="https://api.yizhifubj.com/merchant/ack/idcard_ack_verify_list.jsp">
    <table align="center">
      <tr>
       <td>商户编号</td>
       <td><input type="text" id="v_mid" name="v_mid"value="<%=v_mid%>"></td></tr>
       <tr>
       <td>证件类型</td>
       <td><input type="text" id="v_idtype" name="v_idtype" value="<%=v_idtype%>"></td></tr>
       <tr>
       <td>证件编号</td>
       <td><input type="text" id="v_idnumber" name="v_idnumber" value="<%=v_idnumber%>"></td></tr>
       <tr>
       <td>证件名称</td>
       <td><input type="text" id="v_idname" name="v_idname" value="<%=v_idname%>"></td></tr>
       <tr>
       <td>数字指纹</td>
       <td><input type="text" name="v_mac" id="v_mac" value="<%=v_mac%>"></td></tr>
       <tr>
       <td><input type="submit" name="submit" value="submit"></td></tr>
       </table>
    </form>
  </body>
</html>  
  
