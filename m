From: Thomas Richter <tmricht@linux.vnet.ibm.com>
Subject: [PATCH] selftests/gpio: Makefile deletes unnecessary files
Date: Mon, 12 Feb 2018 10:28:29 +0100
Message-ID: <20180212092829.33790-1-tmricht@linux.vnet.ibm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60148 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S933230AbeBLJ27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Feb 2018 04:28:59 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1C9Sjil132657
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 04:28:59 -0500
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2g30fv6ukx-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-gpio@vger.kernel.org>; Mon, 12 Feb 2018 04:28:58 -0500
Received: from localhost
        by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-gpio@vger.kernel.org> from <tmricht@linux.vnet.ibm.com>;
        Mon, 12 Feb 2018 09:28:50 -0000
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, brgl@bgdev.pl, bamvor.zhangjian@linaro.org
Cc: brueckner@linux.vnet.ibm.com, Thomas Richter <tmricht@linux.vnet.ibm.com>

The Makefile in selftests/gpio deletes several files
(../gpio*) which do not exist at all in directory selftests.
Instead they are located in directory
linux/tools/gpio/ and are built when the gpio test case is
built (in case they do not already exist).
Since they are located outside the selftests tree, do not
delete them.

Signed-off-by: Thomas Richter <tmricht@linux.vnet.ibm.com>
---
 tools/testing/selftests/gpio/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 1bbb47565c55..91a834f6af7b 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -3,11 +3,6 @@
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh $(BINARIES)
 BINARIES := gpio-mockup-chardev
-EXTRA_PROGS := ../gpiogpio-event-mon ../gpiogpio-hammer ../gpiolsgpio
-EXTRA_DIRS := ../gpioinclude/
-EXTRA_OBJS := ../gpiogpio-event-mon-in.o ../gpiogpio-event-mon.o
-EXTRA_OBJS += ../gpiogpio-hammer-in.o ../gpiogpio-utils.o ../gpiolsgpio-in.o
-EXTRA_OBJS += ../gpiolsgpio.o
 
 include ../lib.mk
 
@@ -15,7 +10,6 @@ all: $(BINARIES)
 
 override define CLEAN
 	$(RM) $(BINARIES) $(EXTRA_PROGS) $(EXTRA_OBJS)
-	$(RM) -r $(EXTRA_DIRS)
 endef
 
 CFLAGS += -O2 -g -std=gnu99 -Wall -I../../../../usr/include/
-- 
2.14.3

