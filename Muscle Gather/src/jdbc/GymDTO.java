package jdbc;

public class GymDTO {
	private String gym_no;
	private String user_no;
	private String gym_name;
	private String gym_content;
	private String gym_addr;
	private String gym_salary;
	private String gym_secret;		// false : 비공개, true : 공개
	private String gym_regdate;
	private String gym_images;
	
	public void setGym_no(String gym_no) {
		this.gym_no = gym_no;
	}
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public void setGym_name(String gym_name) {
		this.gym_name = gym_name;
	}
	public void setGym_content(String gym_content) {
		this.gym_content = gym_content;
	}
	public void setGym_addr(String gym_addr) {
		this.gym_addr = gym_addr;
	}
	public void setGym_salary(String gym_salary) {
		this.gym_salary = gym_salary;
	}
	public void setGym_secret(String gym_secret) {
		this.gym_secret = gym_secret;
	}
	public void setGym_regdate(String gym_regdate) {
		this.gym_regdate = gym_regdate;
	}
	public void setGym_images(String gym_images) {
		this.gym_images = gym_images;
	}
	public String getGym_no() {
		return gym_no;
	}
	public String getUser_no() {
		return user_no;
	}
	public String getGym_name() {
		return gym_name;
	}
	public String getGym_content() {
		return gym_content;
	}
	public String getGym_addr() {
		return gym_addr;
	}
	public String getGym_salary() {
		return gym_salary;
	}
	public String getGym_secret() {
		return gym_secret;
	}
	public String getGym_regdate() {
		return gym_regdate;
	}
	public String getGym_images() {
		return gym_images;
	}
	
	public GymDTO(String gym_no, String user_no, String gym_name, String gym_content, String gym_addr, String gym_salary,
			String gym_secret, String gym_regdate, String gym_images) {
		this.gym_no = gym_no;
		this.user_no = user_no;
		this.gym_name = gym_name;
		this.gym_content = gym_content;
		this.gym_addr = gym_addr;
		this.gym_salary = gym_salary;
		this.gym_secret = gym_secret;
		this.gym_regdate = gym_regdate;
		this.gym_images = gym_images;
	}	
	
	

}
