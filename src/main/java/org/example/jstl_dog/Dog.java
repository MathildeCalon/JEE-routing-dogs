package org.example.jstl_dog;

import java.time.LocalDate;

public class Dog {
    private int id = 0;
    private String name;
    private String breed;
    private LocalDate dateOfBirth;

    public Dog(String name, String breed, LocalDate birthDate) {
        id+=1;
        this.name = name;
        this.breed = breed;
        this.dateOfBirth = birthDate;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getBreed() {
        return breed;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }
}
