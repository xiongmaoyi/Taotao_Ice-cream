package cn.com.g12.model;

public class CashReturn extends CashSuper {
	private double moneyCondition = 300.0;
	private double moneyReturn = 100.0;

	public CashReturn(String moneyCondition, String moneyReturn) {
		this.moneyCondition = Double.parseDouble(moneyCondition);
		this.moneyReturn = Double.parseDouble(moneyReturn);
	}

	@Override
	public double acceptCash(double money) {
		double result = money;
		// 若大于返利条件，则需要减去返利值
		if (money >= moneyCondition) {
			result = money - Math.floor(money / moneyCondition) * moneyReturn;
		}
		return result;
	}

}
