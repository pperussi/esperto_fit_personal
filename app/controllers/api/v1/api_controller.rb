class Api::V1::ApiController < ActionController::API

  def create
    account = Account.find_by(email: auth_params[:email])
    if account.authenticate(auth_params[:password])
      jwt = Auth.issue({account: account.id})
      render json: {jwt: jwt}
    else
    end
  end

  private
    def auth_params
      params.require(:auth).permit(:email, :password)
    end

end
