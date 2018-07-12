@qa_mobile_passportLogin_detail
Feature: 登录/登录_by_token

  Scenario: init
    When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
    When 保存一个变量key="{path}",value="/passport/login"
    When 保存一个变量key="{phone_number}",value="18956509411"
    When 保存一个变量key="{pwd}",value="qwe123"
    When 保存一个变量key="{access_token}",value="3eccf0196e1f43b99f6622c0fc084f21"
    When 保存一个变量key="{refresh_Token}",value="2fbba51074884a5589ec9b78abf4bda8"
    When 设置fromsystem为"23"
    When 设置deviceid为"qwertyu"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存

  Scenario: 登录异常
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"密码错误",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{phone_number}','pwd':'1234','checkId':'','checkCode':''}"
    Then json结果中包含"'code':22003,'message':'用户名或密码错误','success':false"

  Scenario: 登录异常
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"用户名错误",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'174332213','pwd':'1234','checkId':'','checkCode':''}"
    Then json结果中包含"'code':22003,'message':'用户名或密码错误','success':false"

  Scenario: 登录异常
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"密码为空",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'174332213','pwd':'','checkId':'','checkCode':''}"
    Then json结果中包含"'code':400,'message':'参数错误','success':false"

  Scenario: 登录异常
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"密码为null",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'174332213','pwd':null,'checkId':'','checkCode':''}"
    Then json结果中包含"'code':400,'message':'参数错误','success':false"

  Scenario: 登录异常
    When 等待1"秒"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"登录",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{phone_number}','pwd':'{pwd}','checkId':'','checkCode':''}"
    When 等待1"秒"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"登录",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'{phone_number}','pwd':'{pwd}','checkId':'','checkCode':''}"
    When 等待1"秒"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用POST_Json接口,testContent:"需要输入验证码",url:"{url}{path}?r={r}&key={md5key}",param:"{'loginName':'174332213','pwd':'1234','checkId':'','checkCode':''}"
    Then json结果中包含"'code':22004,'message':'需要输入验证码','success':false"

  Scenario: 登录_by_token异常
    When 等待1"秒"
    When 设置at为"12345123"
    When 设置rt为"{refresh_Token}"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/tokeninfo"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"错误at",url:"{url}{path}?r={r}&key={md5key}"
    Then json结果中包含"'code':404,'message':'未找到数据','success':false"

  Scenario: 登录_by_token异常
    When 等待1"秒"
    When 设置at为"null"
    When 设置rt为"{refresh_Token}"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/tokeninfo"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"at为null",url:"{url}{path}?r={r}&key={md5key}"
    Then json结果中包含"'code':404,'message':'未找到数据','success':false"

  Scenario: 登录_by_token异常
    When 等待1"秒"
    When 设置at为""
    When 设置rt为"{refresh_Token}"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/tokeninfo"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"at为空",url:"{url}{path}?r={r}&key={md5key}"
    Then json结果中包含"'code':404,'message':'未找到数据','success':false"

  Scenario: 登录_by_token异常
    When 等待1"秒"
    When 设置at为"{access_token}"
    When 设置rt为"1234"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/tokeninfo"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"错误rt",url:"{url}{path}?r={r}&key={md5key}"
    Then json结果中包含"'code':404,'message':'未找到数据','success':false"

  Scenario: 登录_by_token异常、
    When 等待1"秒"
    When 设置at为"{access_token}"
    When 设置rt为"null"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 保存一个变量key="{path}",value="/passport/tokeninfo"
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"rt为null",url:"{url}{path}?r={r}&key={md5key}"
    Then json结果中包含"'code':404,'message':'未找到数据','success':false"


