require 'spec_helper'
require 'shared_context'

describe 'sudoers' do
  shared_examples 'debian-system' do |os, codename|
    let(:facts) {{
      :operatingsystem => os,
      :osfamily => 'Debian',
      :lsbdistcodename => codename,
    }}

    let(:params) {{
      :rules => {
        'john' => {}
      }
    }}

    it { should contain_package('sudo').with(
      :ensure => 'present'
    )}

    it { should contain_sudoers('john') }

  end

  context 'on debian-like system' do
    it_behaves_like 'debian-system', 'Debian', 'wheezy'
    it_behaves_like 'debian-system', 'Ubuntu', 'precise'
  end
end