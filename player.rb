# ActiveRecordで、職業一覧を表示する
require 'mysql2'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'
require 'erb'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class Player < ActiveRecord::Base
    belongs_to :job
end

class Job < ActiveRecord::Base
    has_many :players
end

# get '/' do
#   ルーティング
#   @players = Player.all
#   erb :indexコントローラーのこと


get '/' do
  @players = Player.all
  @jobs = Job.all
  erb :index
end


get '/new/' do
 # このパスでidを指定するとデータを追加できる
 Player.create(:name => "山田", :level => 1, :job_id => 4)
 redirect '/'
 #redirectを使うとテンプレート呼び出すかわりに指定したパスに移動することができる
#  erb :new
end

#更新するときはpatch
# 参考：https://qiita.com/suin/items/d17bdfc8dba086d36115
patch '/update/:id' do
  # このパスでidを指定するとデータを更新できる
  player = Player.find(params[:id])
  if player.update(params)
    # flash[:notice] = '更新しました'
    return redirect '/'
  end
  #  flash[:alert] = '更新失敗しました'
  erb :edit
end

get '/edit/:id' do
  @player = Player.find(params[:id])
  @jobs = Job.all
  erb :edit
end

delete '/destroy/:id' do
 # このパスでidを指定するとデータを削除できる
 player = Player.find(params['id'])
 player.destroy
 redirect '/'
end

get '/show/:id' do
 @player = Player.find(params['id'])
 erb :profile
 # 表示のためにprofile.erbファイルを呼び出している
end

get '/jobs/' do
  @jobs = Job.all
  erb :job_index
end

# ↓以下がjob詳細ページを表示するコード
# /job/というパスでidを受け取って、パラメータで指定して該当するレコードを取得、@job変数に代入。
# job_profile.erbテンプレートを用意して
# 表示させる
get '/jobs/:id' do
  @job = Job.find(params['id'])
  erb :job_profile
end
