module Contexts
  module Teams

    def create_teams
      @acac_s1     = FactoryBot.create(:team, organization: @acac, coach:@sophie)
      @millvale_j1 = FactoryBot.create(:team, organization: @millvale, coach:@ed, name: 'Millvale 1', division: 'junior')
      @acac_s4     = FactoryBot.create(:team, organization: @acac, coach:@cindy, name: 'ACAC 4', active: false)
    end

    def create_more_teams
      @acac_s2 = FactoryBot.create(:team, organization: @acac, coach:@chuck, name: 'ACAC 2', division: 'senior')
      @acac_s3 = FactoryBot.create(:team, organization: @acac, coach:@cindy, name: 'ACAC 3', division: 'senior')
      @acac_j1 = FactoryBot.create(:team, organization: @acac, coach:@sophie, name: 'ACAC 1', division: 'junior')
      @acac_j2 = FactoryBot.create(:team, organization: @acac, coach:@chuck, name: 'ACAC 2', division: 'junior')
      @acac_j3 = FactoryBot.create(:team, organization: @acac, coach:@sophie, name: 'ACAC 3', division: 'junior')
    end

    def destroy_teams
      @acac_s1.destroy
      @acac_s4.destroy
      @millvale_j1.destroy
    end

    def destroy_more_teams
      @acac_s2.destroy
      @acac_s3.destroy
      @acac_j1.destroy
      @acac_j2.destroy
      @acac_j3.destroy
    end

  end
end