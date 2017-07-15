<?php

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}

$aliases['local'] = array(
  'site' => 'clarku',
  'root' => '/var/www/project/clarku/docroot',
  '%files' => 'sites/local.clarku.edu/files',
  'uri' => 'local.clarku.edu:10063',
);


// Site clarku, environment dev
$aliases['dev'] = array(
  'root' => '/var/www/html/clarku.dev/docroot',
  'ac-site' => 'clarku',
  'ac-env' => 'dev',
  'ac-realm' => 'prod',
  'uri' => 'clarkudev.prod.acquia-sites.com',
  'remote-host' => 'clarkudev.ssh.prod.acquia-sites.com',
  'remote-user' => 'clarku.dev',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['dev.livedev'] = array(
  'parent' => '@clarku.dev',
  'root' => '/mnt/gfs/clarku.dev/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site clarku, environment prod
$aliases['prod'] = array(
  'root' => '/var/www/html/clarku.prod/docroot',
  'ac-site' => 'clarku',
  'ac-env' => 'prod',
  'ac-realm' => 'prod',
  'uri' => 'clarku.prod.acquia-sites.com',
  'remote-host' => 'clarku.ssh.prod.acquia-sites.com',
  'remote-user' => 'clarku.prod',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['prod.livedev'] = array(
  'parent' => '@clarku.prod',
  'root' => '/mnt/gfs/clarku.prod/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site clarku, environment ra
$aliases['ra'] = array(
  'root' => '/var/www/html/clarku.ra/docroot',
  'ac-site' => 'clarku',
  'ac-env' => 'ra',
  'ac-realm' => 'prod',
  'uri' => 'clarkura.prod.acquia-sites.com',
  'remote-host' => 'clarkura.ssh.prod.acquia-sites.com',
  'remote-user' => 'clarku.ra',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['ra.livedev'] = array(
  'parent' => '@clarku.ra',
  'root' => '/mnt/gfs/clarku.ra/livedev/docroot',
);

if (!isset($drush_major_version)) {
  $drush_version_components = explode('.', DRUSH_VERSION);
  $drush_major_version = $drush_version_components[0];
}
// Site clarku, environment test
$aliases['test'] = array(
  'root' => '/var/www/html/clarku.test/docroot',
  'ac-site' => 'clarku',
  'ac-env' => 'test',
  'ac-realm' => 'prod',
  'uri' => 'clarkustg.prod.acquia-sites.com',
  'remote-host' => 'clarkustg.ssh.prod.acquia-sites.com',
  'remote-user' => 'clarku.test',
  'path-aliases' => array(
    '%drush-script' => 'drush' . $drush_major_version,
  )
);
$aliases['test.livedev'] = array(
  'parent' => '@clarku.test',
  'root' => '/mnt/gfs/clarku.test/livedev/docroot',
);
