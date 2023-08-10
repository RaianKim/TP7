using System;
using System.ComponentModel.DataAnnotations;
namespace TP7.Models;

public static class Juego
{
    private static string _username;
    private static int _puntajeActual;
    private static int _cantidadPreguntasCorrectas;
    public static List<Preguntas> _preguntas = new List<Preguntas>();
    public static List<Respuestas> _respuestas = new List<Respuestas>();

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
    public static List<Preguntas> preguntasRandom = new List<Preguntas>();
    public static Preguntas ObtenerProximaPregunta()
    {
        Random rnd = new Random();
        int randomNumber = rnd.Next(0, _preguntas.Count());
        return _preguntas[randomNumber]; 
    }

    public static List<Respuestas> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuestas> respuestas = new List<Respuestas>();
        for (int i = 0; i < _respuestas.Count(); i++)
        {
            if(_preguntas[i].IdPregunta == idPregunta)
            {
                respuestas.Add(_respuestas[i]);
            }
        }
        return respuestas;
    }

    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        Preguntas pregunta;
        Respuestas respuesta = new Respuestas();
        for (int i = 0; i < _preguntas.Count(); i++)
        {
            if(_respuestas[i].IdRespuesta == idRespuesta)
            {
                respuesta = _respuestas[i];
                break;
            }
        }
        for (int i = 0; i < _preguntas.Count() ; i++)
        {
            if(_respuestas[i].IdPregunta == idPregunta)
            {
                _preguntas.RemoveAt(i);
                break;
            }
        }
        if(respuesta.Correcta)
        {
            _cantidadPreguntasCorrectas++;
            _puntajeActual += 184;
            return true;
        }
        return false;
    }
}