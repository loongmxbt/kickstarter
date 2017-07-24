defmodule Kickstarter.CMS.Tutor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Kickstarter.CMS.Tutor


  schema "cms_tutors" do
    field :body, :string
    field :desc, :string
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Tutor{} = tutor, attrs) do
    tutor
    |> cast(attrs, [:name, :image, :desc, :body])
    |> validate_required([:name, :image, :desc, :body])
  end
end
