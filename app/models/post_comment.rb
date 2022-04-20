class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image, optional: true
  # optional: true=外部キーがnilであってもDBに保存できます。
  # コメントを保存する際にValidation failed: Post image must existが出てしまい、postimageが空だというバリデーションのエラーが出てしまった
  # optional: trueを使うと、入力が空であっても保存ができるようになる
  belongs_to :post
end
