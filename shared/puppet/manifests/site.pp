node 'default'
{
    include learninglocker::base

    service {
        ['nginx', 'crond', 'php56-php-fpm']:
            enable => true;
    }

    file {
        '/etc/nginx/conf.d/default.conf':
            ensure => absent;

        '/etc/nginx/conf.d/learninglocker-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/learninglocker-dev.kent.ac.uk.conf';

        '/var/www/vhosts/learninglocker-dev.kent.ac.uk/public':
            ensure => link,
            target => '/data/learninglocker/public';

        '/opt/remi/php56/root/etc/php-fpm.d/www.conf':
            ensure => absent;

        '/opt/remi/php56/root/etc/php-fpm.d/learninglocker-dev.kent.ac.uk.conf':
            ensure => present,
            source => 'puppet:///modules/webfarm/learninglocker-pool.conf';
    }
}
