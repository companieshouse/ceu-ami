warn "Executing ceu_startup.pl...\n";
sleep 1;

# Extend @INC if needed
use lib qw(/home/ceu/MODULES);

warn @INC;
# Make sure we are in a sane environment.
$ENV{MOD_PERL} or die "not running under mod_perl!";

# Place common modules here to be pre-loaded by the mod_perl enabled server
use ModPerl::Registry;
use Socket;

### Recycle large Apache processes

use Apache2::SizeLimit;
$Apache2::SizeLimit::MAX_PROCESS_SIZE  = 50000; # 50MB
#$Apache2::SizeLimit::MIN_SHARE_SIZE    = 6000;  # 6MB
#$Apache2::SizeLimit::MAX_UNSHARED_SIZE = 5000;  # 5MB

$Apache2::SizeLimit::CHECK_EVERY_N_REQUESTS = 10;

# Set some ENV variables for Perl
#
warn "Setting Orcale Environment Variables\n";
$ENV{ORACLE_HOME}= "/usr/lib/oracle/11.2/client64/";
$ENV{LD_LIBRARY_PATH}= "/usr/lib/oracle/11.2/client64/lib";
$ENV{TNS_ADMIN}= "/usr/lib/oracle/11.2/client64/lib/";
$ENV{NLS_LANG}   = "ENGLISH_UNITED KINGDOM.UTF8";
$ENV{LC_ALL}     = "en_GB.UTF-8";

#$ENV{ORACLE_HOME}= "/usr/lib/oracle/11.2/client64/";
#$ENV{TNS_ADMIN}= "/usr/lib/oracle/11.2/client64/lib";
#$ENV{NLS_LANG}   = "ENGLISH_UNITED KINGDOM.UTF8";
#$ENV{LC_ALL}     = "en_GB.UTF-8";
#$ENV{NLS_COMP}   = "ANSI";
#$ENV{NLS_SORT}   = "BINARY_CI";
$ENV{HTTPS_CA_FILE} = '/etc/pki/tls/certs/ca-bundle.crt';
$ENV{HTTPS_CA_DIR} = '/etc/pki/tls/certs/';
$ENV{PERL_LWP_SSL_VERIFY_HOSTNAME}=1;
#$ENV{HTTPS_CA_FILE} = '/etc/pki/tls/certs/ca-bundle.trust.crt';
#$ENV{HTTPS_CA_FILE} = '/usr/share/ssl/certs/ca-bundle.crt';
warn "ceu_startup.pl - done\n";
1;