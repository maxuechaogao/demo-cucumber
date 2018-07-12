@test
Feature:

	Scenario: init
		When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
		When 生产一个随机phoneNumber,以"{phone_number}"命名保存
		When 保存一个变量key="{pwd}",value="qwe123"
		When 保存一个变量key="{pwd_new}",value="qwe456"
		When 保存一个变量key="{access_token}",value="6a50d021be4a438b9b5c55cc33aa2714"
		When 保存一个变量key="{refresh_Token}",value="e81cd5814ebd4f8b8890e8931ebfce99"
		When 生产一个当前时间戳,以"{r}"命名保存


	Scenario: 登录
		When 调用POST_Json接口,testContent:"登录",url:"{url}passport/login?r={r}&key=",param:"{'loginName':'{phone_number}','pwd':'{pwd}','checkId':'','checkCode':''}"
		Then json结果中包含"'code':200,'message':null,'success':true,'needCheckcode':false,'companyRegistered':true,'userStatus':10,'userType':153,'name':'{phone_number}'"

	Scenario: mini列表
		When 设置cookie
		When 调用GET接口,url:"{url}/ihrapi/job/minilist?access_token={access_token}&status=30&pageIndex=1&pageSize=1&jobStyle=0"
  #    Then json结果中包含"'code':2010,'success':true"
		Then 把"data,list,jobNumber"以"{jobNumber}"命名保存
		When 设置cookie
		When 调用POST接口,url:"{url}/ihrapi/job/jobdownline?access_token={access_token}",param:"jobNumber={jobNumber}"
		Then json结果中包含"'code':200,'message':'职位下线成功','success':true"

		When 步骤:职位删除
		When 设置cookie
		When 调用POST接口,url:"{url}/ihrapi/job/jobdelete?access_token={access_token}",param:"jobNumber={jobNumber}"
		Then json结果中包含"'code':200,'message':'职位删除成功','success':true"