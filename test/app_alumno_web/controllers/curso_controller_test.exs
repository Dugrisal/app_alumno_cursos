defmodule AppAlumnoWeb.CursoControllerTest do
  use AppAlumnoWeb.ConnCase

  import AppAlumno.CursosFixtures

  alias AppAlumno.Cursos.Curso

  @create_attrs %{
    codcurso: "some codcurso",
    fechafin: ~D[2023-05-10],
    fechaini: ~D[2023-05-10],
    nomcurso: "some nomcurso",
    nota: 42
  }
  @update_attrs %{
    codcurso: "some updated codcurso",
    fechafin: ~D[2023-05-11],
    fechaini: ~D[2023-05-11],
    nomcurso: "some updated nomcurso",
    nota: 43
  }
  @invalid_attrs %{codcurso: nil, fechafin: nil, fechaini: nil, nomcurso: nil, nota: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cursos", %{conn: conn} do
      conn = get(conn, Routes.curso_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create curso" do
    test "renders curso when data is valid", %{conn: conn} do
      conn = post(conn, Routes.curso_path(conn, :create), curso: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.curso_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "codcurso" => "some codcurso",
               "fechafin" => "2023-05-10",
               "fechaini" => "2023-05-10",
               "nomcurso" => "some nomcurso",
               "nota" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.curso_path(conn, :create), curso: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update curso" do
    setup [:create_curso]

    test "renders curso when data is valid", %{conn: conn, curso: %Curso{id: id} = curso} do
      conn = put(conn, Routes.curso_path(conn, :update, curso), curso: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.curso_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "codcurso" => "some updated codcurso",
               "fechafin" => "2023-05-11",
               "fechaini" => "2023-05-11",
               "nomcurso" => "some updated nomcurso",
               "nota" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, curso: curso} do
      conn = put(conn, Routes.curso_path(conn, :update, curso), curso: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete curso" do
    setup [:create_curso]

    test "deletes chosen curso", %{conn: conn, curso: curso} do
      conn = delete(conn, Routes.curso_path(conn, :delete, curso))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.curso_path(conn, :show, curso))
      end
    end
  end

  defp create_curso(_) do
    curso = curso_fixture()
    %{curso: curso}
  end
end
