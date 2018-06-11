package cn.com.ttxg.controller;

import java.util.HashMap;
import java.util.Map;

public class ReturnMsg {
	//自己定义的状态吗
	private int code;
	//提示信息
	private String msg;
	//用户要返回浏览器的数据
	private Map<String,Object> extend = new HashMap<String, Object>();
	
	
	public static ReturnMsg success(){
		ReturnMsg resultMsg =new ReturnMsg();
		resultMsg.setCode(100);
		resultMsg.setMsg("处理成功");
		return resultMsg;
	}
	public static ReturnMsg fail(){
		ReturnMsg resultMsg =new ReturnMsg();
		resultMsg.setCode(200);
		resultMsg.setMsg("处理失败");
		return resultMsg;
	}
	
	public ReturnMsg add(String key,Object value){
		this.extend.put(key, value);
		return this;
	}
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	

}
