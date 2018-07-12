package run;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import fun.OperateFileUtils;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


@RunWith(Cucumber.class)
@CucumberOptions(format = {"pretty", "json:report/report.json"},
		tags = {"@qa_mobile_scenario_register_2"},
//		tags = {"~@qa_mobile_scenario_sendCode_overdue"},
		features = { "src/test/resources/qa/smoke" }
) 
public class QA_Mobile_Detail_scenario {

	@BeforeClass
	public static void start(){
		OperateFileUtils.deleteFile("error.log");
	}

}
