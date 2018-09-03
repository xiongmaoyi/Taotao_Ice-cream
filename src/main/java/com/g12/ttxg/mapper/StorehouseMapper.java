package com.g12.ttxg.mapper;

import com.g12.ttxg.pojo.Storehouse;
import com.g12.ttxg.pojo.StorehouseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StorehouseMapper {
    int countByExample(StorehouseExample example);

    int deleteByExample(StorehouseExample example);

    int deleteByPrimaryKey(Integer storehouseid);

    int insert(Storehouse record);

    int insertSelective(Storehouse record);

    List<Storehouse> selectByExample(StorehouseExample example);

    Storehouse selectByPrimaryKey(Integer storehouseid);

    int updateByExampleSelective(@Param("record") Storehouse record, @Param("example") StorehouseExample example);

    int updateByExample(@Param("record") Storehouse record, @Param("example") StorehouseExample example);

    int updateByPrimaryKeySelective(Storehouse record);

    int updateByPrimaryKey(Storehouse record);
}