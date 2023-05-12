defmodule AppAlumno.CursosTest do
  use AppAlumno.DataCase

  alias AppAlumno.Cursos

  describe "cursos" do
    alias AppAlumno.Cursos.Curso

    import AppAlumno.CursosFixtures

    @invalid_attrs %{codcurso: nil, fechafin: nil, fechaini: nil, nomcurso: nil, nota: nil}

    test "list_cursos/0 returns all cursos" do
      curso = curso_fixture()
      assert Cursos.list_cursos() == [curso]
    end

    test "get_curso!/1 returns the curso with given id" do
      curso = curso_fixture()
      assert Cursos.get_curso!(curso.id) == curso
    end

    test "create_curso/1 with valid data creates a curso" do
      valid_attrs = %{codcurso: "some codcurso", fechafin: ~D[2023-05-10], fechaini: ~D[2023-05-10], nomcurso: "some nomcurso", nota: 42}

      assert {:ok, %Curso{} = curso} = Cursos.create_curso(valid_attrs)
      assert curso.codcurso == "some codcurso"
      assert curso.fechafin == ~D[2023-05-10]
      assert curso.fechaini == ~D[2023-05-10]
      assert curso.nomcurso == "some nomcurso"
      assert curso.nota == 42
    end

    test "create_curso/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cursos.create_curso(@invalid_attrs)
    end

    test "update_curso/2 with valid data updates the curso" do
      curso = curso_fixture()
      update_attrs = %{codcurso: "some updated codcurso", fechafin: ~D[2023-05-11], fechaini: ~D[2023-05-11], nomcurso: "some updated nomcurso", nota: 43}

      assert {:ok, %Curso{} = curso} = Cursos.update_curso(curso, update_attrs)
      assert curso.codcurso == "some updated codcurso"
      assert curso.fechafin == ~D[2023-05-11]
      assert curso.fechaini == ~D[2023-05-11]
      assert curso.nomcurso == "some updated nomcurso"
      assert curso.nota == 43
    end

    test "update_curso/2 with invalid data returns error changeset" do
      curso = curso_fixture()
      assert {:error, %Ecto.Changeset{}} = Cursos.update_curso(curso, @invalid_attrs)
      assert curso == Cursos.get_curso!(curso.id)
    end

    test "delete_curso/1 deletes the curso" do
      curso = curso_fixture()
      assert {:ok, %Curso{}} = Cursos.delete_curso(curso)
      assert_raise Ecto.NoResultsError, fn -> Cursos.get_curso!(curso.id) end
    end

    test "change_curso/1 returns a curso changeset" do
      curso = curso_fixture()
      assert %Ecto.Changeset{} = Cursos.change_curso(curso)
    end
  end
end
