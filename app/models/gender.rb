class Gender < ActiveHash::Base

  self.data = [
              {id: 0, name: '--'}, {id: 1, name: '男'}, {id: 2, name: '女'}, 
            
            ]

            # def ransackable_attributes(auth_object = nil)
            #   column_names + _ransackers.keys
            # end
end

