require_relative '../spec_helper'

describe 'php5', :type => :class do

    let(:title) {'php5'}

    it { should include_class('php5') }

    it do
        should contain_package('php5').with(
            'ensure' => 'latest'
        )
        should contain_exec('/bin/sed -i "s/^;date.timezone =/date.timezone = \'America\/Chicago\'/g" /etc/php5/apache2/php.ini')
        should contain_exec('/bin/sed -i "s/^short_open_tag = On/short_open_tag = Off/g" /etc/php5/apache2/php.ini')
    end
end
