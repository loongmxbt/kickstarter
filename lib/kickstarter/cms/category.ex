defmodule Kickstarter.CMS.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kickstarter.CMS.Category


  schema "cms_categories" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end
