namespace TP7.Models;

public static class Juego
{
    string _username
    int _puntajeActual
    int _cantidadPreguntasCorrectas
    List<Pregunta> _preguntas
    List<Respuesta> _respuestas

    static void InicializarJuego()
    {
        username ="";
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
        preguntas(new Preguntas{});
        respuestas(new Respuestas{});
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
        List<int> aux = new List<int>();
        Random rnd = new Random();
        Console.WriteLine(rnd.Next(10, 20))
    }
}