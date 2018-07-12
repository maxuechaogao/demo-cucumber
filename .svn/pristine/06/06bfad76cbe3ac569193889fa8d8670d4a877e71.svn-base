@qa_mobile_allbasedata_smoke
Feature: 基础数据
	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 保存一个变量key="{path}",value="/settings/allbasedata"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
  	Scenario: 成功请求接口
		When 调用GET接口,testContent:"基础数据",url:"{url}{path}?r={r}&key={md5key}&version=dd"
    	Then json结果中包含"'code':200,'message':'','success':true"
