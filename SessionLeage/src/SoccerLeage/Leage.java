package SoccerLeage;

public class Leage {
       private String name;
       private String title;
       private int year;
	public Leage(String name, String title, int year) {
		super();
		this.name = name;
		this.title = title;
		this.year = year;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
       
}
