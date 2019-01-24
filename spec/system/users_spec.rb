require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = User.create!(name: 'オコノミ')
  end

  it 'completes yubinbango automatically with JS' do
    # User編集画面を開く
    visit edit_user_path(@user)

    # Nameに"オコノミ"が入力されていることを検証する
    expect(page).to have_field 'Name', with: 'オコノミ'

    # 郵便番号を入力
    fill_in 'Postal code', with: '123-4567'
    # 住所を入力
    fill_in 'Address', with: 'じゅうしょ'

    # 更新実行
    click_button 'Update User'

    # 正しく更新されていること（＝画面の表示が正しいこと）を検証する
    expect(page).to have_content 'User was successfully updated.'
    expect(page).to have_content 'オコノミ'
    expect(page).to have_content '123-4567'
    expect(page).to have_content 'じゅうしょ'
  end
end
