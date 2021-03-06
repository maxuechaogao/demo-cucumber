package run;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import fun.OperateFileUtils;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


//,"@qa_mobile_baseData","@qa_mobile_aboutLogin","@qa_mobile_sendCode"
@RunWith(Cucumber.class)
@CucumberOptions(format = {"pretty", "json:report/report.json"},
		tags = {"@test"},
		features = { "src/test/resources/qa/test" }
)
public class QA_mobile_Test {

	@BeforeClass
	public static void start(){
		OperateFileUtils.deleteFile("error.log");
	}

}
