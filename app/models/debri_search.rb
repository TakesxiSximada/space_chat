
class DebriSearch
  def initialize(params)
    @params = params
  end

  def execute
    ActiveRecord::Base.connection.select("SELECT * FROM debris WHERE deleted = 0 ORDER BY created_at desc LIMIT #{@params[:limit]};")
  end
end

