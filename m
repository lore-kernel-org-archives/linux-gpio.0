From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] selftests: gpio add .gitignore for generated files
Date: Thu,  5 Jan 2017 14:32:32 -0700
Message-ID: <20170105213236.15562-1-shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:44824
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S964850AbdAEVlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jan 2017 16:41:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: shuah@kernel.org, bamvor.zhangjian@linaro.org
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kselftest@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Add .gitignore for generated files

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/testing/selftests/gpio/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tools/testing/selftests/gpio/.gitignore

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
new file mode 100644
index 0000000..7d14f74
--- /dev/null
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -0,0 +1 @@
+gpio-mockup-chardev
-- 
2.7.4

