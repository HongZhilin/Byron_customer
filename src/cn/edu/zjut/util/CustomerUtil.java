package cn.edu.zjut.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * 
 * Title:CustomerUtil
 * description:
 * @author Byron
 * @date 2016年3月12日 下午3:16:20
 * @version 1.0.0
 */
public class CustomerUtil {

	// java:byte short int long float double boolean char
	// javascript: number String object(null [] Date...) function undefined boolean
	
	public static String getResult(String info) throws Exception{
		//设置请求编码
		String question = URLEncoder.encode(info,"utf-8");
		
		//最终请求的URL
		String requestUrl = "http://www.tuling123.com/openapi/api?"+
							"key=0f25586d336dc4534dba3d1fe6798524&info="+question;
		
		URL getUrl = new URL(requestUrl);
		//获取连接对象
		URLConnection connection = getUrl.openConnection();
		//进行连接
		connection.connect();
		
		//理解javase io java.net java.io 
		InputStream in = connection.getInputStream();	//字节流
		
		//Buffered 缓存区       InputStreamReader:字节流转换成字符流的桥梁
		BufferedReader br = new BufferedReader(new InputStreamReader(in,"utf-8"));		//字节流转换成字符流
		//创建一个StringBuffer对象
		StringBuffer sb = new StringBuffer();
		String line = "";
		while((line = br.readLine())!=null){
			sb.append(line);
		}
		//关闭流
		br.close();
		in.close();
		return sb.toString();
	}
	
	
	public static void main(String[] args) throws Exception{
		System.out.println(getResult("你好"));
	}
	
}
