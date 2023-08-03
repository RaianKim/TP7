using System.Collections.Generic;
using System;
using System.Data.SqlClient;
using Dapper;
namespace TP7.Models;
public static class BD
{
    private static string ConnectionString = @"Server=localhost; DataBase=Elecciones2023; Trusted_Connection=True";

    public static List<Categorias> ObtenerCategorias()
    {
        List<Categorias> ObtenerCategorias = new List<Categorias>();
        string sql = "SELECT * FROM Categorias";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            ObtenerCategorias = db.Query<Categorias>(sql).ToList();
        }
        return ObtenerCategorias;
    }
    public static List<Dificultades> ObtenerDificultades()
    {
        List<Dificultades> ObtenerDificultades = new List<Dificultades>();
        string sql = "SELECT * FROM Dificultades";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            ObtenerDificultades = db.Query<Dificultades>(sql).ToList();
        }
        return ObtenerDificultades;
    }
    public static List<Preguntas> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Preguntas> ObtenerPreguntas = new List<Preguntas>();
        string sql = "SELECT * FROM Preguntas WHERE IdDificultad = @pIdDificultad AND IdCategoria = @pIdCategoria";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            ObtenerPreguntas = db.Query<Preguntas>(sql, new { pIdDificultad = dificultad, pIdCategoria = categoria}).ToList();
        }
        return ObtenerPreguntas;
    }
    public static List<Respuestas> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        List<Respuestas> respuestas = new List<Respuestas>();
        List<Respuestas> respuestasDePregunta = new List<Respuestas>();
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            foreach (Pregunta pregunta in preguntas)
            {
                string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @pIdPregunta";
                respuestasDePregunta = db.Query<Respuestas>(sql, new { IdPregunta = pregunta.pIdPregunta }).ToList();
                respuestas.AddRange(respuestasDePregunta);
            }
        }
        return respuestas;
    }
}