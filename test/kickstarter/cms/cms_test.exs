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

  describe "tutors" do
    alias Kickstarter.CMS.Tutor

    @valid_attrs %{body: "some body", desc: "some desc", image: "some image", name: "some name"}
    @update_attrs %{body: "some updated body", desc: "some updated desc", image: "some updated image", name: "some updated name"}
    @invalid_attrs %{body: nil, desc: nil, image: nil, name: nil}

    def tutor_fixture(attrs \\ %{}) do
      {:ok, tutor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_tutor()

      tutor
    end

    test "list_tutors/0 returns all tutors" do
      tutor = tutor_fixture()
      assert CMS.list_tutors() == [tutor]
    end

    test "get_tutor!/1 returns the tutor with given id" do
      tutor = tutor_fixture()
      assert CMS.get_tutor!(tutor.id) == tutor
    end

    test "create_tutor/1 with valid data creates a tutor" do
      assert {:ok, %Tutor{} = tutor} = CMS.create_tutor(@valid_attrs)
      assert tutor.body == "some body"
      assert tutor.desc == "some desc"
      assert tutor.image == "some image"
      assert tutor.name == "some name"
    end

    test "create_tutor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_tutor(@invalid_attrs)
    end

    test "update_tutor/2 with valid data updates the tutor" do
      tutor = tutor_fixture()
      assert {:ok, tutor} = CMS.update_tutor(tutor, @update_attrs)
      assert %Tutor{} = tutor
      assert tutor.body == "some updated body"
      assert tutor.desc == "some updated desc"
      assert tutor.image == "some updated image"
      assert tutor.name == "some updated name"
    end

    test "update_tutor/2 with invalid data returns error changeset" do
      tutor = tutor_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_tutor(tutor, @invalid_attrs)
      assert tutor == CMS.get_tutor!(tutor.id)
    end

    test "delete_tutor/1 deletes the tutor" do
      tutor = tutor_fixture()
      assert {:ok, %Tutor{}} = CMS.delete_tutor(tutor)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_tutor!(tutor.id) end
    end

    test "change_tutor/1 returns a tutor changeset" do
      tutor = tutor_fixture()
      assert %Ecto.Changeset{} = CMS.change_tutor(tutor)
    end
  end

  describe "categories" do
    alias Kickstarter.CMS.Category

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CMS.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert CMS.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert CMS.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = CMS.create_category(@valid_attrs)
      assert category.name == "some name"
      assert category.slug == "some slug"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CMS.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, category} = CMS.update_category(category, @update_attrs)
      assert %Category{} = category
      assert category.name == "some updated name"
      assert category.slug == "some updated slug"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = CMS.update_category(category, @invalid_attrs)
      assert category == CMS.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = CMS.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> CMS.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = CMS.change_category(category)
    end
  end
end
