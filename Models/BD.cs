using System.Collections.Generic;
using System;
using System.Data.SqlClient;
using Dapper;
namespace TP7.Models;
public static class BD
{
    private static string ConnectionString = @"Server=localhost; DataBase=PreguntadOrt; Trusted_Connection=True";

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
        string sql = "SELECT * FROM Preguntas";
        using(SqlConnection db = new SqlConnection(ConnectionString))
        {
            if(dificultad != -1)
            {
                sql += " WHERE IdDificultad = @pIdDificultad";
            }
            if(categoria != -1)
            {
                sql+=" AND IdCategoria = @pIdCategoria";
            }
            ObtenerPreguntas = db.Query<Preguntas>(sql, new { pIdDificultad = dificultad, pIdCategoria = categoria}).ToList();
        }
        return ObtenerPreguntas;
    }
    public static List<Respuestas> ObtenerRespuestas(List<Preguntas> preguntas)
    {
        List<Respuestas> respuestas = new List<Respuestas>();
        List<Respuestas> respuestasDePregunta = new List<Respuestas>();
        using (SqlConnection db = new SqlConnection(ConnectionString))
        {
            foreach (Preguntas pregunta in preguntas)
            {
                string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @pIdPregunta";
                respuestasDePregunta = db.Query<Respuestas>(sql, new { pIdPregunta = pregunta.IdPregunta }).ToList();
                respuestas.AddRange(respuestasDePregunta);
            }
        }
        return respuestas;
    }
}