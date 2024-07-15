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
                Dog newDog = getParameters(req, resp);

                dogRepository.create(newDog);

                sendDogList(req, resp);
                break;

            case "/delete":
                int searchedDog = Integer.parseInt(req.getParameter("id"));
                dogRepository.delete(searchedDog);

                sendDogList(req, resp);
                break;
            case "/update":
                Dog updatedDog = getParameters(req, resp);
                System.out.println("updated dog : " + updatedDog);
                dogRepository.update(updatedDog);

                sendDogList(req, resp);
                break;
        }
    }

    public void sendDogList(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<Dog> dogs = dogRepository.findAll();
        req.setAttribute("dogs", dogs);
        req.getRequestDispatcher("/dogs.jsp").forward(req, resp);
    }

    public Dog getParameters(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        LocalDate dob = LocalDate.parse(req.getParameter("dob"));

        Dog dog = new Dog(id, name, breed, dob);
        System.out.println("paremeters: "+  dog);

        return dog;
    }
};
