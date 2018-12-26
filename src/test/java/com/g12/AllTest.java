

package com.g12;


import com.g12.ttxg.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

/**
 * 〈一句话功能简述〉<br> 
 * 〈test〉
 *
 * @author Administrator
 * @create 2018-08-21
 * @since 1.0.0
 */

@RunWith(SpringRunner.class)
@SpringBootTest
public class AllTest {


    @Autowired
    UserMapper userMapper;



    @Test
    public void getText() throws Exception {
       System.out.println(userMapper.selectByExample(null));
        Scheduler scheduler1 = Schedulers.immediate();
        Scheduler scheduler2 = Schedulers.single();
        Scheduler scheduler3 = Schedulers.newSingle("xxx");
        //默认60秒不被使用就会回收
        Scheduler elaSc = Schedulers.newElastic("elaSc",60);
        //5个线程
        Scheduler sendHttpSc = Schedulers.newParallel("sendHttpSc",5);


    }




}
