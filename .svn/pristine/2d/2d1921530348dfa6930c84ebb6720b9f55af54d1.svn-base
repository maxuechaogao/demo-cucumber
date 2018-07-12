package fun;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class test {
    public void json() throws JSONException {
        JSONObject jsonobj = new JSONObject("{'name':'xiazdong','age':20}");
        String name = jsonobj.getString("name");
        int age = jsonobj.getInt("age");
        System.out.println(name+":"+age);
    }
    public static Map map(){
         Map<Integer, String> values = new HashMap<>();
         values.put(2,"1");
         values.put(3,"2");
        for(Integer key : values.keySet()){
            System.out.println(key + ":" + values.get(key));
        }
         return values;
    }


    public static void main(String[] args) throws Exception {
        Map map = map();
        System.out.println(map.keySet());
        System.out.println(map.remove(2));
        System.out.println(map.entrySet());
    }

}