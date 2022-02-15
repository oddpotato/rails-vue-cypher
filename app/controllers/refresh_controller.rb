class RefreshController < ApplicationController

    before_action :authorize_refresh_by_access_request!

    def create
        session = JWTSessions::Session.new(payload: claimless_payload, refresh_by_access_allowed: true)
        tokens = session.refresh_by_access_allowed do
            raise JWTSessions::Error::Unauthorized, "Something's not right"
        end

        response.set_cookie(JWTSessions.access_cookie,
                            value: tokens[:access],
                            httpsonly: true,
                            secure: Rails.env.production?)

        render json: { csrf: [:csrf] }
    end
end
