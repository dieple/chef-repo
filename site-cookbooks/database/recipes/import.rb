#
# Cookbook Name:: database
# Recipe:: import
#
# Copyright 2012, Adam Brett. All Rights Reserved.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "database::mysql"

# Store this in a variable so we don't keep repeating it
mysql_connection_info = {
    :host => "localhost",
    :username => 'root',
    # automatically get this from the override_attributes call!
    :password => node['mysql']['server_root_password']
}

# my_database = database name
mysql_database 'my_database' do
  connection mysql_connection_info
  action :create
end

# import an sql dump from your app_root/data/dump.sql to the my_database database
execute "import" do
  command "mysql -u root -p\"#{node['mysql']['server_root_password']}\" my_database < /srv/site/data/dump.sql"
  action :run
end

# this isn't really necessary, as we're using root and not creating a database
# user, but I'm including it and commenting it out so you can see what it looks like
# mysql_database_user 'my_user' do
#  connection mysql_connection_info
#  database_name 'my_database'
#  action :grant
# end
