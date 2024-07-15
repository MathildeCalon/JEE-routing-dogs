package org.example.jstl_dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.jstl_dog.entity.Dog;
import org.example.jstl_dog.repository.DogRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/dog/*")
public class ServletDog extends HttpServlet {
    DogRepository dogRepository;

    @Override
    public void init() throws ServletException {
        System.out.println("Serveur lancé");
        dogRepository = new DogRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = ((req.getPathInfo() == null || req.getPathInfo().isEmpty()) ? "" : req.getPathInfo());

        switch (pathInfo) {
            case "":
                sendDogList(req, resp);
                break;
            case "/add":
                req.getRequestDispatcher("/addDog.jsp").forward(req, resp);
                break;
            case "/detail":
                int searchedDog = Integer.parseInt(req.getParameter("id"));
                Dog dog = dogRepository.findById(searchedDog);
                req.setAttribute("dog", dog);
                req.getRequestDispatcher("/dog.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = ((req.getPathInfo() == null || req.getPathInfo().isEmpty()) ? "" : req.getPathInfo());
        switch (pathInfo) {
            case "":
            String name = req.getParameter("name");
            String breed = req.getParameter("breed");
            LocalDate dob = LocalDate.parse(req.getParameter("dob"));

            System.out.println(name + " " + breed + " " + dob);

            dogRepository.create(Dog.builder()
                    .name(name)
                    .breed(breed)
                    .dateOfBirth(dob)
                    .build());

                sendDogList(req, resp);
            break;

            case "/delete":
                int searchedDog = Integer.parseInt(req.getParameter("id"));
                dogRepository.delete(searchedDog);

                sendDogList(req, resp);
        }
    }

    public void sendDogList(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<Dog> dogs = dogRepository.findAll();
        req.setAttribute("dogs", dogs);
        req.getRequestDispatcher("/dogs.jsp").forward(req, resp);
    }
}
