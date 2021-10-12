module Contexts
    module Events
  
      def create_events
        @acac_e1 = FactoryBot.create(:event, organization: @acac)
        @acac_e2 = FactoryBot.create(:event, organization: @acac, date: "2020-01-01") 
        @acac_e3 = FactoryBot.create(:event, organization: @acac, date: "2021-01-01")  
        @millvale_e1 = FactoryBot.create(:event, organization: @millvale, date: "2020-11-11")
        @sq_e1 = FactoryBot.create(:event, organization: @sq, date: "2022-01-01", active: false)
      end
      
      def destroy_events
        @acac_e1.destroy
        @acac_e2.destroy
        @acac_e3.destroy
        @millvale_e1.destroy
        @sq_e1.destroy
      end
  
    end
  end