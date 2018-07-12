package fun;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class Filter {

	public static Map<String, String> values = new HashMap<String, String>();
	
	private String tokenName = "access_token=";
	/**
	 * 替换字符串中的{xx}为变量
	 * @param value 准备替换变量的字符串
	 * @return 替换后的字符串
	 */
	public String filterValue(String value) {
		if(value.contains("{open_url}")){
			if(!value.contains("?")){
				value += "?" + tokenName + values.get("{jobrpc_token}");
			}else{
				value += "&" + tokenName + values.get("{jobrpc_token}");
			}
		}
		Map<String, String> vars = new HashMap<String, String>();
		vars.putAll(values);
		for(Entry<String, String> entry : vars.entrySet()){
			if (value.contains(entry.getKey())) {
				value = value.replace(entry.getKey(), entry.getValue());
			}
		}
		value = value.replaceAll("'", "\"");
		return value;
	}
	

	public static class WXFilter{

		private static List<String> errs = new ArrayList<String>();
		private static HashMap<String, String> parentSunControl = new HashMap<String, String>();
		
		/**
		 * 主要测试接口报错后把url存进来
		 * @param err
		 */
		public static void addErrs(String err) {
			errs.add(err);
		}
		
		/**
		 * 设置前置接口和检查接口的对应关系(接口可只写路径   域名后到?前)
		 * @param parent 前置接口
		 * @param sun	被测接口  多个用 , 分割
		 */
		public static void setControl(String parent, String sun){
			parentSunControl.put(parent, sun);
		}
		
		/**
		 * 判断前置接口是否失败
		 * @param url 需要检查的url
		 * @return true、false
		 */
		public static boolean parentHasErr(String url){
			String qian = null;
			Set<Entry<String, String>>  entrys = parentSunControl.entrySet();
			for(Entry<?, ?> entry:entrys){
				String suns[] = entry.getValue().toString().split(",");
				int index = 0;
				for(int i=0; i<suns.length; i++){
					if(url.contains(suns[index])){
						qian = entry.getKey().toString();
						break;
					}
				}
			}
			for(String err:errs){
				if(qian != null && err.contains(qian)){
					return true;
				}
			}
			return false;
		}
	}
	
}
