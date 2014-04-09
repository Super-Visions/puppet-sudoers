require 'spec_helper'

describe 'sudoers' do
  shared_examples 'debian-system' do |os, codename|
    let(:facts) {{
      :operatingsystem => os,
      :osfamily => 'Debian',
      :lsbdistcodename => codename,
    }}

    it { should contain_package('sudo').with(
      :ensure => 'present'
    )}

  end

  context 'on debian-like system' do
    it_behaves_like 'debian-system', 'Debian', 'wheezy'
    it_behaves_like 'debian-system', 'Ubuntu', 'precise'
  end
end