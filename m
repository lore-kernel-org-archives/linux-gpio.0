From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 4/9] pinctrl: Replace two seq_printf() calls by seq_puts() in
 pinconf_show_map()
Date: Tue, 2 May 2017 11:24:18 +0200
Message-ID: <68dee714-acb7-5c69-7764-3e302a335c38@users.sourceforge.net>
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
Date: Tue, 2 May 2017 09:52:50 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinconf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
index d37f98aafb4b..dfa782e19f37 100644
--- a/drivers/pinctrl/pinconf.c
+++ b/drivers/pinctrl/pinconf.c
@@ -244,10 +244,10 @@ void pinconf_show_map(struct seq_file *s, struct pinctrl_map const *map)
 
 	switch (map->type) {
 	case PIN_MAP_TYPE_CONFIGS_PIN:
-		seq_printf(s, "pin ");
+		seq_puts(s, "pin ");
 		break;
 	case PIN_MAP_TYPE_CONFIGS_GROUP:
-		seq_printf(s, "group ");
+		seq_puts(s, "group ");
 		break;
 	default:
 		break;
-- 
2.12.2
