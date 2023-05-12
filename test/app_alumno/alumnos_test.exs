defmodule AppAlumno.AlumnosTest do
  use AppAlumno.DataCase

  alias AppAlumno.Alumnos

  describe "alumnos" do
    alias AppAlumno.Alumnos.Alumno

    import AppAlumno.AlumnosFixtures

    @invalid_attrs %{apellido: nil, email: nil, id_alumno: nil, nombre: nil, telefono: nil}

    test "list_alumnos/0 returns all alumnos" do
      alumno = alumno_fixture()
      assert Alumnos.list_alumnos() == [alumno]
    end

    test "get_alumno!/1 returns the alumno with given id" do
      alumno = alumno_fixture()
      assert Alumnos.get_alumno!(alumno.id) == alumno
    end

    test "create_alumno/1 with valid data creates a alumno" do
      valid_attrs = %{apellido: "some apellido", email: "some email", id_alumno: "some id_alumno", nombre: "some nombre", telefono: "some telefono"}

      assert {:ok, %Alumno{} = alumno} = Alumnos.create_alumno(valid_attrs)
      assert alumno.apellido == "some apellido"
      assert alumno.email == "some email"
      assert alumno.id_alumno == "some id_alumno"
      assert alumno.nombre == "some nombre"
      assert alumno.telefono == "some telefono"
    end

    test "create_alumno/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Alumnos.create_alumno(@invalid_attrs)
    end

    test "update_alumno/2 with valid data updates the alumno" do
      alumno = alumno_fixture()
      update_attrs = %{apellido: "some updated apellido", email: "some updated email", id_alumno: "some updated id_alumno", nombre: "some updated nombre", telefono: "some updated telefono"}

      assert {:ok, %Alumno{} = alumno} = Alumnos.update_alumno(alumno, update_attrs)
      assert alumno.apellido == "some updated apellido"
      assert alumno.email == "some updated email"
      assert alumno.id_alumno == "some updated id_alumno"
      assert alumno.nombre == "some updated nombre"
      assert alumno.telefono == "some updated telefono"
    end

    test "update_alumno/2 with invalid data returns error changeset" do
      alumno = alumno_fixture()
      assert {:error, %Ecto.Changeset{}} = Alumnos.update_alumno(alumno, @invalid_attrs)
      assert alumno == Alumnos.get_alumno!(alumno.id)
    end

    test "delete_alumno/1 deletes the alumno" do
      alumno = alumno_fixture()
      assert {:ok, %Alumno{}} = Alumnos.delete_alumno(alumno)
      assert_raise Ecto.NoResultsError, fn -> Alumnos.get_alumno!(alumno.id) end
    end

    test "change_alumno/1 returns a alumno changeset" do
      alumno = alumno_fixture()
      assert %Ecto.Changeset{} = Alumnos.change_alumno(alumno)
    end
  end
end
