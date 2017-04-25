From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] selftests: sync: override clean in lib.mk to fix warnings
Date: Tue, 25 Apr 2017 09:40:22 -0600
Message-ID: <20170425154023.1725-2-shuahkh@osg.samsung.com>
References: <20170425154023.1725-1-shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52613
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1950700AbdDYPkc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 11:40:32 -0400
In-Reply-To: <20170425154023.1725-1-shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Add override with EXTRA_CLEAN for lib.mk clean to fix the following
warnings from clean target run.

Makefile:24: warning: overriding recipe for target 'clean'
../lib.mk:55: warning: ignoring old recipe for target 'clean'

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
Changes since v1:
- simplified to use EXTRA_CLEAN based on Michael Ellerman's comments.

 tools/testing/selftests/sync/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sync/Makefile b/tools/testing/selftests/sync/Makefile
index 87ac400..4981c6b 100644
--- a/tools/testing/selftests/sync/Makefile
+++ b/tools/testing/selftests/sync/Makefile
@@ -20,5 +20,4 @@ TESTS += sync_stress_merge.o
 
 sync_test: $(OBJS) $(TESTS)
 
-clean:
-	$(RM) sync_test $(OBJS) $(TESTS)
+EXTRA_CLEAN := sync_test $(OBJS) $(TESTS)
-- 
2.9.3

