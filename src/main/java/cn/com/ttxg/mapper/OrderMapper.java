package cn.com.ttxg.mapper;

import cn.com.ttxg.pojo.Order;
import cn.com.ttxg.pojo.OrderCustom;
import cn.com.ttxg.pojo.OrderExample;
import net.sf.ehcache.search.impl.OrderComparator;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMapper {
    long countByExample(OrderExample example);

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
    
    List<OrderCustom> selectCompleteOrder(OrderExample example);
    List<OrderCustom> selectSimpleOrder(OrderExample example );
}