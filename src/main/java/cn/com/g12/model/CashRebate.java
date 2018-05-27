package cn.com.g12.model;

public class CashRebate extends CashSuper {
	private double moneyRebate = 0.8;

	public CashRebate(String moneyRebate) {
		this.moneyRebate = Double.parseDouble(moneyRebate);
	}

	@Override
	public double acceptCash(double money) {
		// TODO Auto-generated method stub
		money = money * moneyRebate;
		return money;
	}

}
