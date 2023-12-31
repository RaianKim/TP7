using System;
using System.ComponentModel.DataAnnotations;
namespace TP7.Models;

public static class Juego
{
    public static string _username;
    private static int _puntajeActual;
    private static int _cantidadPreguntasCorrectas;
    private static List<Preguntas> _preguntas = new List<Preguntas>();
    private static List<Respuestas> _respuestas = new List<Respuestas>();
    private static Random _random = new Random();
    public static int _puntajeFinal;
    public static void InicializarJuego()
    {
        _username ="";
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
        _preguntas.Add(new Preguntas{});
        _respuestas.Add(new Respuestas{});
    }
    public static List<Categorias> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    public static List<Dificultades> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        _username = username;
        _preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
    }
   
   
   public static Preguntas ObtenerProximaPregunta()
{
    
    if (_preguntas.Count == 0)
    {
        return null; 
    }
    
    int randomNumber = _random.Next(0, _preguntas.Count);
    Preguntas pregunta = _preguntas[randomNumber];
    return pregunta;
}

public static List<Respuestas> ObtenerProximasRespuestas(int idPregunta)
{
    List<Respuestas> respuestas = new List<Respuestas>();
    foreach (Respuestas resp in _respuestas)
    {
        if (resp.IdPregunta == idPregunta)
        {
            respuestas.Add(resp);
        }
    }
    return respuestas;
}

    
    public static Respuestas VerificarRespuesta(int idPregunta, int idRespuesta)
    {

       Respuestas respuesta = new Respuestas();
        for (int i = 0; i < _respuestas.Count();i++)
        {
            if(_respuestas[i].IdRespuesta == idRespuesta && _respuestas[i].IdPregunta ==  idPregunta)
            {
                respuesta = _respuestas[i];
                break;
            }
        }
        for (int i = 0; i < _preguntas.Count(); i++)
        {
            if(_preguntas[i].IdPregunta == idPregunta)
            {
                _preguntas.RemoveAt(i);
            }
        }
        if(respuesta.Correcta)
        {
            _cantidadPreguntasCorrectas++;
            _puntajeActual += 150;
            _puntajeFinal = _puntajeActual;
            return respuesta;
        }
        else
        {
            return respuesta;
        }
        
    }
}
