package fun;

import java.util.List;
import java.util.Map;

public class Weixin {
	public static final String url = "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=wx39d5b6e7cc28c612&corpsecret=D87DV5Zr96dqPm_TBAzFQXkDchLvFdoUE1M0tRDgP2mqhQSKlDUL822KXQjEx9br";
	public static final String sendUrl_q = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=";
	public static String touser = "";
	public static String toparty = "";
	public static String totag = "";
	
	public Weixin(String touser, String toparty){
		this.touser = touser;
		this.toparty = toparty;
	}
	
	public void sendNews(List<Map<String, String>> msgs){
		String result = new HttpRequest().sendGet(url);
		String access_token = JsonHelper.getValue(result,new String[]{"access_token"});
		System.out.println(result);
		String sendUrl = sendUrl_q+access_token;
		String param_q="{\"touser\":\""+touser+"\",\"toparty\":\""+toparty+"\",\"totag\":\""+totag+"\",\"msgtype\":\"news\",\"agentid\":1,\"news\":{\"articles\":[";
		String param_h = "]}}";
		for(int i=0; i<msgs.size(); i++){
			param_q += "{";
			param_q += "\"title\":\"" + msgs.get(i).get("title").replace("\"", "'") + "\"";
			param_q += ",";
			param_q += "\"description\":\"" + msgs.get(i).get("description").replace("\"", "'") + "\"";
			param_q += ",";
			param_q += "\"url\":\"" + msgs.get(i).get("url").replace("\"", "'") + "\"";
			param_q += ",";
			param_q += "\"picurl\":\"" + msgs.get(i).get("picurl").replace("\"", "'") + "\"";
			param_q += "}";
			if(i!=msgs.size()-1){
				param_q += ",";
			}
		}
		String result_msg =  new HttpRequest().SendPost_json(sendUrl, param_q + param_h);
		System.out.println(result_msg);
	}
	
	public static void main(String [] args){
		OperateFileUtils ofu = new  OperateFileUtils();
		ofu.writeErrLog("error.log", "###数据对比失败，请确认数据问题还是接口存在异常###", "http://www.baidu.com", "POST", "{\"param\":\"param\"}", "{\"json\":\"json\"}", "json结果中不包含：\nasd\ndscdc\najaksd\nadha");
//		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("title", "xx报错数据对比异常");
//		map.put("description", "json结果中不包含：111\n222\n333\n444");
//		map.put("url", "www.baidu.com");
//		map.put("picurl", "");
//		list.add(map);
//		map.clear();
//		map.put("title", "xx报错数据对比异常a");
//		map.put("description", "json结果中不包含：1111\n2222\n3333\n4444");
//		map.put("url", "www.baidu.com");
//		map.put("picurl", "");
//		list.add(map);
//		
//		new Weixin("minggui.han").sendNews(list);
	}

}
