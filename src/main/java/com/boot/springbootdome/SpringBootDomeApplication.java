package com.boot.springbootdome;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration
@ComponentScan(basePackages = "com.boot.controller,com.boot.user.service")
@MapperScan(value = "com.boot.mapper")
public class SpringBootDomeApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootDomeApplication.class, args);
	}
}
