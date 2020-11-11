provider "github" {
  token        = var.token
}
resource "github_repository" "devops03" {
  name        = "devops03"
  description = "my hw"
}
resource "github_branch" "develop" {
  repository = "devops03"
  branch     = "develop"
  source_branch = "main"
  depends_on = [github_repository.devops03]
}
resource "github_branch_protection" "devops03" {
  repository_id    = github_repository.devops03.node_id
  pattern         = "main"
  enforce_admins = true
}
resource "github_user_ssh_key" "id_rsa"{
    title = "Personal Key"
    key = file("/home/iryna/.ssh/id_rsa.pub")
}