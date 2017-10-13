class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki
    
    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end
    
    def index?
        user.present?
    end
    
    def show?
        user.present?
    end
    
    def new?
        user.present?
    end
    
    def create?
        user.present?
    end
    
    def update?
        user.present?
    end
    
    def edit?
        user.present?
    end
    
    def destroy?
        user.admin? || wiki.user == user
    end
    
    class Scope
        attr_reader :user, :scope
        
        def initialize(user, scope)
            @user  = user
            @scope = scope
        end
        
        def resolve
            wikis = []
            if user.nil?
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if wiki.private == false
                        wikis << wiki
                    end
                end
            elsif user.admin?
                wikis = scope.all
            else
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if wiki.private == false || wiki.user == user
                        wikis << wiki
                        puts wikis
                    end
                end
            end
            wikis
        end
    end
end