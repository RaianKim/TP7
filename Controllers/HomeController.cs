using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP7.Models;

namespace TP7.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

public IActionResult ConfigurarJuego()
{
    ViewBag.Categorias = BD.ObtenerCategorias();
    ViewBag.Dificultades = BD.ObtenerDificultades();
    Juego.InicializarJuego();
    return  View();
}

public IActionResult Comenzar(string username,int dificultad,int categoria)
{
 if(dificultad < -1 && dificultad == 0 && dificultad > 3 && categoria < -1 && categoria == 0 && categoria > 3)
 {
     return View("ConfigurarJuego");
 }
 else
 {
    
    Juego.CargarPartida(username,dificultad,categoria);  
    ViewBag.username = username;
    
    return RedirectToAction("Jugar");
 }
}

public IActionResult Jugar(){
    if (Juego.ObtenerProximaPregunta == null)
    {
    return View("Fin");
    }
    else
    {
    ViewBag.Preguntas = Juego.ObtenerProximaPregunta();
    ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Preguntas.idPregunta);
    return View("Juego");
    }
}

[HttpPost]
public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
    bool Vericado = Juego.VerificarRespuesta(idPregunta,idRespuesta);
    ViewBag.Vericado = Vericado;
 //   if(!Vericado){
//int correcto = ObtenerRespuestaCorrecta(idPregunta)}
//ViewBag.correcto = Correcto
//  }
return View("Respuestas");
}



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
