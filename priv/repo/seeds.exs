alias Kickstarter.{Repo, Coherence.User, CMS.Showcase}
Repo.delete_all User
Repo.delete_all Showcase

User.changeset(%User{}, %{name: "dragonszy", email: "dragonszy@163.com", password: "szy555", password_confirmation: "szy555"})
|> Repo.insert!
|> Coherence.ControllerHelpers.confirm!

for i <- 1..9 do
  Repo.insert(%Showcase{name: "案例演示#{i}", image: "http://iph.href.lu/300x250", desc: "案例简介一共多少字案例简介一共多少字案例简介一共多少字案例简介一共多少字"})
end
