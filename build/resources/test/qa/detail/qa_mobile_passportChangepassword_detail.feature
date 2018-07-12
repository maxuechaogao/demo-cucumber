@qa_mobile_passportChangepassword_detail
Feature: 修改密码
	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 保存一个变量key="{pwd}",value="qwe123"
		When 保存一个变量key="{pwd_new}",value="qwe456"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存

	Scenario: type=40/注册用户成功
		When 等待1"分钟"
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number}&type=40"
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

	Scenario: 修改密码
		When 等待1"分钟"
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number}&type=50"
		Then json结果中包含"'code':200,'data':null,'message':'操作成功','success':true"

		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode}"命名保存

		When 保存一个变量key="{path}",value="/passport/changepassword"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"修改密码",url:"{url}{path}?r={r}&key={md5key}",param:"{'pwd':'{pwd_new}','mobile':'{phone_number}','code':'{verifyCode}'}"
		Then json结果中包含"'code':200,'message':'操作成功','success':true"

	Scenario Outline: <comment>
		When 保存一个变量key="{path}",value="/passport/login"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"<comment>",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'<loginName>','pwd':'<pwd>','checkId':'','checkCode':''}"
		Then json结果中包含"'code':<code>,'message':<message>,'success':<success>,'needCheckcode':<needCheckcode>,'companyRegistered':<companyRegistered>,'userStatus':<userStatus>,'userType':<userType>,'name':<name>"
		When 等待1"分钟"
		Examples:
			| comment | loginName      | pwd       | code  | message    | success | needCheckcode | companyRegistered | userType | userStatus | name           |
			| 旧密码登录   | {phone_number} | {pwd}     | 22003 | '用户名或密码错误' | false   | false         | false             | 0        | 0          | null           |
			| 新密码登录   | {phone_number} | {pwd_new} | 200   | null       | true    | false         | false             | 153      | 10         | '{phone_number}' |


	Scenario Outline: <comment>
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/changepassword"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"<comment>",url:"{url}{path}?r={r}&key={md5key}",param:"{'pwd':'<pwd>','mobile':'<mobile>','code':'<checkcode>'}"
		Then json结果中包含"'code':<code>,'message':'<message>','success':<success>"
		Examples:
			| comment        | mobile         | pwd     | checkcode    | code | message | success |
			| 缺少pwd          | {phone_number} |         | {verifyCode} | 400  | 参数错误    | false   |
			| mobile为空       |                | 123457  | {verifyCode} | 400  | 参数错误    | false   |
			| mobile为null    | null,          | 123457  | {verifyCode} | 400  | 参数错误    | false   |
			| code为空    | {phone_number} | qwe1234 |              | 400  | 参数错误    | false   |
			| code为null | {phone_number} | qwe1234 | null         | 604  | 短信验证码错误 | false   |
			| 短信验证码错误        | {phone_number} | qwe1234 | 1234         | 604  | 短信验证码错误 | false   |
			| 特殊字符code  | {phone_number} | qwe1234 | #@#1123      | 604  | 短信验证码错误 | false   |
			| 汉字code    | {phone_number} | qwe1234 | 汉字123        | 604  | 短信验证码错误 | false   |
			| 字母code    | {phone_number} | qwe1234 | qwerq123     | 604  | 短信验证码错误 | false   |
			| 10位mobile      | 1823333333     | 123457  | {verifyCode} | 400  | 参数错误    | false   |
			| 12位mobile      | 182333333333   | 123457  | {verifyCode} | 400  | 参数错误    | false   |
			| 含字母mobile      | 1823333333i    | 123457  | {verifyCode} | 400  | 参数错误    | false   |
			| 含特殊字符mobile    | 182333333$3    | 123457  | {verifyCode} | 400  | 参数错误    | false   |
			| 含汉字mobile      | 1823333333汉    | 123457  | {verifyCode} | 400  | 参数错误    | false   |
#  		 	|含汉字密码|{phone_number}|1234汉|{verifyCode}|400|参数错误|false|


	Scenario Outline: <comment>
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/changepassword"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"<comment>",url:"{url}{path}?r={r}&key={md5key}",param:"{'pwd':'<pwd>','mobile':'<mobile>','code':'<checkcode>'}"
		Then json结果中包含"'code':<code>,'message':'<message>','success':<success>"
		Examples:
			| comment        | mobile         | pwd     | checkcode    | code | message | success |
			| 含字母密码          | {phone_number} | 1234qwe | {verifyCode} | 200  | 操作成功    | true    |
			| 含特殊字符密码        | {phone_number} | 123$$%  | {verifyCode} | 200  | 操作成功    | true    |
			| 含全部数字密码        | {phone_number} | 123454  | {verifyCode} | 200  | 操作成功    | true    |
			| 含全部字母密码        | {phone_number} | qwer    | {verifyCode} | 200  | 操作成功    | true    |
			| pwd为null       | {phone_number} | null    | {verifyCode} | 200  | 操作成功    | true    |
