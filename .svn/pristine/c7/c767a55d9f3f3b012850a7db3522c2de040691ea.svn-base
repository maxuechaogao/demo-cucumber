package fun;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

public class JsonHelper {
	private static Log log = LogFactory.getLog(JsonHelper.class);
	
	/**
	 * 从json中取出指定key的value
	 * 场景1：取出json中result列表下data列表下type的值		keys[]={"result","data","type"}
	 * 场景2：取出json中result列表下data[]列表下第3个列表下的type的值	keys[] = {"result","data","3","type"}
	 * @param data json字符串
	 * @param keys  key的完整层级目录
	 * @return value
	 */
	public static Object getValue_data(String data, String[] keys){
		JSONObject jo = JSONObject.fromObject(data);
		if(keys[0].equals("") || keys[0] == null){
			return data;
		}
		for(int i=0; i<keys.length-1; i++){
			if(jo.getString(keys[i]).charAt(0) == '['){
				JSONArray ja = jo.getJSONArray(keys[i]);
				if(i<keys.length-1 && StrHelper.isNum(keys[i+1])){
					jo = ja.getJSONObject(Integer.parseInt(keys[++i]));
				}else{
					jo = ja.getJSONObject(0);
				}
			}else{
				jo = jo.getJSONObject(keys[i]);
			}
		}
		return jo.get(keys[keys.length-1]);//返回object对象
	}

	
	

	/**
	 * 解析json某个key的value
	 * 
	 * @param json
	 * @param key
	 * @return
	 */
	public static String parseJson(String json, String dataKey, String key) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		Object value=null;
		if(dataKey!=""){
			JSONObject object = jsonObject.getJSONObject(dataKey);
			value = object.get(key);
		}else{
			value = jsonObject.get(key);
		}
		return value.toString();
	}

	/**
	 * 解析json Array key 的value
	 * 
	 * @param json
	 * @param dataKey 
	 * @param key
	 * @return
	 */
	public static String parseJsonArray(String json, String dataKey, String key) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		JSONArray array = jsonObject.getJSONArray(dataKey);
		JSONObject row = array.getJSONObject(0);
		Object value = row.get(key);
		return value.toString();
	}
	
	/**
	 * 从json中取出指定key的value
	 * @param data json字符串
	 * @param keys  指定key前面的所有容器和指定key 
	 * @return value
	 */
	public static String getValue(String data, String[] keys){
		JSONObject jo = JSONObject.fromObject(data);
		if(keys[0].equals("") || keys[0] == null){
			return data;
		}
		for(int i=0; i<keys.length-1; i++){
			if(jo.getString(keys[i]).charAt(0) == '['){
				JSONArray ja = jo.getJSONArray(keys[i]);
				try{
					if(i<keys.length-1 && StrHelper.isNum(keys[i+1])){
						jo = ja.getJSONObject(Integer.parseInt(keys[++i]));
					}else{
						jo = ja.getJSONObject(0);
					}
				}catch(IndexOutOfBoundsException e){
					String notHave = "";
					for(int j=0; j<=i; j++){
						notHave += keys[j] + ":{ ";
					}
					throw new RuntimeException("json中不包含"+notHave+"字段 \n json:" + data + "\n keys:" + notHave+"\n"+e.getMessage());
				}
			}else{
				jo = jo.getJSONObject(keys[i]);
			}
		}
		String ret = null;
		try{
			ret = jo.getString(keys[keys.length-1]); 
		}catch(JSONException e){
			throw new RuntimeException("从"+jo+"中取"+keys[keys.length-1]+"时发生异常\n" + "\n json:" + data);
		}
		return jo.getString(keys[keys.length-1]);
	}
	
	/**
	 * 解析json Array key 的value
	 * 
	 * @param json
	 * @param dataKey
	 * @param key
	 * @return
	 */
	public static String parseJsonArray(String json, String dataKey1,String datakey2,String key) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		JSONObject object = jsonObject.getJSONObject(dataKey1);
		JSONArray array = object.getJSONArray(datakey2);
		JSONObject row = array.getJSONObject(0);
		Object value = row.get(key);
		return value.toString();
	}
	
	/**
	 * 解析json Array key 的value
	 * 
	 * @param json
	 * @param dataKey
	 * @param key
	 * @return
	 */
	public static String parseJsonArray_list(String json, String dataKey1,String datakey2,String datakey3,String key) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		JSONObject object = jsonObject.getJSONObject(dataKey1);
		JSONObject object1 = object.getJSONObject(datakey2);
		JSONArray array = object1.getJSONArray(datakey3);
		JSONObject row = array.getJSONObject(0);
		Object value = row.get(key);
		return value.toString();
	}
	
	/**
	 * 解析json Array key 的value
	 * 
	 * @param json
	 * @param dataKey
	 * @param key
	 * @return
	 */
	public static String parseJson_getlastArray(String json, String dataKey,String key) {
		JSONObject jsonObject = JSONObject.fromObject(json);
		JSONArray array = jsonObject.getJSONArray(dataKey);
		JSONObject row = array.getJSONObject(array.size()-1);
		Object value = row.get(key);
		return value.toString();
	}
}
