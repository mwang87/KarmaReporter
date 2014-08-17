require 'sinatra'
require 'json'
require './utils/utils.rb'
require './settings'
require './models'

enable :logging

get "/" do
    puts "PROCESS ID" + Process.pid.to_s
    haml :index
end


#Reporting the karma, it requires a picture file to be provided. 
#The filename is "fileUpload"
#Also reports the infraction that the picture represents
post "/reportkarma" do
    
    if params['fileUpload'] == nil 
        return get_error_json("No File")
    end
        
    reason = params["ReportReason"]
    
    if reason == nil
        return get_error_json("No Reason")
    end
        
    report_obj = ReportInstance.new
    report_obj.reportreason = reason
    report_obj.filename = random_alphaneurmeric_string()
    
    save_filename = report_obj.filename
    
    if report_obj.save
        logger.debug "SAVED"
    else
        logger.debug "NOT SAVED"
        return get_error_json("DB Error")
    end
    
    
    File.open('uploads/' + save_filename, "w") do |f|
        f.write(params['fileUpload'][:tempfile].read)
    end
    
    return get_success_json("Success")
end