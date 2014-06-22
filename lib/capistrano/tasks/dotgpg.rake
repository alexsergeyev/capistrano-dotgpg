require 'stringio'

namespace :dotgpg do
  desc "Decrypt and upload gpg files"
  task :env do
    on roles(:app) do
      dotenv = StringIO.new
      Array(fetch(:dotgpg_files, [".env.gpg", ".env.#{fetch(:stage)}.gpg"])).each do |file|
        dotenv <<  %x[bundle exec dotgpg cat #{file}] if File.exists?(file)
      end

      Array(fetch(:capistrano_export, %w(shared_path application))).map do |n|
        dotenv << "CAPISTRANO_#{n.upcase}=#{fetch(n.to_sym) || self.send(n.to_sym)}\n"
      end
      dotenv.rewind
      upload! dotenv, "#{shared_path}/.env"
    end
  end
end
