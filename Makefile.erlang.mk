# See LICENSE for licensing information.

PROJECT = cowboyku

# Options.

COMPILE_FIRST = cowboyku_middleware cowboyku_sub_protocol
CT_SUITES = eunit http spdy ws
PLT_APPS = crypto public_key ssl

# Dependencies.

DEPS = cowlib ranch
dep_cowlib = pkg://cowlib 2.1.0
dep_ranch = pkg://ranch 0.9.0

TEST_DEPS = ct_helper gun
dep_ct_helper = https://github.com/extend/ct_helper.git master
dep_gun = pkg://gun master

# Standard targets.

include erlang.mk

# Extra targets.

.PHONY: autobahn

autobahn: clean clean-deps deps app build-tests
	@mkdir -p logs/
	@$(CT_RUN) -suite autobahn_SUITE
