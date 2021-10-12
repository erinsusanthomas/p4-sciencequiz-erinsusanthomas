module NavigationHelpers
  def path_to(page_name)
    case page_name
 
    when /the home\s?page/
      '/'
    when /the About Us\s?page/
      about_path
    when /the Contact Us\s?page/
      contact_path
    when /the Privacy\s?page/
      privacy_path

    # ORGANIZATIONS
    when /the organizations\s?page/
      organizations_path      
    when /the new organization\s?page/
      new_organization_path
    when /the details for ACAC/
      organization_path(@acac)
    when /the details for Millvale/
      organization_path(@millvale)
    when /edit the ACAC organization\s?/
      edit_organization_path(@acac)  

    # STUDENTS
    when /the students\s?page/ 
      students_path
    when /Jacob Graham's details\s?/
      student_path(@jacob)
    when /edit Jacob Graham's\s?record/
      edit_student_path(@jacob)    
    when /the new student\s?page/
      new_student_path

    # TEAMS
    when /the teams\s?page/ 
      teams_path
    when /the ACAC Junior 2 details\s?page/
      team_path(@acac_j2)
    when /edit the ACAC Junior 2\s?page/
      edit_team_path(@acac_j2)    
    when /the new team\s?page/
      new_team_path
    when /the ACAC Junior 1 details\s?page/
      team_path(@acac_j1)

    # ASSIGNMENTS (STUDENT_TEAMS)
    when /terminate Jacob's assignment\s?/
      terminate_student_team_path(@jacob_t2)    
    when /add an assignment for Didi to ACAC Junior 1\s?/
      new_assignment_path(team_id: @acac_j1.id)

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)