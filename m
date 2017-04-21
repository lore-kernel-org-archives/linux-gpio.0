From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 6/8] selftests: splice: override clean in lib.mk to fix warnings
Date: Fri, 21 Apr 2017 17:14:48 -0600
Message-ID: <18f3784fe7bf463595f7261fb4e8e9fd6548b0d5.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42432
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1426563AbdDUXPR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 19:15:17 -0400
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Add override for lib.mk clean to fix the following warnings from clean
target run.

Makefile:8: warning: overriding recipe for target 'clean'
../lib.mk:55: warning: ignoring old recipe for target 'clean'

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/splice/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/splice/Makefile b/tools/testing/selftests/splice/Makefile
index 559512c..3f967ba 100644
--- a/tools/testing/selftests/splice/Makefile
+++ b/tools/testing/selftests/splice/Makefile
@@ -4,5 +4,6 @@ all: $(TEST_PROGS) $(EXTRA)
 
 include ../lib.mk
 
-clean:
+override define CLEAN
 	rm -fr $(EXTRA)
+endef
-- 
2.9.3

