From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 7/8] selftests: sync: override clean in lib.mk to fix warnings
Date: Fri, 21 Apr 2017 17:14:49 -0600
Message-ID: <dc66a97137df1b6a913463775466a96e0f3c13db.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42445
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1426544AbdDUXPJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 19:15:09 -0400
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Add override for lib.mk clean to fix the following warnings from clean
target run.

Makefile:24: warning: overriding recipe for target 'clean'
../lib.mk:55: warning: ignoring old recipe for target 'clean'

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/sync/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
index 87ac400..f7d250d 100644
--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -20,5 +20,6 @@ TESTS += sync_stress_merge.o
 
 sync_test: $(OBJS) $(TESTS)
 
-clean:
+override define CLEAN
 	$(RM) sync_test $(OBJS) $(TESTS)
+endef
-- 
2.9.3

