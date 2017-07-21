defmodule Kickstarter.Web.ShowcaseController do
  use Kickstarter.Web, :controller

  alias Kickstarter.CMS

  def index(conn, _params) do
    showcases = CMS.list_showcases()
    render(conn, "index.html", showcases: showcases)
  end

  def new(conn, _params) do
    changeset = CMS.change_showcase(%Kickstarter.CMS.Showcase{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"showcase" => showcase_params}) do
    case CMS.create_showcase(showcase_params) do
      {:ok, showcase} ->
        conn
        |> put_flash(:info, "Showcase created successfully.")
        |> redirect(to: showcase_path(conn, :show, showcase))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    showcase = CMS.get_showcase!(id)
    render(conn, "show.html", showcase: showcase)
  end

  def edit(conn, %{"id" => id}) do
    showcase = CMS.get_showcase!(id)
    changeset = CMS.change_showcase(showcase)
    render(conn, "edit.html", showcase: showcase, changeset: changeset)
  end

  def update(conn, %{"id" => id, "showcase" => showcase_params}) do
    showcase = CMS.get_showcase!(id)

    case CMS.update_showcase(showcase, showcase_params) do
      {:ok, showcase} ->
        conn
        |> put_flash(:info, "Showcase updated successfully.")
        |> redirect(to: showcase_path(conn, :show, showcase))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", showcase: showcase, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    showcase = CMS.get_showcase!(id)
    {:ok, _showcase} = CMS.delete_showcase(showcase)

    conn
    |> put_flash(:info, "Showcase deleted successfully.")
    |> redirect(to: showcase_path(conn, :index))
  end
end
