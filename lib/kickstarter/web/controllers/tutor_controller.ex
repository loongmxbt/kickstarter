defmodule Kickstarter.Web.TutorController do
  use Kickstarter.Web, :controller

  alias Kickstarter.CMS

  def index(conn, _params) do
    tutors = CMS.list_tutors()
    render(conn, "index.html", tutors: tutors)
  end

  def new(conn, _params) do
    changeset = CMS.change_tutor(%Kickstarter.CMS.Tutor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tutor" => tutor_params}) do
    case CMS.create_tutor(tutor_params) do
      {:ok, tutor} ->
        conn
        |> put_flash(:info, "Tutor created successfully.")
        |> redirect(to: tutor_path(conn, :show, tutor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tutor = CMS.get_tutor!(id)
    render(conn, "show.html", tutor: tutor)
  end

  def edit(conn, %{"id" => id}) do
    tutor = CMS.get_tutor!(id)
    changeset = CMS.change_tutor(tutor)
    render(conn, "edit.html", tutor: tutor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tutor" => tutor_params}) do
    tutor = CMS.get_tutor!(id)

    case CMS.update_tutor(tutor, tutor_params) do
      {:ok, tutor} ->
        conn
        |> put_flash(:info, "Tutor updated successfully.")
        |> redirect(to: tutor_path(conn, :show, tutor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tutor: tutor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tutor = CMS.get_tutor!(id)
    {:ok, _tutor} = CMS.delete_tutor(tutor)

    conn
    |> put_flash(:info, "Tutor deleted successfully.")
    |> redirect(to: tutor_path(conn, :index))
  end
end
