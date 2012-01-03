GIT_URL="git://github.com"
HTTP_URL="http://github.com"
CITRIX_BRANCH="everett"

set_cache_hint()
{
  echo "
You need one of these:

git config --add --global citrix.cache \\
    http://gold.eng.hq.xensource.com/openstack_build_cache/repos

git config --add --global citrix.cache \\
    http://bethany.eng.citrite.net/openstack_build_cache/repos

git config --add --global citrix.cache \\
    http://banv-openstack-jenkins.citrite.net/openstack_build_cache/repos


You will also want to do this if git:// URLs are blocked on your machine:

git config --add --global citrix.gitprotocol false

" >&2
  exit 1
}

# Heuristic for guessing whether this is an OpenStack repo or a Citrix-only
# one.
is_openstack()
{
  master=$(git branch -a | grep master || true)
  [ "$master" ] && return 0 || return 1
}
