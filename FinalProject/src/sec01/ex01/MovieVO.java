package sec01.ex01;

import java.sql.Date;

public class MovieVO {
	private String movie_num;
	private String movie_name;
	private String movie_content;
	private String member_id;
	
	public MovieVO() {
		System.out.println("MovieVO  생성자 호출");
	}

	public MovieVO(String movie_num, String movie_name, String movie_content, String member_id) {
		this.movie_num = movie_num;
		this.movie_name = movie_name;
		this.movie_content = movie_content;
		this.member_id = member_id;
	}
	
	public String getMovie_num() {
		return movie_num;
	}

	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
}
