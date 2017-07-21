defmodule Kickstarter.Repo.Migrations.CreateKickstarter.CMS.Showcase do
  use Ecto.Migration

  def change do
    create table(:cms_showcases) do
      add :name, :string
      add :image, :string
      add :desc, :string

      timestamps()
    end

  end
end
