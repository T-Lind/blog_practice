# Seed at least 5 records. Development/test and production get different posts
# so the lab screenshots show distinct databases.

[
  { first_name: "Ada", last_name: "Lovelace" },
  { first_name: "Alan", last_name: "Turing" },
  { first_name: "Grace", last_name: "Hopper" },
  { first_name: "Edsger", last_name: "Dijkstra" },
  { first_name: "Donald", last_name: "Knuth" }
].each do |attrs|
  User.find_or_create_by!(first_name: attrs[:first_name], last_name: attrs[:last_name])
end

posts =
  if Rails.env.production?
    [
      ["Production Welcome", "This post is only in the production database."],
      ["Heroku Live", "Seeded for the production environment."],
      ["Campus Tour", "Production copy of our blog."],
      ["Office Hours", "Production announcement."],
      ["Final Review", "Production-only wrap-up post."]
    ]
  else
    [
      ["Development Welcome", "This post is only in development/test."],
      ["Local Notes", "Seeded for the development environment."],
      ["Draft Recap", "Dev-only draft post."],
      ["Lab Checklist", "Keep this in development."],
      ["Test Fixture Post", "Used by the seeded-data spec."]
    ]
  end

posts.each do |title, body|
  Post.find_or_create_by!(title: title) { |post| post.body = body }
end
