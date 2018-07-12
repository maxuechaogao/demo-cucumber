@qa_mobile_scenario_login&login_by_token
Feature: 情景：ihr平台/rd平台/c端用户登录

	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 保存一个变量key="{path}",value="/passport/login"
		When 保存一个变量key="{ihr}",value="pctest011"
		When 保存一个变量key="{rd}",value="testdep"
		When 保存一个变量key="{c_client}",value="lianxl201@163.com"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存

	Scenario:ihr用户
		When 等待1"分钟"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"登录",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{ihr}','pwd':'test123456','checkId':'','checkCode':''}"
		Then json结果中包含"'code':200,'message':null,'success':true,'needCheckcode':false,'companyRegistered':true,'userStatus':20,'userType':153"
		When 把"data,accessToken"以"{access_token}"命名保存
		When 把"data,refreshToken"以"{refresh_Token}"命名保存

	 #验证登录_by_token
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 保存一个变量key="{path}",value="/passport/tokeninfo"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"验证登录_by_token",url:"{url}{path}?r={r}&key={md5key}"
		Then json结果中包含"'code':200,'message':null,'success':true,'needCheckcode':false,'companyRegistered':true,'userStatus':20,'userType':153"

	Scenario:rd用户
#		When 等待1"分钟"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/login"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"登录",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{rd}','pwd':'123456','checkId':'','checkCode':''}"
		Then json结果中包含"'code':200,'message':null,'success':true,'needCheckcode':false,'companyRegistered':true,'userStatus':20"
		When 把"data,accessToken"以"{access_token}"命名保存
		When 把"data,refreshToken"以"{refresh_Token}"命名保存

	 #验证登录_by_token
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 保存一个变量key="{path}",value="/passport/tokeninfo"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"验证登录_by_token",url:"{url}{path}?r={r}&key={md5key}"
		Then json结果中包含"'code':200,'message':null,'success':true,'needCheckcode':false,'companyRegistered':true,'userStatus':20"

	Scenario:c端用户
		When 等待1"分钟"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/login"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"登录",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{c_client}','pwd':'test','checkId':'','checkCode':''}"
		Then json结果中包含"'code':22003,'message':'用户名或密码错误','success':false"

