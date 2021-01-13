package thaidq.dto;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author thaid
 */
public class AccountDTO {
    private String Id;
    private String Username;
    private String Password;
    private String Role;
    private String Fullname;

    public AccountDTO() {
    }

    public AccountDTO(String Id, String Username, String Password, String Role, String Fullname) {
        this.Id = Id;
        this.Username = Username;
        this.Password = Password;
        this.Role = Role;
        this.Fullname = Fullname;
    }

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }
    

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    
    
    
}
