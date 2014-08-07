module CommsHelper
	#TODO how do I keep these in sync with view
	P_WELCOMETXT = "pWelcomeText"
	P_WELCOMESLOGAN = "pWelcomeSlogan"
	P_LOGO = "pLogo"
	P_FRONTIMAGE = "pFrontImage"
	P_RESIDENTSIMAGE = "pResidentsImage"
	P_COMMONAREAIMAGE = "pCommonAreaImage"
	P_ROOMIMAGE = "pRoomImage"
	P_STAFFIMAGE = "pStaffImage"
	P_OWNERSIMAGE = "pOwnersImage"
	P_OUTDOORSPACE = "pOutdoorSpace"
	P_DESC = "pDesc"
	P_CONTACTNAME = "pContactName"
	P_EMAIL = "pEmail"
	P_PHONE = "pPhone"
	P_OWNERNAME ="pOwnerName"
	P_OWNERMSG ="pOwnerMessage"
	P_OWNEREXP ="pOwnerExperience"
	P_TESTIMONIAL1= "pTestimonial1"
	P_TESTIMONIAL2= "pTestimonial2"
	P_TESTIMONIAL3= "pTestimonial3"
	P_AMENITIES = "pAmenities"
	P_SERVICES = "pServices"
	P_STAFFDESCRIPTION = "pStaffDescription"
	P_COMMUNITYDESCRIPTION = "pCommunityDescription"
	P_RESIDENTSUMMARY = "pResidentSummary"
	P_RESIDENTSATTR = "pResidentAttributes"
	P_RESIDENTINTEREST = "pResidentInterest"
	P_RESIDENTFAITH = "pResidentFaith"
	P_RESIDENTCAREER = "pResidentCareer"
	P_COMMUNITYVIDEO = "pCommunityVideo"

	@@allowed_params = [P_WELCOMESLOGAN, P_WELCOMETXT,P_LOGO,P_DESC,P_CONTACTNAME,
						P_EMAIL,P_PHONE,P_OWNERNAME,P_OWNEREXP,
					    P_OWNERMSG,P_TESTIMONIAL1,P_TESTIMONIAL2,P_TESTIMONIAL3,
					    P_SERVICES,
						P_AMENITIES, P_COMMUNITYDESCRIPTION, P_STAFFDESCRIPTION,
						P_RESIDENTSUMMARY,P_RESIDENTSATTR, P_RESIDENTCAREER, P_RESIDENTFAITH, P_RESIDENTINTEREST]

	RESIDENT_FAITH = [ "Christian", "Catholic", "Jewish ", "Muslim", "Hindu ", "Buddhist", "Other"]
    RESIDENT_INTEREST = ["Music", "Art", "Reading", "Movies ", "Cards and Games", "Animals",
		      "Gardening", "Cooking ", "Opera", "Symphony", "Ballet", "Baseball",
		      "Basketball", "Football", "Golf", "Tennis", "Yoga"]
	RESIDENT_CAREER= ["Business Owners", "Educators ", "Musicians", "Administrators", "Homemakers", "Doctors"]
	RESIDENT_LANGUAGES= ["Spanish", "French", "Mandarin", "Cantonese", "Japanese", "German"]

	AMENITIES_LIST = ["Private Suites ", "Companion Suites", "Fully Furnished Suites", "Kitchens",
                        "Wheelchair Accommodating Bathrooms", "Private Dining Rooms", "Restaurant Style Dining",
                        "Café", "Wellness/Fitness Room", "Game Room", "Garden ", "Library", "Spa"]
	SERVICES_LIST = ["Activities of Daily Living Assistance", "Meal Preparation and Service",
			"Housekeeping", "Medication Management", "Transportation", "24-Hour Call System",
			"24-Hour Supervision", "Wellness Program", "Alzheimer’s Dementia Program ",
			"Rehabilitation Program", "Physical Therapy", "Respite Program", "Barber/Beautician"]

	def fill_property_info(params)
	  pin = {}
      params.each do |name, value|
        if 	@@allowed_params.include? name
          pin[name] = value
        end
      end
      return pin
    end

    def fill_default_pin(pin)
	    for param in @@allowed_params
	    	pin[param] ||= []
	    end
	    return pin
	end


end
