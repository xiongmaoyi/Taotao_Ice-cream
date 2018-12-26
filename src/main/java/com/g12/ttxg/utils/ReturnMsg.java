package com.g12.ttxg.utils;

import java.util.HashMap;
import java.util.Map;


/**
 *
 * 数据返回包装类
 */

public class ReturnMsg {
	/**
	 * 自己定义的状态吗
	 */
	private int code;
	/**
	 * 提示信息
	 */
	private String msg;
	/**
	 * 用户要返回浏览器的数据
	 */
	private Map<String,Object> data = new HashMap<String, Object>();

	/**
	 * 成功信息
	 * @return
	 */
	
	public static ReturnMsg success(){
		ReturnMsg resultMsg =new ReturnMsg();
		resultMsg.setCode(100);
		resultMsg.setMsg("处理成功");
		return resultMsg;
	}

	/**
	 * 失败信息
	 * @return
	 */

	public static ReturnMsg fail(){
		ReturnMsg resultMsg =new ReturnMsg();
		resultMsg.setCode(200);
		resultMsg.setMsg("处理失败");
		return resultMsg;
	}
	/**
	 * 添加数据
	 * @param key
	 * @param value
	 * @return
	 */

	public ReturnMsg add(String key,Object value){
		this.data.put(key, value);
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
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	

}
