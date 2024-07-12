package org.example.jstl_dog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/dog/*")
public class ServletDog extends HttpServlet {
    List<Dog> dogs = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        System.out.println("Serveur lancé");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = ((req.getPathInfo() == null || req.getPathInfo().isEmpty()) ? "" : req.getPathInfo());

        switch (pathInfo) {
            case "":
                req.setAttribute("dogs", dogs);
                req.getRequestDispatcher("/dogs.jsp").forward(req, resp);
                break;
            case "/add":
                req.getRequestDispatcher("/addDog.jsp").forward(req, resp);
                break;
            default:
                int searchedDog = Integer.parseInt(pathInfo.substring(1));
                Dog dog = dogs.get(searchedDog);
                System.out.println(req.getParameter("id"));
                req.setAttribute("dog", dog);
                req.getRequestDispatcher("/dog.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                String name = req.getParameter("name");
                String breed = req.getParameter("breed");
                LocalDate dob = LocalDate.parse(req.getParameter("dob"));

                System.out.println(name + " " + breed + " " + dob);

                dogs.add(new Dog(name, breed, dob));
                System.out.println("liste de chien" + dogs);

                req.setAttribute("dogs", dogs);
                req.getRequestDispatcher("/dogs.jsp").forward(req, resp);
    }
}
