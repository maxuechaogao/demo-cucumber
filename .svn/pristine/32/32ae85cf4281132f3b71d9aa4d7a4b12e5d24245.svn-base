@qa_mobile_passportSendmobilecode_detail
Feature: 发送手机验证码

  Scenario: init
    When 保存一个变量key="{url}",value="http://api-qa.zhaopin.com"
    When 保存一个变量key="{path}",value="/passport/sendmobilecode"
    When 生产一个随机phoneNumber,以"{phone_number}"命名保存
    When 保存一个变量key="{pwd}",value="qwe123"
    When 保存一个变量key="{pwd_new}",value="qwe456"
    When 保存一个变量key="{type40}",value="40"
    When 保存一个变量key="{type50}",value="50"
    When 生产一个随机phoneNumber,以"{phone_number_a}"命名保存
    When 设置fromsystem为"23"
    When 设置deviceid为"qwertyu"

  Scenario Outline: <comment>
    When 等待1"秒"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"<comment>",url:"{url}{path}?r={r}&key={md5key}&mobile=<mobile>&type=<type>"
    Then json结果中包含"'code':<code>,'message':'<message>','success':<success>"

    Examples:
      | comment     | mobile         | type | code | message                  | success | taskId |
      | 成功获取验证码     | {phone_number} | 50   | 200   | 操作成功                     | true    |        |
      | 60秒内        | {phone_number} | 50   | 606  | 短信验证码60秒内只能获取1次,请稍后再重新获取 | false   |        |
      | mobile为空    |                | 40   | 400        | 参数错误                     | false   |        |
      | mobile为null | null           | 40   | 400       | 参数错误                     | false   |        |
      | type为空      | {phone_number} |      | 400        | 参数错误                     | false   |        |
      | type为null   | {phone_number} | null | 400        | 参数错误                     | false   |        |
      | type为qwe    | {phone_number} | qwe  | 400        | 参数错误                     | false   |        |
      | type为@#$    | {phone_number} | @#$  | 400        | 参数错误                     | false   |        |
      | type为汉字     | {phone_number} | 汉字   | 400        | 参数错误                     | false   |        |

      | 10位手机号40    | 1882222112     | 40   | 400   | 参数错误                     | false   |        |
      | 10位手机号50    | 1882222112     | 50   | 400   | 参数错误                     | false   |        |
      | 12位手机号40    | 188222211121   | 40   | 400   | 参数错误                     | false   |        |
      | 12位手机号50    | 188222211121   | 50   | 400    | 参数错误                     | false   |        |
      | 含字母40       | 188222211qw    | 40   | 400   | 参数错误                     | false   |        |
      | 含字母50       | 188222211qw    | 50   | 400   | 参数错误                     | false   |        |
      | 含汉字40       | 1882222汉字      | 40   | 400   | 参数错误                     | false   |        |
      | 含汉字50       | 1882222汉字      | 50   | 400   | 参数错误                     | false   |        |
      | type为39     | {phone_number} | 39   | 400   | 参数错误                     | false   |        |

  Scenario Outline: <comment>
    When 等待1"秒"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"<comment>",url:"{url}{path}?r={r}&key={md5key}&mobile=<mobile>&type=<type>"
    Then json结果中包含"'code':<code>,'message':'<message>','success':<success>"

    Examples:
      | comment | mobile     | type | code | message | success |
      | 含特殊字符40 | 18822223#% | 40   | 550  | 未知异常    | false   |
      | 含特殊字符50 | 18822223#% | 50   | 550  | 未知异常    | false   |

  Scenario: 1小时不超过3次type=40/50
    When 等待1"分钟"
    When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number_a}&type=40"
    When 等待1"分钟"
    When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number_a}&type=40"
    When 等待1"分钟"
    When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number_a}&type=40"
    When 等待1"分钟"
    When 生产一个当前时间戳,以"{r}"命名保存
    When 生成一个md5key,以"{md5key}"命名保存
    When 调用GET接口,testContent:"发送验证码",url:"{url}{path}?r={r}&key={md5key}&mobile={phone_number_a}&type=50"
    Then json结果中包含"'code':614,'data':null,'message':'一个小时内生成验证码不能超过3次','success':false"
    Then json结果中共有5个字段

