package domino.dto;

public class FaqDTO {

	private int faq_code;		
	private String faq_category;			
	private String question;
	private String answer;
	private String emp_id;
	

	public int getFaq_code() {
		return faq_code;
	}

	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}

	public String getFaq_category() {
		return faq_category;
	}

	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	@Override
	public String toString() {
		return "FaqDTO [faq_code=" + faq_code + ", faq_category=" + faq_category + ", question=" + question
				+ ", emp_id=" + emp_id + "]";
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}			
	
	
	
	
}
