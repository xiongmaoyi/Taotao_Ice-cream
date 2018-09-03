package com.g12;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.g12.ttxg.mapper")
@SpringBootApplication
public class TtxgApplication {

	public static void main(String[] args) {
		SpringApplication.run(TtxgApplication.class, args);
	}
}
