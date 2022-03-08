package org.vision.rentcar.model;

public class RentVisitor {
	private int visit_id;
    private String visit_ip;
    private int visit_time;
    private String visit_site;
    private String visit_agent;
    
    
	public int getVisit_id() {
		return visit_id;
	}
	public void setVisit_id(int visit_id) {
		this.visit_id = visit_id;
	}
	public String getVisit_ip() {
		return visit_ip;
	}
	public void setVisit_ip(String string) {
		this.visit_ip = string;
	}
	public int getVisit_time() {
		return visit_time;
	}
	public void setVisit_time(int visit_time) {
		this.visit_time = visit_time;
	}
	public String getVisit_site() {
		return visit_site;
	}
	public void setVisit_site(String string) {
		this.visit_site = string;
	}
	public String getVisit_agent() {
		return visit_agent;
	}
	public void setVisit_agent(String string) {
		this.visit_agent = string;
	}
	@Override
	public String toString() {
		return "Rentvisitor [visit_id=" + visit_id + ", visit_ip=" + visit_ip + ", visit_time=" + visit_time
				+ ", visit_site=" + visit_site + ", visit_agent=" + visit_agent + "]";
	}
	
	
    
}
