defmodule Kickstarter.Repo.Migrations.CreateKickstarter.CMS.Post do
  use Ecto.Migration

  def change do
    create table(:cms_posts) do
      add :title, :string
      add :image, :string
      add :body, :string

      timestamps()
    end

  end
end
