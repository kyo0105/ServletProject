package domino.dto;

public class EmpDTO {
	
	private String emp_id;
	private String emp_pw;
	private String emp_name;
	
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_pw() {
		return emp_pw;
	}
	public void setEmp_pw(String emp_pw) {
		this.emp_pw = emp_pw;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	public boolean matchPassword(String pw) {
		return this.emp_pw != null && this.emp_pw.equals(pw);
	}
	
}
