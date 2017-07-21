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
end
