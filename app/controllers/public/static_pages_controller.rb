class Public::StaticPagesController < Public::Base
  def home
    @artists = Artist.where(:is_deleted => false).page(params[:page]).per(4).reverse_order
    @works = Work.where(:is_deleted => false).page(params[:page]).per(4).reverse_order
    @exhibitions = Exhibition.page(params[:page]).per(4).reverse_order
  end

  def end
  end

  def about
  end

  def contact
  end

  def how_to_register
  end

  def how_to_buy
  end

  def entrance
  end

  
  def test
    @works = Work.all
    @lis = LineItem.all
  end
end
