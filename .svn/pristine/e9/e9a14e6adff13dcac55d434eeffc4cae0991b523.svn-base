@qa_mobile_passportRegisterCompany_detail
Feature: 注册公司信息
	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 保存一个变量key="{pwd}",value="qwe123"
#		When 保存一个变量key="{access_token}",value="0f133c5aa8d64826b66d028070f823b8"
#		When 保存一个变量key="{refresh_Token}",value="8bcce428f303419397867f0f1602c347"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存

	Scenario: 注册用户
		When 等待1"分钟"
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"http://api-qa.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&type=40"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"
		Then json结果中共有5个字段
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存

		When 保存一个变量key="{path}",value="/passport/register"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"注册成功",url:"{url}{path}?r={r}&key={md5key}",param:"{'mobile':'{phone_number}','pwd':'{pwd}','checkcode':'{verifyCode}'}"
		Then json结果中包含"'code':200,'message':null,'success':true"
		Then json结果中共有6个字段
		When 把"data,accessToken"以"{access_token}"命名保存
		When 把"data,refreshToken"以"{refresh_Token}"命名保存


	Scenario: companyName
		When 等待1"秒"
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 保存一个变量key="{path}",value="/passport/registercompany"
		When 生产一个当前时间戳,以"{r}"命名保存
   		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"companyName为空",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':167,'message':'公司名称不能为空且限制4-128个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"companyName为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':null,'cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':167,'message':'公司名称不能为空且限制4-128个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"companyName长度3个字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'qwe','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':167,'message':'公司名称不能为空且限制4-128个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"companyName长度128个字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四q','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':167,'message':'公司名称不能为空且限制4-128个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"companyName为int",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':123,'cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':167,'message':'公司名称不能为空且限制4-128个字符','success':false"


	Scenario: staffName
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"staffName为空",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':165,'message':'姓名不能为空且限制1-50个字符','success':false"
		When 等待1"秒"
   		When 生产一个当前时间戳,以"{r}"命名保存
   		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"staffName为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':null,'nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':165,'message':'姓名不能为空且限制1-50个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"staffName为51个字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'一二三四五六七八九十一二三四五六七八九十一二三四五q','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':165,'message':'姓名不能为空且限制1-50个字符','success':false"

	Scenario: cityId
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"cityId为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':null,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':214,'message':'请选择城市','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"cityId为负数",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':-1,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':214,'message':'请选择城市','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"cityId为999",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':999,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':214,'message':'请选择城市','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"cityId为空",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':'','staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':214,'message':'请选择城市','success':false"

	Scenario: cityId
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"cityId为字母",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':qwe,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':550,'message':'未知异常','success':false"
	Scenario: cityId
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"cityId为特殊字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':!@,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':550,'message':'未知异常','success':false"

	Scenario: email
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
   		When 生产一个当前时间戳,以"{r}"命名保存
   		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"email为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':null}"
		Then json结果中包含"'code':164,'message':'邮箱格式不正确，请修改后保存','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"email格式错误",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112qq.com'}"
		Then json结果中包含"'code':164,'message':'邮箱格式不正确，请修改后保存 ','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"email含汉字",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112汉字@qq.com'}"
		Then json结果中包含"'code':164,'message':'邮箱格式不正确，请修改后保存 ','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"email含特殊字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':'3221112#!@qq.com'}"
		Then json结果中包含"'code':164,'message':'邮箱格式不正确，请修改后保存 ','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"email为空",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':''}"
		Then json结果中包含"'code':164,'message':'邮箱格式不正确，请修改后保存','success':false"
	Scenario: email
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"email为int",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'','userName':'{phone_number}','email':3221112@qq.com}"
		Then json结果中包含"'code':550,'message':'未知异常','success':false"


	Scenario: nickName
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"nickName为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':null,'sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':166,'message':'昵称不能为空且限制6-24个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"nickName5个字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'qwere','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':166,'message':'昵称不能为空且限制6-24个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"nickName25个字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'一二三四五六七八九十qwere','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':166,'message':'昵称不能为空且限制6-24个字符','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"nickName为空",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':166,'message':'昵称不能为空且限制6-24个字符','success':false"

	Scenario: phone
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"phone为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':null,'userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':550,'message':'未知异常','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"phone含字母",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'010-qwe','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':168,'message':'固定电话格式错误','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"phone含汉字",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'010-qwe汉字','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':168,'message':'固定电话格式错误','success':false"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"phone为int",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':1,'phone':'010-qwe汉字','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':168,'message':'固定电话格式错误','success':false"

	Scenario: sex
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"sex为3",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':3,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':3003,'message':'请选择性别 ','success':false"
	Scenario: sex
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"sex为字母",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':qwe,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':550,'message':'未知异常 ','success':false"
	Scenario: sex
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"sex为特殊字符",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':#@!,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':550,'message':'未知异常 ','success':false"
	Scenario: sex
		When 设置at为"{access_token}"
		When 设置rt为"{refresh_Token}"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"sex为字符串",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'测试公司','cityId':530,'staffName':'联系人','nickName':'这是6位昵称','sex':'qwe','phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
		Then json结果中包含"'code':550,'message':'未知异常 ','success':false"


# 由于注册公司信息接口规则变为：若当前公司信息已经得到完善，将不能再次成功调用该接口，以下情况均为code：200情况
#	Scenario Outline: <comment>
#		When 设置at为"{access_token}"
#		When 设置rt为"{refresh_Token}"
#		When 调用POST_Json接口,testContent:"注册公司信息第二步_detail",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':<companyName>,'cityId':<cityId>,'staffName':<staffName>,'nickName':<nickName>,'sex':<sex>,'phone':<phone>,'email':<email>}"
#		Then json结果中包含"'code':<code>,'message':'<message>','success':<success>"
#
#		Examples:
#			|comment  		|companyName|cityId|staffName|nickName|sex|phone|email|code|data|message|success|
#			|sex为null|'测试公司'|530|'联系人'|'这是6位昵称'|null|''|'3221112@qq.com'|200||操作成功|true|
#			|phone为空|'测试公司'|530|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|cityId为string|'测试公司'|'530'|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
##   		|cityId为汉字|'测试公司'|'北京'|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|sex为空|'测试公司'|530|'联系人'|'这是6位昵称'|''|''|'3221112@qq.com'|200||操作成功|true|
#			|phone为空|'测试公司'|530|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|companyName长度4个字符|'qwwq'|530|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|staffName1个字符|'测试公司'|530|'q'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|sex=2|'测试公司'|530|'联系人'|'这是6位昵称'|2|''|'3221112@qq.com'|200||操作成功|true|
#			|sex=1|'测试公司'|530|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|companyName含特殊字符|'qwwq#*'|530|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|companyName长度128个字符|'一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四'|530|'联系人'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|staffName50个字符|'测试公司'|530|'一二三四五六七八九十一二三四五六七八九十一二三四五'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|staffName为int|'测试公司'|530|123456|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|staffName含特殊字符|'测试公司'|530|'一二三四五@#<>'|'这是6位昵称'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|nickName6个字符|'测试公司'|530|'联系人'|'qwerty'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|nickName24个字符|'测试公司'|530|'联系人'|'一二三四五六七八九十一二'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|nickName含特殊字符|'测试公司'|530|'联系人'|'qwert#@!'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|nickName含数字|'测试公司'|530|'联系人'|'1234544'|1|''|'3221112@qq.com'|200||操作成功|true|
#			|nickName为int|'测试公司'|530|'联系人'|123453|1|''|'3221112@qq.com'|200||操作成功|true|

#