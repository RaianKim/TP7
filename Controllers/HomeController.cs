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
 Juego.CargarPartida(username,dificultad,categoria);   
 if(_preguntas.Count > 0){
    return view(CargarPartida)
 }else
 {return view(ConfigurarJuego)}
}

public IActionResult Jugar(){

}

[HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
    bool Vericado = VerificarRespuesta(idPregunta,idRespuesta);
    ViewBag.Vericado = Vericado;
    if(!Vericado){
//int correcto = ObtenerRespuestaCorrecta(idPregunta)}
//ViewBag.correcto = Correcto
    }
}



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
