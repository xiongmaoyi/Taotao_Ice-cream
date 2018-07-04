package cn.com.ttxg.pojo;

import java.util.List;

public class OrderCustom extends Order{
	
	private User user;
	private User deliver;
	private User customer;
	private List<FlowCustom> flows;

	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getDeliver() {
		return deliver;
	}
	public void setDeliver(User deliver) {
		this.deliver = deliver;
	}
	public List<FlowCustom> getFlows() {
		return flows;
	}
	public void setFlows(List<FlowCustom> flows) {
		this.flows = flows;
	}
	public User getCustomer() {
		return customer;
	}
	public void setCustomer(User customer) {
		this.customer = customer;
	}
	
	
	
}