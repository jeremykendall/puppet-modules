require_relative '../spec_helper'

describe 'php5::pkg', :type => :define do
    # This define allows an array of package names to be passed in. How do you
    # test that?
    let(:title) { 'php5-intl' }
    let(:params) { { 
        :name => 'php5-intl'
    } }

    it do
        should contain_package('php5-intl').with_ensure('latest')
    end
end
