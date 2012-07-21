package com.euronextclone.ordertypes;

import com.euronextclone.Order;
import com.euronextclone.OrderType;
import com.euronextclone.OrderTypeLimit;

/**
 * Created with IntelliJ IDEA.
 * User: eprystupa
 * Date: 7/20/12
 * Time: 2:32 PM
 */
public class Limit extends OrderTypeLimit {

    private final double limit;

    public Limit(final double limit) {
        super(OrderType.Limit);
        this.limit = limit;
    }

    @Override
    public boolean providesLimit() {
        return true;
    }

    @Override
    public double getLimit() {
        return limit;
    }

    @Override
    public boolean canPegLimit() {
        return false;
    }

    @Override
    public Double price(Order.OrderSide side, Double bestLimit) {
        return limit;
    }
}
