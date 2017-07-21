defmodule Kickstarter.CMSTest do
  use Kickstarter.DataCase

  alias Kickstarter.CMS

  describe "posts" do
    alias Kickstarter.CMS.Post

    @valid_attrs %{body: "some body", image: "some image", title: "some title"}
    @update_attrs %{body: "some updated body", image: "some updated image", title: "some updated title"}
    @invalid_attrs %{body: nil, image: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert CMS.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert CMS.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = CMS.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.image == "some image"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = CMS.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.body == "some updated body"
      assert post.image == "some updated image"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_post(post, @invalid_attrs)
      assert post == CMS.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = CMS.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = CMS.change_post(post)
    end
  end

  describe "showcases" do
    alias Kickstarter.CMS.Showcase

    @valid_attrs %{desc: "some desc", image: "some image", name: "some name"}
    @update_attrs %{desc: "some updated desc", image: "some updated image", name: "some updated name"}
    @invalid_attrs %{desc: nil, image: nil, name: nil}

    def showcase_fixture(attrs \\ %{}) do
      {:ok, showcase} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_showcase()

      showcase
    end

    test "list_showcases/0 returns all showcases" do
      showcase = showcase_fixture()
      assert CMS.list_showcases() == [showcase]
    end

    test "get_showcase!/1 returns the showcase with given id" do
      showcase = showcase_fixture()
      assert CMS.get_showcase!(showcase.id) == showcase
    end

    test "create_showcase/1 with valid data creates a showcase" do
      assert {:ok, %Showcase{} = showcase} = CMS.create_showcase(@valid_attrs)
      assert showcase.desc == "some desc"
      assert showcase.image == "some image"
      assert showcase.name == "some name"
    end

    test "create_showcase/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_showcase(@invalid_attrs)
    end

    test "update_showcase/2 with valid data updates the showcase" do
      showcase = showcase_fixture()
      assert {:ok, showcase} = CMS.update_showcase(showcase, @update_attrs)
      assert %Showcase{} = showcase
      assert showcase.desc == "some updated desc"
      assert showcase.image == "some updated image"
      assert showcase.name == "some updated name"
    end

    test "update_showcase/2 with invalid data returns error changeset" do
      showcase = showcase_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_showcase(showcase, @invalid_attrs)
      assert showcase == CMS.get_showcase!(showcase.id)
    end

    test "delete_showcase/1 deletes the showcase" do
      showcase = showcase_fixture()
      assert {:ok, %Showcase{}} = CMS.delete_showcase(showcase)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_showcase!(showcase.id) end
    end

    test "change_showcase/1 returns a showcase changeset" do
      showcase = showcase_fixture()
      assert %Ecto.Changeset{} = CMS.change_showcase(showcase)
    end
  end
end
