class Public::StaticPagesController < Public::Base
  def home
    @artists = Artist.order('RANDOM()').where(is_deleted: false).limit(4)
    @works = Work.where(is_deleted: false).order('RANDOM()').limit(4)
    @exhibitions = Exhibition.order('RANDOM()').limit(4)
  end

  def end
  end

  def about
  end

  def contact
  end

  def how_to_register
  end

  def postage
  end

  def entrance
  end
end
