require 'stringio'

namespace :dotgpg do
  desc 'Decrypt and upload gpg files'
  task :env do
    on roles(:app) do
      dotenv = StringIO.new
      decrypted_env = Array(fetch(:dotgpg_files, ['.env.gpg', ".env.#{fetch(:stage)}.gpg"])).map do |file|
        `bundle exec dotgpg cat #{file}` if File.exist?(file)
      end.compact.join("\n")

      next if decrypted_env.empty?
      dotenv << decrypted_env

      Array(fetch(:capistrano_export, %w[shared_path application])).map do |n|
        dotenv << "CAPISTRANO_#{n.upcase}=#{fetch(n.to_sym) || send(n.to_sym)}\n"
      end
      dotenv.rewind
      upload! dotenv, "#{shared_path}/.env"
    end
  end
end

# Run dotgpg:env if file not exists on remote host
namespace :deploy do
  before :check, :check_env do
    on roles(:app) do
      invoke('dotgpg:env') unless test("[ -f #{shared_path}/.env]")
    end
  end
end
