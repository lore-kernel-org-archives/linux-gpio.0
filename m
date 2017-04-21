From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 0/8] Fix clean target warnings
Date: Fri, 21 Apr 2017 17:14:42 -0600
Message-ID: <cover.1492815938.git.shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42321
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1042829AbdDUXO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 19:14:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, dvhart@infradead.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, viro@zeniv.linux.org.uk, emilio.lopez@collabora.co.uk, mingo@kernel.org, luto@kernel.org, dave.hansen@linux.intel.com, dsafonov@virtuozzo.com, rkrcmar@redhat.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

This patch series consists of changes to lib.mk to allow overriding
common clean target from Makefiles. This fixes warnings when clean
overriding and ignoring warnings. Also fixes splice clean target
removing a script that runs the test from its clean target.

Shuah Khan (8):
  selftests: splice: fix clean target to not remove
    default_file_splice_read.sh
  selftests: lib.mk: define CLEAN macro to allow Makefiles to override
    clean
  selftests: futex: override clean in lib.mk to fix warnings
  selftests: gpio: override clean in lib.mk to fix warnings
  selftests: powerpc: override clean in lib.mk to fix warnings
  selftests: splice: override clean in lib.mk to fix warnings
  selftests: sync: override clean in lib.mk to fix warnings
  selftests: x86: override clean in lib.mk to fix warnings

 tools/testing/selftests/futex/Makefile   | 3 ++-
 tools/testing/selftests/gpio/Makefile    | 3 ++-
 tools/testing/selftests/lib.mk           | 6 +++++-
 tools/testing/selftests/powerpc/Makefile | 3 ++-
 tools/testing/selftests/splice/Makefile  | 5 +++--
 tools/testing/selftests/sync/Makefile    | 3 ++-
 tools/testing/selftests/x86/Makefile     | 3 ++-
 7 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.9.3

