class Public::StaticPagesController < Public::Base
  def home
    @artists = Artist.all
    @works = Work.all
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
end
