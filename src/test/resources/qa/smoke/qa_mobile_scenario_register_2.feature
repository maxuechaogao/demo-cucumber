@qa_mobile_scenario_register_2
Feature: 情景：注册用户-》注册公司-》登录-》注册公司

  Scenario: init
    When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
    When 保存一个变量key="{path}",value="/passport/register"
    When 保存一个变量key="{pwd}",value="qwe123"
    When 设置fromsystem为"23"
    When 设置deviceid为"qwertyu"


  Scenario: 注册用户
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生产一个随机phoneNumber,以"{phone_number}"命名保存
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
    When 把"data,accessToken"以"{access_token}"命名保存
    When 把"data,refreshToken"以"{refresh_Token}"命名保存

  Scenario: 注册公司信息第二步
    # 公司名称不能重复
    When 等待1"秒"
    When 设置at为"{access_token}"
    When 设置rt为"{refresh_Token}"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/registercompany"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"注册公司信息第二步",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'这是大于4位测试1{r}','cityId':530,'staffName':'联系人1','nickName':'这是6位昵称1','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
    Then json结果中包含"'code':200,'accessToken':'{access_token}','refreshToken':'{refresh_Token}','companyRegistered':true,'needCheckcode':false,'message':'操作成功','success':true"

  Scenario: 登录
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/login"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"登录",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{phone_number}','pwd':'{pwd}','checkId':'','checkCode':''}"
    When 把"data,accessToken"以"{access_token}"命名保存
    When 把"data,refreshToken"以"{refresh_Token}"命名保存
    Then json结果中包含"'code':200,'message':null,'success':true,'needCheckcode':false,'companyRegistered':true,'userStatus':10,'userType':153,'name':'{phone_number}'"

  Scenario: 注册公司信息第二步
    # 公司名称不能重复
    When 等待1"秒"
    When 设置at为"{access_token}"
    When 设置rt为"{refresh_Token}"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/registercompany"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"注册公司信息第二步",url:"{url}{path}?r={r}&key={md5key}",param:"{'companyName':'这是大于4位测试1{r}','cityId':530,'staffName':'联系人1','nickName':'这是6位昵称1','sex':1,'phone':'','userName':'{phone_number}','email':'3221112@qq.com'}"
    Then json结果中包含"'code':617,'message':'该用户已注册，请直接登录','success':false"


