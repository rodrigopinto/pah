module Pah
  class Template < Rails::Generators::Base
    def static_files
      File.join(TEMPLATE_ROOT, 'files')
    end

    def copy_static_file(path)
      remove_file path
      create_file path, File.read(File.join(static_files, path))
    end

    def will_you_like_to?(question)
      answer = ask("Will you like to #{question} [y,n]".red)
      case answer.downcase
      when 'yes', 'y'
        true
      when 'no', 'n'
        false
      else
        will_you_like_to?(question)
      end
    end

    def ask_unless_test(*params)
      ask(*params)
    end

    def git_commit(message)
      message = "#{message}\n\nGenerated by pah version #{Pah::VERSION}"
      git commit: "-qm '#{message}'"
    end
  end
end
