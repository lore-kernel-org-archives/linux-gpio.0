From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/9] pinctrl: Combine two seq_puts() calls into one call in
 two functions
Date: Tue, 2 May 2017 11:22:45 +0200
Message-ID: <64ab3ba9-6cfa-fd59-976c-8f22b2b9a2c5@users.sourceforge.net>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:59125 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750767AbdEBJWt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 May 2017 05:22:49 -0400
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 22:42:13 +0200

Some text was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index 1a3fbdf81ecb..a14ae8601b39 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -307,9 +307,9 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 	struct pinctrl_dev *pctldev = s->private;
 	unsigned i, pin;
 
-	seq_puts(s, "Pin config settings per pin\n");
-	seq_puts(s, "Format: pin (name): configs\n");
-
+	seq_puts(s,
+		 "Pin config settings per pin\n"
+		 "Format: pin (name): configs\n");
 	mutex_lock(&pctldev->mutex);
 
 	/* The pin number can be retrived from the pin controller descriptor */
@@ -352,8 +352,9 @@ static int pinconf_groups_show(struct seq_file *s, void *what)
 	unsigned ngroups = pctlops->get_groups_count(pctldev);
 	unsigned selector = 0;
 
-	seq_puts(s, "Pin config settings per pin group\n");
-	seq_puts(s, "Format: group (name): configs\n");
+	seq_puts(s,
+		 "Pin config settings per pin group\n"
+		 "Format: group (name): configs\n");
 
 	while (selector < ngroups) {
 		const char *gname = pctlops->get_group_name(pctldev, selector);
-- 
2.12.2

