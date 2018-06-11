package cn.com.ttxg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.ttxg.pojo.Warehouse;
import cn.com.ttxg.pojo.WarehouseCustom;
import cn.com.ttxg.pojo.WarehouseExample;

public interface WarehouseMapper {
    long countByExample(WarehouseExample example);

    int deleteByExample(WarehouseExample example);

    int deleteByPrimaryKey(Integer warehousegoodsid);

    int insert(Warehouse record);

    int insertSelective(Warehouse record);

    List<Warehouse> selectByExample(WarehouseExample example);

    Warehouse selectByPrimaryKey(Integer warehousegoodsid);

    int updateByExampleSelective(@Param("record") Warehouse record, @Param("example") WarehouseExample example);

    int updateByExample(@Param("record") Warehouse record, @Param("example") WarehouseExample example);

    int updateByPrimaryKeySelective(Warehouse record);

    int updateByPrimaryKey(Warehouse record);
    
   /* -----------------*/
    List<WarehouseCustom> selectByExampleWithGoodsAndBrand(WarehouseExample example);
   
    
    
}