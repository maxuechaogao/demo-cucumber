package run;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import fun.OperateFileUtils;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;


@RunWith(Cucumber.class)
@CucumberOptions(format = {"pretty", "json:report/report.json"},
		tags = {"~@qa_mobile_scenario_sendCode_overdue"},
		features = { "src/test/resources/qa/detail" }
) 
public class QA_Mobile_Detail {

	@BeforeClass
	public static void start(){
		OperateFileUtils.deleteFile("error.log");
	}

}
