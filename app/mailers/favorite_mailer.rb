class FavoriteMailer < ApplicationMailer
  default from: "thomaslawton91@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@polar-thicket-17712.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@polar-thicket-17712.com>"
    headers["References"] = "<post/#{post.id}@polar-thicket-17712.com>"

    @user = user
    @post = post
    @comment = comment
    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@polar-thicket-17712.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@polar-thicket-17712.com>"
    headers["References"] = "<post/#{post.id}@polar-thicket-17712.com>"

    @post = post

    mail(to: post.user.email, subject: "You're following, #{post.title}.")
  end
end
