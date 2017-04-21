From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 5/8] selftests: powerpc: override clean in lib.mk to fix warnings
Date: Fri, 21 Apr 2017 17:14:47 -0600
Message-ID: <7afeb848e3c8c075702b7ccc1b17f6a65a4c3aa1.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-gpio@vger.kernel.org

Add override for lib.mk clean to fix the following warnings from clean
target run.

Makefile:63: warning: overriding recipe for target 'clean'
../lib.mk:55: warning: ignoring old recipe for target 'clean'

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/powerpc/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 1c5d057..8d9fc64 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -59,12 +59,13 @@ override define EMIT_TESTS
 	done;
 endef
 
-clean:
+override define CLEAN
 	@for TARGET in $(SUB_DIRS); do \
 		BUILD_TARGET=$$OUTPUT/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET clean; \
 	done;
 	rm -f tags
+endef
 
 tags:
 	find . -name '*.c' -o -name '*.h' | xargs ctags
-- 
2.9.3
