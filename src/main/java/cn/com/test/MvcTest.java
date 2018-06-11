package cn.com.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.WarehouseCustom;

/**
 * 测试请求
 * @author Administrator
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:spring/applicationContext-*.xml","classpath:mybatis-config.xml","classpath:/spring/springmvc.xml"})
public class MvcTest {
	
	
/*	@Autowired
	WebApplicationContext webApplicationContext;
	
	private MockMvc mockMvc;*/
	
	@Before
	public void initMockMvc(){
		/*mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();*/
	}
	
	@Test
	public void testPage() throws Exception{
		//模拟请求拿到返回值
				/*MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("showAllWarehouse.action").param("pn", "1")).andReturn();
				
				MockHttpServletRequest request = result.getRequest();
				PageInfo<WarehouseCustom> pi = (PageInfo<WarehouseCustom>) request.getAttribute("page");
				System.out.println("当前页码"+pi.getPageNum());*/
		
		
	}
}
