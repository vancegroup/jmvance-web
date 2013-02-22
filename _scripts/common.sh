echo "* common.sh"
if [ -z "${COMMON_RUN_FLAG}" ]; then
	echo "** first time for common.sh"
	if [ -z "${DOMAIN}" -o \
	     -z "${WEBROOT}" -o \
	     -z "${FILEROOT}" -o \
	     -z "${HTACCESS}" -o \
	     -z "${CONFIG}" ]; then
		echo "Must source a configuration file using run-with-config!" >&2; exit 1
	fi

	if [ -z "${BASH_VERSION}" ]; then
		echo "Make sure that $(readlink -f $0) is using bash!" >&2
		exit 1
	fi

	export REPOROOT=$(cd $(dirname "${BASH_SOURCE}") && cd .. && pwd)
	export SCRIPTS=${REPOROOT}/_scripts
	export LUASCRIPTS=${SCRIPTS}/lua
	export DESCRIBE=${SCRIPTS}/describe

	new_lua_loc=${SCRIPTS}/config/?.lua
	[ -z "${LUA_PATH}" ] && export LUA_PATH=$new_lua_loc || export LUA_PATH=$new_lua_loc:${LUA_PATH}
	export PATH=${SCRIPTS}:${LUASCRIPTS}:$PATH

	export COMMON_RUN_FLAG=true
fi
