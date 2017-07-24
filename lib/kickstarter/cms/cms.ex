defmodule Kickstarter.CMS do
  @moduledoc """
  The boundary for the CMS system.
  """

  import Ecto.Query, warn: false
  alias Kickstarter.Repo

  alias Kickstarter.CMS.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Repo.all(Post)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{source: %Post{}}

  """
  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end

  alias Kickstarter.CMS.Showcase

  @doc """
  Returns the list of showcases.

  ## Examples

      iex> list_showcases()
      [%Showcase{}, ...]

  """
  def list_showcases do
    Repo.all(Showcase)
  end

  @doc """
  Gets a single showcase.

  Raises `Ecto.NoResultsError` if the Showcase does not exist.

  ## Examples

      iex> get_showcase!(123)
      %Showcase{}

      iex> get_showcase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_showcase!(id), do: Repo.get!(Showcase, id)

  @doc """
  Creates a showcase.

  ## Examples

      iex> create_showcase(%{field: value})
      {:ok, %Showcase{}}

      iex> create_showcase(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_showcase(attrs \\ %{}) do
    %Showcase{}
    |> Showcase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a showcase.

  ## Examples

      iex> update_showcase(showcase, %{field: new_value})
      {:ok, %Showcase{}}

      iex> update_showcase(showcase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_showcase(%Showcase{} = showcase, attrs) do
    showcase
    |> Showcase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Showcase.

  ## Examples

      iex> delete_showcase(showcase)
      {:ok, %Showcase{}}

      iex> delete_showcase(showcase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_showcase(%Showcase{} = showcase) do
    Repo.delete(showcase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking showcase changes.

  ## Examples

      iex> change_showcase(showcase)
      %Ecto.Changeset{source: %Showcase{}}

  """
  def change_showcase(%Showcase{} = showcase) do
    Showcase.changeset(showcase, %{})
  end

  alias Kickstarter.CMS.Tutor

  @doc """
  Returns the list of tutors.

  ## Examples

      iex> list_tutors()
      [%Tutor{}, ...]

  """
  def list_tutors do
    Repo.all(Tutor)
  end

  @doc """
  Gets a single tutor.

  Raises `Ecto.NoResultsError` if the Tutor does not exist.

  ## Examples

      iex> get_tutor!(123)
      %Tutor{}

      iex> get_tutor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tutor!(id), do: Repo.get!(Tutor, id)

  @doc """
  Creates a tutor.

  ## Examples

      iex> create_tutor(%{field: value})
      {:ok, %Tutor{}}

      iex> create_tutor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tutor(attrs \\ %{}) do
    %Tutor{}
    |> Tutor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tutor.

  ## Examples

      iex> update_tutor(tutor, %{field: new_value})
      {:ok, %Tutor{}}

      iex> update_tutor(tutor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tutor(%Tutor{} = tutor, attrs) do
    tutor
    |> Tutor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tutor.

  ## Examples

      iex> delete_tutor(tutor)
      {:ok, %Tutor{}}

      iex> delete_tutor(tutor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tutor(%Tutor{} = tutor) do
    Repo.delete(tutor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tutor changes.

  ## Examples

      iex> change_tutor(tutor)
      %Ecto.Changeset{source: %Tutor{}}

  """
  def change_tutor(%Tutor{} = tutor) do
    Tutor.changeset(tutor, %{})
  end

  alias Kickstarter.CMS.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end
end
