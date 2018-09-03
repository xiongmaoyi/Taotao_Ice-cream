package com.g12.ttxg.mapper;

import com.g12.ttxg.pojo.InStorehouse;
import com.g12.ttxg.pojo.InStorehouseCustom;
import com.g12.ttxg.pojo.InStorehouseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InStorehouseMapper {
    int countByExample(InStorehouseExample example);

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


    /**/
    List<InStorehouseCustom> selectWithGoodsAndBrandByExample(InStorehouseExample example);
}