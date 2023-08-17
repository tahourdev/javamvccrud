package com.tahourdev.mvccrud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.tahourdev.mvccrud")
public class MvccrudApplication {

	public static void main(String[] args) {
		SpringApplication.run(MvccrudApplication.class, args);
	}

}
