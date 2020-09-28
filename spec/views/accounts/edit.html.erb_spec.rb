require File.dirname(__FILE__) + '/../../spec_helper'

describe "/accounts/edit.html.erb" do

  fixtures :users, :accounts

  before(:each) do
    assign(:account, @account = accounts(:localhost))
  end

  it 'should have a form for editing the account' do
    render
    rendered.should have_css("form[action='#{account_path}']") do |form|
      form.should have_css("input[id='account_name'][value='#{@account.name}']")
    end
  end

end
