# require "spec_helper"
#
# RSpec::Matchers.define :allow do |*args|
#   match do |permission|
#     permission.allow?(*args).should be_true
#   end
# end
#
# describe Permission do
#   describe "as guest" do
#     subject { Permission.new(nil) }
#
#     # it { should allow("leagues", "index") }
#     # it { should allow("leagues", "show") }
#     # it { should_not allow("leagues", "new") }
#     # it { should_not allow("leagues", "create") }
#     # it { should_not allow("leagues", "edit") }
#     # it { should_not allow("leagues", "update") }
#     # it { should_not allow("leagues", "destroy") }
#     #
#     # it { should allow("sessions", "new") }
#     # it { should allow("sessions", "create") }
#     # it { should allow("sessions", "destroy") }
#     #
#     # it { should allow("users", "new") }
#     # it { should allow("users", "create") }
#     # it { should_not allow("users", "edit") }
#     # it { should_not allow("users", "update") }
#   end
#
#   describe "as admin" do
#     subject { Permission.new(build(:user, admin: true)) }
#
#     it { should allow("anything", "here") }
#   end
#
#   describe "as member" do
#     subject { Permission.new(build(:user, admin: false)) }
#
#     # it { should allow("leagues", "index") }
#     # it { should allow("leagues", "show") }
#     # it { should allow("leagues", "new") }
#     # it { should allow("leagues", "create") }
#     # it { should allow("leagues", "edit") }
#     # it { should allow("leagues", "update") }
#     # it { should_not allow("leagues", "destroy") }
#     #
#     # it { should allow("sessions", "new") }
#     # it { should allow("sessions", "create") }
#     # it { should allow("sessions", "destroy") }
#     #
#     # it { should allow("users", "new") }
#     # it { should allow("users", "create") }
#     # it { should allow("users", "edit") }
#     # it { should allow("users", "update") }
#   end
# end
