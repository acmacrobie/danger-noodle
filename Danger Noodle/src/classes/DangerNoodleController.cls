public with sharing class DangerNoodleController {
	public List<Score__c> scores {get; set;}

	public Integer scoreValue {get; set;}
	public String scoreName {get; set;}

	public DangerNoodleController() {
		init();
	}

	public void init() {
		scores = [select Score_Value__c, Score_Name__c from Score__c order by Score_Value__c desc];
	}

	public void saveScore() {
		Score__c newScore = new Score__c();
		newScore.Score_Value__c = scoreValue;
		newScore.Score_Name__c = scoreName;

		insert newScore;

		init();
	}
}