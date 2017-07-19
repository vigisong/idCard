package com.payeasenet.demo;

import java.io.IOException;
import java.net.URLEncoder;

import javax.ws.rs.core.MultivaluedMap;

import com.capinfo.crypt.Md5;
import com.payeasenet.demo.utils.SAXParser;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

public class TestShanghu {

	public static void main(String[] args) throws IOException {
		String XML = CheckID(); //
		System.out.println(XML); //获得接口返回xml数据
		String ret = SAXParser.SAXParseNodeValue(XML, "status");
		// 解析xml中数据请参考类 DuXMLDoc.java
		System.out.println(ret);
		if (ret != null && "0".equals(ret)) {
			System.out.println("接口响应成功");
			// 验证状态对比
			String v_verifystatus = SAXParser.SAXParseNodeValue(XML, "verifystatus");
			if ("1".equals(v_verifystatus)) {
				System.out.println("公民身份号码和姓名的核查结果都一致");
				// TODO 更新
				// 更新数据库pstatus
			} else if("0".equals(v_verifystatus)){
				System.out.println("库中无此号");
			} else if("2".equals(v_verifystatus)){
				System.out.println("公民身份号码的核查结果一致，姓名的核查结果不一致");
			} else{
				System.out.println("验证状态返回异常");
			}
		} else {
			System.out.println("接口响应异常");
		}


	}
		public static String CheckID() throws IOException {
			Client cc = Client.create();
			WebResource rr = cc.resource("https://api.yizhifubj.com/merchant/ack/idcard_ack_verify_list.jsp");

			MultivaluedMap queryParams = new MultivaluedMapImpl();
			String v_mid = "***";//商户号
			String MD5Key = "test";//MD5Key,
			String idname = "张三";//姓名 
			String v_idtype = "01"; //证件类型
			String v_idnumber = "410**********1";//证件编号
			
			String v_mac = v_mid + v_idtype + v_idnumber + idname;//v_mac拼串
			v_mac = java.net.URLEncoder.encode(v_mac,"UTF-8"); 
			
			queryParams.add("v_mid", v_mid); 
			queryParams.add("v_idtype", v_idtype); 
			queryParams.add("v_idname", URLEncoder.encode(idname,"GBK")); //中文encode，鉴权通道编码格式GBK
			queryParams.add("v_idnumber", v_idnumber);

			Md5 md5 = new Md5("");
			md5.hmac_Md5(v_mac, "test"); //第一个参数是加密参数，第二个参数是加密密钥，测试密钥：test，正式上线之前注意修改
			byte b[] = md5.getDigest();
			String digestString = md5.stringify(b);

			queryParams.add("v_mac", digestString); // 
			String ret = rr.queryParams(queryParams).get(String.class);
			return ret;
		}

}
