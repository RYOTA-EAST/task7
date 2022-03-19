class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '未着手' },
    { id: 3, name: '着手中' },
    { id: 4, name: '完了' }
  ]
end
