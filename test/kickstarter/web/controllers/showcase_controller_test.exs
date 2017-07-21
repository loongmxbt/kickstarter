defmodule Kickstarter.Web.ShowcaseControllerTest do
  use Kickstarter.Web.ConnCase

  alias Kickstarter.CMS

  @create_attrs %{desc: "some desc", image: "some image", name: "some name"}
  @update_attrs %{desc: "some updated desc", image: "some updated image", name: "some updated name"}
  @invalid_attrs %{desc: nil, image: nil, name: nil}

  def fixture(:showcase) do
    {:ok, showcase} = CMS.create_showcase(@create_attrs)
    showcase
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, showcase_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Showcases"
  end

  test "renders form for new showcases", %{conn: conn} do
    conn = get conn, showcase_path(conn, :new)
    assert html_response(conn, 200) =~ "New Showcase"
  end

  test "creates showcase and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, showcase_path(conn, :create), showcase: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == showcase_path(conn, :show, id)

    conn = get conn, showcase_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Showcase"
  end

  test "does not create showcase and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, showcase_path(conn, :create), showcase: @invalid_attrs
    assert html_response(conn, 200) =~ "New Showcase"
  end

  test "renders form for editing chosen showcase", %{conn: conn} do
    showcase = fixture(:showcase)
    conn = get conn, showcase_path(conn, :edit, showcase)
    assert html_response(conn, 200) =~ "Edit Showcase"
  end

  test "updates chosen showcase and redirects when data is valid", %{conn: conn} do
    showcase = fixture(:showcase)
    conn = put conn, showcase_path(conn, :update, showcase), showcase: @update_attrs
    assert redirected_to(conn) == showcase_path(conn, :show, showcase)

    conn = get conn, showcase_path(conn, :show, showcase)
    assert html_response(conn, 200) =~ "some updated desc"
  end

  test "does not update chosen showcase and renders errors when data is invalid", %{conn: conn} do
    showcase = fixture(:showcase)
    conn = put conn, showcase_path(conn, :update, showcase), showcase: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Showcase"
  end

  test "deletes chosen showcase", %{conn: conn} do
    showcase = fixture(:showcase)
    conn = delete conn, showcase_path(conn, :delete, showcase)
    assert redirected_to(conn) == showcase_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, showcase_path(conn, :show, showcase)
    end
  end
end
