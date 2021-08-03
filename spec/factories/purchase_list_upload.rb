FactoryBot.define do
  factory :purchase_list_upload do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_tab.tab'), 'file/tab') }
  end
end
