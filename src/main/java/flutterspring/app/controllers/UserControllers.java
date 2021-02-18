package flutterspring.app.controllers;

import flutterspring.app.entity.User;
import flutterspring.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserControllers {

    @Autowired
    private UserService service;

    @PostMapping("/addUser")
    public User addUser(@RequestBody User user){
        return service.SaveUser(user);
    }
    @GetMapping("/users")
    public List<User> findAllUsers(){
        return service.getUsers();
    }
    @DeleteMapping("/deleteUser")
    public String deleteUser(@PathVariable int id){
        return service.deleteUser(id);
    }
    @PutMapping
    public User updateUser(@RequestBody User user){
        return service.updateUser(user);
    }

}
