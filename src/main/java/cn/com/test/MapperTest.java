package cn.com.test;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.com.ttxg.mapper.BrandMapper;
import cn.com.ttxg.mapper.GoodsMapper;
import cn.com.ttxg.mapper.InStorehouseMapper;
import cn.com.ttxg.mapper.WarehouseMapper;
import cn.com.ttxg.pojo.Goods;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/applicationContext-*.xml"})
public class MapperTest {
	
/**
 * 测试dao层工作
 * 单元测试 
 */
	@Autowired
	WarehouseMapper warehouseMapper;
	
	@Autowired
	InStorehouseMapper InStorehouseMapper;
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	BrandMapper brandMapper;
	
	@Test
	public void testWhcMapper(){

		/*System.out.println("------11-------"+warehouseMapper);
		Warehouse warehouse = new Warehouse();
		warehouse.setGoodsid(1);
		warehouse.setGoodscount("50");
		warehouseMapper.insertSelective(warehouse);*/
		
		/*WarehouseMapper warehouseMapper2 = sqlSession.getMapper(WarehouseMapper.class);
		for (int i = 0; i < 10; i++) {
			Warehouse warehouse = new Warehouse();
			warehouse.setGoodsid(1);
			warehouse.setGoodscount("50");
			warehouseMapper.insertSelective(warehouse);
			warehouseMapper2.insert(warehouse);
		}*/
		
		//批量插入多个，可以使用批量操作的sqlSession
		/*WarehouseExample example = new WarehouseExample();
		example.createCriteria().andGoodsnameEqualTo("%1%");
		System.out.println("qqqqqqqqqqqqq"+warehouseMapper.selectByExampleWithGoodsAndBrand(example)+"qqqqqqqqqqqqq");*/
		System.out.println("qqqqq"+brandMapper.selectByExample(null));
	
		
	}

}