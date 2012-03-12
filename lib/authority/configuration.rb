module Authority
  class Configuration

    attr_accessor :default_strategy, :abilities, :authority_actions, :user_method, :logger

    def initialize
      @default_strategy = Proc.new { |able, authorizer, user|
        false
      }

      @abilities = {
        :create => 'creatable',
        :read   => 'readable',
        :update => 'updatable',
        :delete => 'deletable'
      }

      @authority_actions = {
        :index   => 'read',
        :show    => 'read',
        :new     => 'create',
        :create  => 'create',
        :edit    => 'update',
        :update  => 'update',
        :destroy => 'delete'
      }

      @user_method = :current_user

      @logger = defined?(Rails) ? Rails.logger : Logger.new(STDERR)
    end

  end
end
