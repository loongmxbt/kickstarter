defmodule Kickstarter.Repo.Migrations.CreateKickstarter.CMS.Tutor do
  use Ecto.Migration

  def change do
    create table(:cms_tutors) do
      add :name, :string
      add :image, :string
      add :desc, :string
      add :body, :text

      timestamps()
    end

  end
end
