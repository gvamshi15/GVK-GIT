/**
 * 
 */
package com.json.sai;

import net.sf.json.JSONObject;

/**
 * @author Lenovo
 *
 */
public class TestJson {

	/**
	 * 
	 */
	public TestJson() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		JSONObject jo=new JSONObject();
        jo.put("site","java4s.com");
        jo.put("content","Java");
        jo.put("TotalLinks",927);
        System.out.println(jo);

	}

}

