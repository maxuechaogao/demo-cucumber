@qa_mobile_scenario_sendCode
Feature: 情景：注册成功-》修改密码

	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 保存一个变量key="{pwd}",value="qwe123"
		When 保存一个变量key="{pwd_new}",value="qwe456"
		When 保存一个变量key="{type40}",value="40"
		When 保存一个变量key="{type50}",value="50"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存

	Scenario: phone1/type=40/注册成功
#		When 等待1"分钟"
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number}&type=40"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"
		Then json结果中共有5个字段
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/register"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"注册成功",url:"{url}{path}?r={r}&key={md5key}",param:"{'mobile':'{phone_number}','pwd':'{pwd}','checkcode':'{verifyCode}'}"
		Then json结果中包含"'code':200,'message':null,'success':true"
		Then json结果中共有6个字段

	Scenario: phone1/type=50/修改密码成功
		When 等待1"分钟"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number}&type={type50}"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"
		Then json结果中共有5个字段
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存

		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/changepassword"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"修改密码成功",url:"{url}{path}?r={r}&key={md5key}",param:"{'pwd':'{pwd_new}','mobile':'{phone_number}','code':'{verifyCode}'}"
		Then json结果中包含"'code':200,'message':'操作成功','success':true"

	Scenario: phone1/type=40/修改密码失败
		When 等待1"分钟"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number}&type={type40}"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"
		Then json结果中共有5个字段
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存

		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/changepassword"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"修改密码失败",url:"{url}{path}?r={r}&key={md5key}",param:"{'pwd':'{pwd_new}','mobile':'{phone_number}','code':'{verifyCode}'}"
		Then json结果中包含"'code':604,'message':'短信验证码错误','success':false"

	Scenario: phone/type=50/注册失败
		When 生产一个随机phoneNumber,以"{phone_number_new}"命名保存
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number_new}&type=50"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"
		Then json结果中共有5个字段

		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number_new}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存

		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/register"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"注册失败",url:"{url}{path}?r={r}&key={md5key}",param:"{'mobile':'{phone_number_new}','pwd':'{pwd}','checkcode':'{verifyCode}'}"
		Then json结果中包含"'code':604,'message':'短信验证码错误','success':false"



