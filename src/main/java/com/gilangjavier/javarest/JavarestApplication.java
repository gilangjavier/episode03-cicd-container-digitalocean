package com.gilangjavier.javarest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JavarestApplication {

	public static void main(String[] args) {
		SpringApplication.run(JavarestApplication.class, args);
	}
}

public class User {
    private String firstName;
    private String lastName;
    private String email;
    public User(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }
    // Generate toString method
}

@RestController
@RequestMapping("/user")
public class UserController {
    @GetMapping("/read/one")
    public String readUser(){
        User user = new User("John","doe","John@javadev.com");
        return user.toString();
    }
}