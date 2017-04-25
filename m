From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH v2] selftests: x86: override clean in lib.mk to fix warnings
Date: Tue, 25 Apr 2017 09:40:23 -0600
Message-ID: <20170425154023.1725-3-shuahkh@osg.samsung.com>
References: <20170425154023.1725-1-shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52622
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1950707AbdDYPkg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 11:40:36 -0400
In-Reply-To: <20170425154023.1725-1-shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Add override with EXTRA_CLEAN for lib.mk clean to fix the following
warnings from clean target run.

Makefile:44: warning: overriding recipe for target 'clean'
../lib.mk:55: warning: ignoring old recipe for target 'clean'

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
Changes since v1:
- simplified to use EXTRA_CLEAN based on Michael Ellerman's comments.

 tools/testing/selftests/x86/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 38e0a9c..97f187e 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -40,8 +40,7 @@ all_32: $(BINARIES_32)
 
 all_64: $(BINARIES_64)
 
-clean:
-	$(RM) $(BINARIES_32) $(BINARIES_64)
+EXTRA_CLEAN := $(BINARIES_32) $(BINARIES_64)
 
 $(BINARIES_32): $(OUTPUT)/%_32: %.c
 	$(CC) -m32 -o $@ $(CFLAGS) $(EXTRA_CFLAGS) $^ -lrt -ldl -lm
-- 
2.9.3

