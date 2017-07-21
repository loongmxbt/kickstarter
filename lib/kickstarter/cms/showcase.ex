defmodule Kickstarter.CMS.Showcase do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kickstarter.CMS.Showcase


  schema "cms_showcases" do
    field :desc, :string
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Showcase{} = showcase, attrs) do
    showcase
    |> cast(attrs, [:name, :image, :desc])
    |> validate_required([:name, :image, :desc])
  end
end
