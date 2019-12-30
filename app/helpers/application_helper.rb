module ApplicationHelper

	def app_name
		appname = "iokos" 
	end
	
	def app_logo
		app_photo =  asset_path("img/gruenheim_logo.png").to_s
	end

	def year
		year = Time.new.year
	end

	def index_bg
		dummy_photo =  asset_path("img/gruenheim.png").to_s
	end

	


	def default_profile
		default_profile =  asset_path("img/human/avatar_2x.png").to_s
		
	end

	def full_name
		"#{current_user.profile.first_name} #{current_user.profile.last_name}"
		
	end

	def client_name(user_id)
		user = User.find(user_id)
		profiles = Profile.find(user_id)
		"#{profiles.first_name} #{profiles.last_name}"
	end

	def agent_name(user_id)
		user = User.find(user_id)
		profiles = Profile.where(distributor_id: user_id)
		"#{profiles.first_name} #{profiles.last_name}"
	end
	def agent_email(user_id)
		user = User.find(user_id)
		profiles = Profile.where(distributor_id: user_id)
		"#{user.email}"
	end
	def agent_phone(user_id)
		user = User.find(user_id)
		"#{user.profiles.mobile_phone}"
	end

	def adddres(user_id)
		user = User.find(user_id)

		"#{user.profile.address1} #{user.profile.address2} #{user.profile.city} #{user.profile.state} #{user.profile.country} #{user.profile.zipcode}"

	end

	def total_sales_per_day(date)
		total_sales_per_day = Warranty.where(sale_date: date).count(:client_id)
		unless total_sales_per_day == 0
			total_sales_per_day
		end
	end

	def total_sales_per_day_by_agent(date, user)
		total_sales_per_day = Warranty.where(sale_date: date, agent_id: user).count(:client_id)
		unless total_sales_per_day == 0
			total_sales_per_day
		end
	end

	def total_sales_per_day_by_agent_and_distributor(date, current_user)
		user = User.where(distributor_id: current_user)
		# print only the warranty thats is under distributor agent
		unless user == current_user
			total_sales_per_day = Warranty.where(sale_date: date, distributor_id: current_user).count(:client_id)
			unless total_sales_per_day == 0
				total_sales_per_day
			end
		end
	end

	def phone(user_id)
		user = User.find(user_id)
		"#{user.profile.mobile_phone}"
	end
	def email(user_id)
		user = User.find(user_id)
		"#{user.email}"
	end

	def product_cover
		dummy_photo =  asset_path("img/box.png").to_s
	end

	

	def photo_upload
		dummy_photo =  asset_path("img/dogs/image1.jpeg").to_s
	end

	def login_photo
		login_photo = asset_path("img/dogs/gruenheim.jpg").to_s
	end
	def signin_photo
		login_photo = asset_path("img/dogs/gruenheim.jpg").to_s
	end

	def flash_class(level)
	    case level
	        when 'notice' then "alert alert-dismissable alert-info"
	        when 'success' then "alert alert-dismissable alert-success"
	        when 'error' then "alert alert-dismissable alert-danger"
	        when 'alert' then "alert alert-dismissable alert-danger"
	    end
	end

	ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

	def bootstrap_flash(options = {})
	    flash_messages = []
	    flash.each do |type, message|
	      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
	      next if message.blank?

	      type = type.to_sym
	      type = :success if type == :notice
	      type = :danger  if type == :alert
	      type = :danger  if type == :error
	      next unless ALERT_TYPES.include?(type)

	      tag_class = options.extract!(:class)[:class]
	      tag_options = {
	        class: "alert alert-#{type} #{tag_class}",
	        	id: "success-alert"
	      }.merge(options)

	      close_button = content_tag(:button, raw("&times;"), type: "button", class: "close", "data-dismiss" => "alert")

	      Array(message).each do |msg|
	        text = content_tag(:div, close_button + msg, tag_options)
	        flash_messages << text if msg
	      end
	    end
	    flash_messages.join("\n").html_safe
	end

	def is_active_controller(controller_name, class_name = nil)
        if params[:controller] == controller_name
         class_name == nil ? "active" : class_name
        else
           nil
        end
    end

    def is_action_name(action_name, class_name = nil)
        if params[:action] == action_name
         class_name == nil ? "active" : class_name
        else
           nil
        end
    end

    # def is_active_action(action_name)
    #     params[:action] == action_name ? "active" : nil
    # end

    # def flash_class(level)
	    # case level
	    #     when :notice then "alert alert-info"
	    #     when :success then "alert alert-success"
	    #     when :error then "alert alert-danger"
	    #     when :alert then "alert alert-warning"
	    # end
	# end

end
