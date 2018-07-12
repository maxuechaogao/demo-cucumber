@qa_mobile_passport_checkcode_smoke
Feature: 获取图片验证码
	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 保存一个变量key="{path}",value="/passport/checkcode"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
  	Scenario: 获取图片验证码
		When 调用GET接口forcheckId,testContent:"获取图片验证码",url:"{url}{path}?r={r}&key={md5key}"
    	Then json结果中包含"'checkId'"
