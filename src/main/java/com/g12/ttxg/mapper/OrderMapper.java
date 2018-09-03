package com.g12.ttxg.mapper;

import com.g12.ttxg.pojo.Order;
import com.g12.ttxg.pojo.OrderCustom;
import com.g12.ttxg.pojo.OrderExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    int countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(Integer orderid);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer orderid);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);


    /**/
    List<OrderCustom> selectCompleteOrder(OrderExample example);
    List<OrderCustom> selectSimpleOrder(OrderExample example );
    int selectMaxOrderId();
    List<Map<String, Object>> selectStatistics(OrderExample example);
    List<Map<String, Object>> selectStatisticsWithMonths(OrderExample example);
    List<Map<String, Object>> selectChartBar();

}