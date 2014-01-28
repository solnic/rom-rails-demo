class UsersController < ApplicationController

  def index
    render locals: { users: db[:users] }
  end

  def new
    render locals: { user: User.new }
  end

  def edit
    user = db[:users].restrict(id: params[:id]).one
    render locals: { user: user }
  end

  def update
    db.session do |s|
      user = s[:users].restrict(id: params[:id]).one

      user.name = params[:user][:name]

      s[:users].save(user) if s[:users].dirty?(user)

      s.flush
    end

    redirect_to :users, notice: 'User updated'
  end

  def create
    db.session do |s|
      user = s[:users].new(params[:user])

      s[:users].save(user)

      s.flush
    end

    redirect_to :users, notice: 'User added'
  end

end
