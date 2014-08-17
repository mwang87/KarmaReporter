def get_error_json(error_message)
    errors_map = {:error => error_message}
    return errors_map.to_json
end


def get_success_json(success_message)
    return_map = {:success => success_message}
    return return_map.to_json
end


def random_alphaneurmeric_string()
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    return (0...50).map { o[rand(o.length)] }.join
end