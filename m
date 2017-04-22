From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH 0/2] fixes to clean up goip generates files and gitignore
Date: Fri, 21 Apr 2017 18:12:59 -0600
Message-ID: <cover.1492819732.git.shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:42809
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1426707AbdDVANG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2017 20:13:06 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

This two patch series fixes gpio clean target to clean all generated
files and add them to gitignore.

Shuah Khan (2):
  selftests: add gpio generated files to .gitignore
  selftests: gpio: fix clean target to remove all generated files and
    dirs

 tools/testing/selftests/.gitignore    | 4 ++++
 tools/testing/selftests/gpio/Makefile | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.9.3

