From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 3/9] pinctrl: Combine five seq_printf() calls into one call in
 pinconf_dbg_config_print()
Date: Tue, 2 May 2017 11:23:34 +0200
Message-ID: <fe725663-d873-b8e4-f364-9abec47ba17e@users.sourceforge.net>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 22:52:29 +0200

Some data were put into a sequence by five separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index a14ae8601b39..d37f98aafb4b 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -441,12 +441,15 @@ static int pinconf_dbg_config_print(struct seq_file *s, void *d)
 	}
 
 	if (!found) {
-		seq_printf(s, "No config found for dev/state/pin, expected:\n");
-		seq_printf(s, "Searched dev:%s\n", dbg->dev_name);
-		seq_printf(s, "Searched state:%s\n", dbg->state_name);
-		seq_printf(s, "Searched pin:%s\n", dbg->pin_name);
-		seq_printf(s, "Use: modify config_pin <devname> "\
-				"<state> <pinname> <value>\n");
+		seq_printf(s,
+			   "No config found for dev/state/pin, expected:\n"
+			   "Searched dev:%s\n"
+			   "Searched state:%s\n"
+			   "Searched pin:%s\n"
+			   "Use: modify config_pin <devname> <state> <pinname> <value>\n",
+			   dbg->dev_name,
+			   dbg->state_name,
+			   dbg->pin_name);
 		goto exit;
 	}
 
-- 
2.12.2
