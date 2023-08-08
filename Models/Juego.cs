using System;
using System.ComponentModel.DataAnnotations;
namespace TP7.Models;

public static class Juego
{
    string _username
    int _puntajeActual
    int _cantidadPreguntasCorrectas
    List<Preguntas> _preguntas
    List<Respuestas> _respuestas

    static void InicializarJuego()
    {
        _username ="";
        _puntajeActual = 0;
        _cantidadPreguntasCorrectas = 0;
        _preguntas(new Preguntas{});
        _respuestas(new Respuestas{});
    }
    static List<Categorias> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }
    static List<Dificultades> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    static void CargarPartida(string username, int dificultad, int categoria)
    {
        _username = username;
        _preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        _respuestas = BD.ObtenerRespuestas(_preguntas);
    }
    static Preguntas ObtenerProximaPregunta()
    {
        bool aux = True;
        List<int> aux = new List<int>();
        Random rnd = new Random();
        while (aux != false)
        {
        int randomNumber = rnd.Next(0, _preguntas.Count());
            if(_preguntas.Contains(randomNumber))
            {
                aux = true;
            }
            else
            {
                aux = false;
            }
        }
        return _preguntas[aux]; 
    }

    static List<Respuestas> ObtenerProximasRespuestas(int idPregunta)
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

    static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool aux;

    }
}