From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 1/8] selftests: splice: fix clean target to not remove default_file_splice_read.sh
Date: Fri, 21 Apr 2017 17:14:43 -0600
Message-ID: <92c807c32e8e3a06e37ce977e5027f801fc21684.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42347
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1042833AbdDUXO6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 19:14:58 -0400
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
In-Reply-To: <cover.1492815938.git.shuahkh@osg.samsung.com>
References: <cover.1492815938.git.shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

splice clean target removes the shell script default_file_splice_read.sh
that runs the splice test. Fix it to not remove this file.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/splice/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/splice/Makefile b/tools/testing/selftests/splice/Makefile
index de51f43..559512c 100644
--- a/tools/testing/selftests/splice/Makefile
+++ b/tools/testing/selftests/splice/Makefile
@@ -5,4 +5,4 @@ all: $(TEST_PROGS) $(EXTRA)
 include ../lib.mk
 
 clean:
-	rm -fr $(TEST_PROGS) $(EXTRA)
+	rm -fr $(EXTRA)
-- 
2.9.3

