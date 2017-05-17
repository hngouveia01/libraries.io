module RepositoryIssue
  class Base
    attr_reader :issue

    def initialize(issue)
      @issue = issue
    end

    def self.update_from_host(repo_full_name, issue_number, token = nil)
      issue_hash = self.fetch_issue(repo_full_name, issue_number, token)
      create_from_hash(repo_full_name, issue_hash, token)
    end

    private

    def api_client(token = nil)
      self.class.api_client(token)
    end
  end
end
