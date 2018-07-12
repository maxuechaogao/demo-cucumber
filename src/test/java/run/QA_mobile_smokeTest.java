package run;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import fun.OperateFileUtils;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;


//,"@qa_mobile_baseData","@qa_mobile_aboutLogin","@qa_mobile_sendCode"
@RunWith(Cucumber.class)
@CucumberOptions(format = {"pretty", "json:report/report.json"},
		tags = {"~@qa_mobile_scenario_register_2"},
//		tags = {"@qa_mobile_job_smoke"},
		features = { "src/test/resources/qa/smoke" }
)
public class QA_mobile_smokeTest {

	@BeforeClass
	public static void start(){
		OperateFileUtils.deleteFile("error.log");
	}

}
