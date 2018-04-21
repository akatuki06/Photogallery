class Public::AddressesController < Public::Base
	before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit]

  def new
  	@address = Address.new
  end

  def create
  	@address = Address.new(address_params)
  	@address.user_id = current_user.id
  	if @address.save
  		redirect_to addresses_path
  	else
  		render :new
  	end
  end

  def show
    @address = Address.find_by(user_id: current_user)
  end

  def edit
  	@address = Address.find(current_user)
  	if @address.user != current_user
       redirect_to addresses_path
      end
  end

  def update
    @address = Address.find(current_user)
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

private

  	def address_params
  	  params.require(:address).permit(:prefecture_id, :name, :name_kana, :zipcode, :address, :phone)
  	end

    def ensure_correct_user
    @address = Address.find_by(user_id: current_user.id)
    if @address.blank?
      redirect_to new_addresses_path
    end
  end

end
