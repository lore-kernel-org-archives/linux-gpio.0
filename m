From: Shuah Khan <shuahkh@osg.samsung.com>
Subject: [PATCH] tools: gpio add .gitignore for generated files
Date: Thu,  5 Jan 2017 14:32:36 -0700
Message-ID: <20170105213236.15562-5-shuahkh@osg.samsung.com>
References: <20170105213236.15562-1-shuahkh@osg.samsung.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:44826
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S966672AbdAEVlM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jan 2017 16:41:12 -0500
In-Reply-To: <20170105213236.15562-1-shuahkh@osg.samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: Shuah Khan <shuahkh@osg.samsung.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org

Add .gitignore for generated files.

Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
---
 tools/gpio/.gitignore | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 tools/gpio/.gitignore

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
new file mode 100644
index 0000000..767ad24
--- /dev/null
+++ b/tools/gpio/.gitignore
@@ -0,0 +1,4 @@
+gpio-event-mon
+gpio-hammer
+lsgpio
+include
-- 
2.7.4

