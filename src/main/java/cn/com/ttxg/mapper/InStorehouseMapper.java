package cn.com.ttxg.mapper;

import cn.com.ttxg.pojo.InStorehouse;
import cn.com.ttxg.pojo.InStorehouseCustom;
import cn.com.ttxg.pojo.InStorehouseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InStorehouseMapper {
    long countByExample(InStorehouseExample example);

    int deleteByExample(InStorehouseExample example);

    int deleteByPrimaryKey(Integer messageid);

    int insert(InStorehouse record);

    int insertSelective(InStorehouse record);

    List<InStorehouse> selectByExample(InStorehouseExample example);

    InStorehouse selectByPrimaryKey(Integer messageid);

    int updateByExampleSelective(@Param("record") InStorehouse record, @Param("example") InStorehouseExample example);

    int updateByExample(@Param("record") InStorehouse record, @Param("example") InStorehouseExample example);

    int updateByPrimaryKeySelective(InStorehouse record);

    int updateByPrimaryKey(InStorehouse record);
    
    
    List<InStorehouseCustom> selectWithGoodsAndBrandByExample(InStorehouseExample example);
    
    
}