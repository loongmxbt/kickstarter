defmodule Kickstarter.CMS.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kickstarter.CMS.Post


  schema "cms_posts" do
    field :body, :string
    field :desc, :string
    field :image, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :image, :desc, :body])
    |> validate_required([:title, :body])
  end
end
