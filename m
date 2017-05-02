From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 5/9] pinctrl: Adjust five checks for null pointers
Date: Tue, 2 May 2017 11:25:07 +0200
Message-ID: <080f6ec0-7796-d802-7b64-8ea9b5488a7a@users.sourceforge.net>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 10:01:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index dfa782e19f37..f2168b6e3418 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -319,7 +319,7 @@ static int pinconf_pins_show(struct seq_file *s, void *what)
 		pin = pctldev->desc->pins[i].number;
 		desc = pin_desc_get(pctldev, pin);
 		/* Skip if we cannot search the pin */
-		if (desc == NULL)
+		if (!desc)
 			continue;
 
 		seq_printf(s, "pin %d (%s): ", pin, desc->name);
@@ -528,7 +528,7 @@ static ssize_t pinconf_dbg_config_write(struct file *file,
 
 	/* get arg 'device_name' */
 	token = strsep(&b, " ");
-	if (token == NULL)
+	if (!token)
 		return -EINVAL;
 	if (strlen(token) >= MAX_NAME_LEN)
 		return -EINVAL;
@@ -536,7 +536,7 @@ static ssize_t pinconf_dbg_config_write(struct file *file,
 
 	/* get arg 'state_name' */
 	token = strsep(&b, " ");
-	if (token == NULL)
+	if (!token)
 		return -EINVAL;
 	if (strlen(token) >= MAX_NAME_LEN)
 		return -EINVAL;
@@ -544,7 +544,7 @@ static ssize_t pinconf_dbg_config_write(struct file *file,
 
 	/* get arg 'pin_name' */
 	token = strsep(&b, " ");
-	if (token == NULL)
+	if (!token)
 		return -EINVAL;
 	if (strlen(token) >= MAX_NAME_LEN)
 		return -EINVAL;
@@ -552,7 +552,7 @@ static ssize_t pinconf_dbg_config_write(struct file *file,
 
 	/* get new_value of config' */
 	token = strsep(&b, " ");
-	if (token == NULL)
+	if (!token)
 		return -EINVAL;
 	if (strlen(token) >= MAX_NAME_LEN)
 		return -EINVAL;
-- 
2.12.2
