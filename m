From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] selftests: splice: override clean in lib.mk to fix warnings
Date: Tue, 25 Apr 2017 09:40:21 -0600
Message-ID: <20170425154023.1725-1-shuahkh@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-gpio@vger.kernel.org

Add override with EXTRA_CLEAN for lib.mk clean to fix the following
warnings from clean target run.

Makefile:8: warning: overriding recipe for target 'clean'
../lib.mk:55: warning: ignoring old recipe for target 'clean'

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
Changes since v1:
- simplified to use EXTRA_CLEAN based on Michael Ellerman's comments.

 tools/testing/selftests/splice/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/splice/Makefile b/tools/testing/selftests/splice/Makefile
index 559512c..9fc78e5 100644
--- a/tools/testing/selftests/splice/Makefile
+++ b/tools/testing/selftests/splice/Makefile
@@ -4,5 +4,4 @@ all: $(TEST_PROGS) $(EXTRA)
 
 include ../lib.mk
 
-clean:
-	rm -fr $(EXTRA)
+EXTRA_CLEAN := $(EXTRA)
-- 
2.9.3
