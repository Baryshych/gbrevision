class MainController < ApplicationController
    before_action :authenticate_user!
    def index
        at = 'z26cmQ0zmO2Q9J98qOF9DIW1zHBA7ycMIdxy9BwfuI4nKBzwfihZVpFtXdMiNPx0'
        user = '2473'
        @pings = Array.new
        @pings << `ping kriptogoldck.com -c 3`
        ### Ну тут нужно отдельным методом заебашить, где аргументы это урл и параметры
        ### Но и так сойдет
        start_time = Time.new
        @body = HTTP.get('https://kriptogoldck.com/client/2473', :params => {
            :user => user,
            :at => at
        })
        end_time = Time.new
        @pings << end_time - start_time
        l = Latency.new
        l.started = start_time
        l.url = 'https://kriptogoldck.com/client/2473'
        l.latency = end_time - start_time
        l.save
        ###
        start_time = Time.new
        @body = HTTP.get('https://kriptogoldck.com/pools', :params => {
            :user => user,
            :at => at
        })
        end_time = Time.new
        @pings << end_time - start_time
                l = Latency.new
        l.started = start_time
        l.url = 'https://kriptogoldck.com/pools'
        l.latency = end_time - start_time
        l.save
        ###
        start_time = Time.new
        @body = HTTP.get('https://iridium.kriptogoldck.com:2000/api/clients/2473/transactions?access_token=z26cmQ0zmO2Q9J98qOF9DIW1zHBA7ycMIdxy9BwfuI4nKBzwfihZVpFtXdMiNPx0')
        end_time = Time.new
        @pings << end_time - start_time
                l = Latency.new
        l.started = start_time
        l.url = 'https://kriptogoldck.com/client/2473'
        l.latency = end_time - start_time
        l.save
        ###
    end
    
    def online
        @online = 0
        @online = params[:count]
    end
end
