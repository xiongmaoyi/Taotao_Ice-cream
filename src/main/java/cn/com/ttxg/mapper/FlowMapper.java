package cn.com.ttxg.mapper;

import cn.com.ttxg.pojo.Flow;
import cn.com.ttxg.pojo.FlowExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlowMapper {
    long countByExample(FlowExample example);

    int deleteByExample(FlowExample example);

    int deleteByPrimaryKey(Integer flowid);

    int insert(Flow record);

    int insertSelective(Flow record);

    List<Flow> selectByExample(FlowExample example);

    Flow selectByPrimaryKey(Integer flowid);

    int updateByExampleSelective(@Param("record") Flow record, @Param("example") FlowExample example);

    int updateByExample(@Param("record") Flow record, @Param("example") FlowExample example);

    int updateByPrimaryKeySelective(Flow record);

    int updateByPrimaryKey(Flow record);
    int insertFlows(List<Flow> flowList);
}