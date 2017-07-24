defmodule Kickstarter.Repo.Migrations.CreateKickstarter.CMS.Category do
  use Ecto.Migration

  def change do
    create table(:cms_categories) do
      add :slug, :string
      add :name, :string

      timestamps()
    end

  end
end
