defmodule Kickstarter.CMS.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kickstarter.CMS.Post


  schema "cms_posts" do
    field :body, :string
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :image, :body])
    |> validate_required([:title, :image, :body])
  end
end
