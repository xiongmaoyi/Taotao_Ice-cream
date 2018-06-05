package cn.com.ttxg.mapper;

import cn.com.ttxg.pojo.Goods;
import cn.com.ttxg.pojo.GoodsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
	//按条件计数
    long countByExample(GoodsExample example);
    //按条件删除
    int deleteByExample(GoodsExample example);
    //	根据主键删除
    int deleteByPrimaryKey(Integer goodsid);
    // 	插入数据（返回值为ID）
    int insert(Goods record);
    
    int insertSelective(Goods record);
    //按条件查询
    List<Goods> selectByExample(GoodsExample example);
    //按主键查询
    Goods selectByPrimaryKey(Integer goodsid);
    // 按条件更新值不为null的字段
    int updateByExampleSelective(@Param("record") Goods record, @Param("example") GoodsExample example);
    //按条件更新
    int updateByExample(@Param("record") Goods record, @Param("example") GoodsExample example);
    //按主键更新值不为null的字段
    int updateByPrimaryKeySelective(Goods record);
    //按主键查询
    int updateByPrimaryKey(Goods record);
}