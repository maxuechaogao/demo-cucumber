@qa_mobile_passportRegister_detail
Feature: 注册用户
	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com/"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 保存一个变量key="{pwd}",value="qwe123"
		When 设置fromsystem为"23"
		When 设置deviceid为"qwertyu"
		When 生产一个当前时间戳,以"{r}"命名保存

	Scenario Outline: <comment>
		When 等待1"秒"
		When 生产一个随机phoneNumber,以"{phone_number_new}"命名保存
		When 保存一个变量key="{path}",value="/passport/sendmobilecode"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number_new}&type=40"
		Then json结果中包含"'code':200,'message':'操作成功'"
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/test/mcode.do"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用GET接口,url:"http://mobileapi.zhaopin.com{path}?r={r}&key={md5key}&mobile={phone_number_new}&p=1q2w3e4r.com"
		When 把"data,verifyCode"以"{verifyCode_new}"命名保存
		When 等待1"秒"
		When 生产一个当前时间戳,以"{r}"命名保存
		When 保存一个变量key="{path}",value="/passport/register"
		When 生成一个md5key,以"{md5key}"命名保存
		When 调用POST_Json接口,testContent:"<comment>",url:"{url}{path}?r={r}&key={md5key}",param:"{'mobile':<mobile>,'pwd':<pwd>,'checkcode':<checkcode>}"
		Then json结果中包含"'code':<code>,'data':<data>,'message':<message>,'success':<success>"

		Examples:
			| comment        | mobile               | pwd     | checkcode          | code  | data | message    | success |
			| mobile为空       | ''                   | '{pwd}' | '{verifyCode_new}' | 400   | null | '参数错误',    | false   |
			| mobile=null    | null                 | '{pwd}' | '{verifyCode_new}' | 400   | null | '参数错误',    | false   |
			| pwd为空          | '{phone_number_new}' | ''      | '{verifyCode_new}' | 400   | null | '参数错误',    | false   |
			| pwd=null       | '{phone_number_new}' | null    | '{verifyCode_new}' | 400   | null | '参数错误',    | false   |
			| checkcode为空    | '{phone_number_new}' | '{pwd}' | ''                 | 400   | null | '参数错误',    | false   |
			| checkcode为null | '{phone_number_new}' | '{pwd}' | null               | 400   | null | '参数错误',    | false   |
			| checkcode为特殊字符 | '{phone_number_new}' | '{pwd}' | '!@#1234'          | 604   | null | '短信验证码错误', | false   |
			| checkcode为汉字   | '{phone_number_new}' | '{pwd}' | '!汉字1234'          | 604   | null | '短信验证码错误', | false   |
			| checkcode为字母   | '{phone_number_new}' | '{pwd}' | 'qwer'             | 604   | null | '短信验证码错误', | false   |
			| 10位数字mobile    | '1345443332'         | '{pwd}' | '{verifyCode_new}' | 22102 | null | '手机格式不正确', | false   |
			| 12位数字mobile    | '134544333212'       | '{pwd}' | '{verifyCode_new}' | 22102 | null | '手机格式不正确', | false   |
			| mobile含汉字      | '134544汉字212'        | '{pwd}' | '{verifyCode_new}' | 22102 | null | '手机格式不正确', | false   |
			| 含字母mobile      | '134544we332'        | '{pwd}' | '{verifyCode_new}' | 22102 | null | '手机格式不正确', | false   |
			| 含特殊字符mobile    | '1345443%332'        | '{pwd}' | '{verifyCode_new}' | 22102 | null | '手机格式不正确', | false   |
			| 短信验证码错误        | '{phone_number_new}' | '{pwd}' | '1234'             | 604   | null | '短信验证码错误', | false   |


#			|10位数字pwd		|'{phone_number_new}'|'1234512345'|'{verifyCode_new}'|200||null,|true||
#			|含特殊字符pwd	|'{phone_number_new}'|'123#@#'|'{verifyCode_new}'|200||null,|true||
#			|含汉字pwd	|'{phone_number_new}'|'123汉字'|'{verifyCode_new}'|200||null,|true||

