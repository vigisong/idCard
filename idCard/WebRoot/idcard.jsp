<%
	/* *
	 *功能：身份认证接口
	 *版本：1.1
	 *日期：2015-08-17
	 *说明：
	 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	 */
%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>身份验证</title>
  </head>
  <body>
    <form id="test1" name="test1" method="post" action="<%=path%>/idcard_submit.jsp">
    <table align="center">
      <tr>
       <td>商户编号</td>
       <td><input type="text" id="v_mid" name="v_mid"value=""></td></tr>
       <tr>
       <td>证件类型</td>
       <td><input type="text" id="v_idtype" name="v_idtype" value="01"></td></tr>
       <tr>
       <td>证件编号</td>
       <td><input type="text" id="v_idnumber" name="v_idnumber" value=""></td></tr>
       <tr>
       <td>证件名称</td>
       <td><input type="text" id="v_idname" name="v_idname" value=""></td></tr>
       <tr>
       <td><input type="submit" name="submit" value="submit"></td></tr>
       </table>
    </form>
  </body>
</html>  
  
