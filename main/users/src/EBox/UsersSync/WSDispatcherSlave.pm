# Copyright (C) 2012-2013 Zentyal S.L.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

use strict;
use warnings;

package EBox::UsersSync::WSDispatcherSlave;

# Class: EBox::UsersSync::WSDispatcherSlave
#
#      A SOAP::Lite handle called by apache-perl (mod_perl) everytime
#      a SOAP service is required.
#

use EBox;

use SOAP::Transport::HTTP;

EBox::init();

my $server = SOAP::Transport::HTTP::Apache
  ->dispatch_with(
      { 'urn:Users/Slave' => 'EBox::UsersSync::SOAPSlave' }
     );

# Method: handler
#
#     Handle the HTTP request
#
sub handler
{
    # Currently connection is just once basis
    $server->handler(@_);
}

1;
