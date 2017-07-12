alias Kickstarter.{Repo, Coherence.User}
Repo.delete_all User

User.changeset(%User{}, %{name: "dragonszy", email: "dragonszy@163.com", password: "szy555", password_confirmation: "szy555"})
|> Repo.insert!
|> Coherence.ControllerHelpers.confirm!