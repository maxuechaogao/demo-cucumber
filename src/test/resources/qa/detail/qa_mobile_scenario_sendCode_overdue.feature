@qa_mobile_scenario_sendCode_overdue
Feature: 情景：发送验证码-》等待10分钟-》注册用户

	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存

	Scenario: 发送验证码
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number}&type=40"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"
		Then json结果中共有5个字段
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存

		When 等待10"分钟"
		When 保存一个变量key="{path}",value="/passport/register"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"注册用户",url:"{url}{path}?r={r}&key={md5key}",param:"{'mobile':'{phone_number}','pwd':'{pwd}','checkcode':'{verifyCode}'}"
		Then json结果中包含"'code':610,'message':'验证码已过期','success':false"

    	