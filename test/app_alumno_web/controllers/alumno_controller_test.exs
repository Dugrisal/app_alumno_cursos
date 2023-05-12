defmodule AppAlumnoWeb.AlumnoControllerTest do
  use AppAlumnoWeb.ConnCase

  import AppAlumno.AlumnosFixtures

  alias AppAlumno.Alumnos.Alumno

  @create_attrs %{
    apellido: "some apellido",
    email: "some email",
    id_alumno: "some id_alumno",
    nombre: "some nombre",
    telefono: "some telefono"
  }
  @update_attrs %{
    apellido: "some updated apellido",
    email: "some updated email",
    id_alumno: "some updated id_alumno",
    nombre: "some updated nombre",
    telefono: "some updated telefono"
  }
  @invalid_attrs %{apellido: nil, email: nil, id_alumno: nil, nombre: nil, telefono: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all alumnos", %{conn: conn} do
      conn = get(conn, Routes.alumno_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create alumno" do
    test "renders alumno when data is valid", %{conn: conn} do
      conn = post(conn, Routes.alumno_path(conn, :create), alumno: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.alumno_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "apellido" => "some apellido",
               "email" => "some email",
               "id_alumno" => "some id_alumno",
               "nombre" => "some nombre",
               "telefono" => "some telefono"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.alumno_path(conn, :create), alumno: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update alumno" do
    setup [:create_alumno]

    test "renders alumno when data is valid", %{conn: conn, alumno: %Alumno{id: id} = alumno} do
      conn = put(conn, Routes.alumno_path(conn, :update, alumno), alumno: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.alumno_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "apellido" => "some updated apellido",
               "email" => "some updated email",
               "id_alumno" => "some updated id_alumno",
               "nombre" => "some updated nombre",
               "telefono" => "some updated telefono"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, alumno: alumno} do
      conn = put(conn, Routes.alumno_path(conn, :update, alumno), alumno: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete alumno" do
    setup [:create_alumno]

    test "deletes chosen alumno", %{conn: conn, alumno: alumno} do
      conn = delete(conn, Routes.alumno_path(conn, :delete, alumno))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.alumno_path(conn, :show, alumno))
      end
    end
  end

  defp create_alumno(_) do
    alumno = alumno_fixture()
    %{alumno: alumno}
  end
end
