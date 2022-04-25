module LoginHelper
    # $validator = {
    #     :email => {
    #         { 'required': '', 'messages': 'Email is required!'},
    #         { max: 256, messages: 'Length Max is 256!' },
    #         { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/,messages: 'Email is format!'}
    #     }
    # }
    $validator = {
        'email_required' => {'required' => '', 'messages' => 'Email is required!'},
        'email_max'=> {'max' => 256, 'messages' => 'Length Max is 256!'},
        # 'email_regex'=> {'regex'=> /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, 'messages'=> 'Email is format!'}
    }
    def validate_login params
        params.select{ |k, v| puts v if k === 'email'}
    end

    # def checkRequired key, value
    #     if value == ''
    #         return key + '_' + 'required'
    #     end
    # end

    # def checkMax key, value, max
    #     if value.length > max
    #         return key+'_max'
    #     end
    # end
end
