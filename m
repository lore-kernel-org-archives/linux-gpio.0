From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH] tools/gpio: Add .gitignore file
Date: Mon, 20 Feb 2017 09:01:01 -0500
Message-ID: <1487599261-19584-1-git-send-email-prarit@redhat.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45352 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753602AbdBTOBP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Feb 2017 09:01:15 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Add .gitignore file for untracked files in tools/gpio.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 tools/gpio/.gitignore | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 tools/gpio/.gitignore

diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
new file mode 100644
index 000000000000..4ded5504910b
--- /dev/null
+++ b/tools/gpio/.gitignore
@@ -0,0 +1,4 @@
+gpio-event-mon
+gpio-hammer
+include/
+lsgpio
-- 
1.8.3.1

