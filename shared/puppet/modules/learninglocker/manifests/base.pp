class learninglocker::base {
    group {
        'pkg':
            ensure => 'present';
    }

    user {
        ['w3learninglocker', 'w3admin']:
            ensure => 'present',
            managehome => true,
            groups => ['pkg'],
            require => Group['pkg'];
    }

    file {
        '/var/www/vhosts/learninglocker-dev.kent.ac.uk/writable/data/shared':
            ensure => directory,
            owner => 'w3learninglocker',
            require => File['/var/www/vhosts/learninglocker-dev.kent.ac.uk/writable/data'];
    }

    class {
        'webfarm::base': ;
    }

    webfarm::base::vhost {
        'learninglocker-dev.kent.ac.uk':
            public => false;
    }
}
