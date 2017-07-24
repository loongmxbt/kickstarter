defmodule Kickstarter.Web.TutorControllerTest do
  use Kickstarter.Web.ConnCase

  alias Kickstarter.CMS

  @create_attrs %{body: "some body", desc: "some desc", image: "some image", name: "some name"}
  @update_attrs %{body: "some updated body", desc: "some updated desc", image: "some updated image", name: "some updated name"}
  @invalid_attrs %{body: nil, desc: nil, image: nil, name: nil}

  def fixture(:tutor) do
    {:ok, tutor} = CMS.create_tutor(@create_attrs)
    tutor
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, tutor_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Tutors"
  end

  test "renders form for new tutors", %{conn: conn} do
    conn = get conn, tutor_path(conn, :new)
    assert html_response(conn, 200) =~ "New Tutor"
  end

  test "creates tutor and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, tutor_path(conn, :create), tutor: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == tutor_path(conn, :show, id)

    conn = get conn, tutor_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Tutor"
  end

  test "does not create tutor and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, tutor_path(conn, :create), tutor: @invalid_attrs
    assert html_response(conn, 200) =~ "New Tutor"
  end

  test "renders form for editing chosen tutor", %{conn: conn} do
    tutor = fixture(:tutor)
    conn = get conn, tutor_path(conn, :edit, tutor)
    assert html_response(conn, 200) =~ "Edit Tutor"
  end

  test "updates chosen tutor and redirects when data is valid", %{conn: conn} do
    tutor = fixture(:tutor)
    conn = put conn, tutor_path(conn, :update, tutor), tutor: @update_attrs
    assert redirected_to(conn) == tutor_path(conn, :show, tutor)

    conn = get conn, tutor_path(conn, :show, tutor)
    assert html_response(conn, 200) =~ "some updated body"
  end

  test "does not update chosen tutor and renders errors when data is invalid", %{conn: conn} do
    tutor = fixture(:tutor)
    conn = put conn, tutor_path(conn, :update, tutor), tutor: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Tutor"
  end

  test "deletes chosen tutor", %{conn: conn} do
    tutor = fixture(:tutor)
    conn = delete conn, tutor_path(conn, :delete, tutor)
    assert redirected_to(conn) == tutor_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, tutor_path(conn, :show, tutor)
    end
  end
end
