From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] gpio: sch311x: Slightly refactor sch311x_detect for better
 readability
Date: Tue, 15 Apr 2014 10:15:27 +0800
Message-ID: <1397528127.6965.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:65008 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751192AbaDOCPd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Apr 2014 22:15:33 -0400
Received: by mail-vc0-f177.google.com with SMTP id if17so8271209vcb.22
        for <linux-gpio@vger.kernel.org>; Mon, 14 Apr 2014 19:15:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bruno Randolf <br1@einfach.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-sch311x.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 0357387..f942b80 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -327,14 +327,22 @@ static int __init sch311x_detect(int sio_config_port, unsigned short *addr)
 	if (err)
 		return err;
 
-	/* Check device ID. We currently know about:
-	 * SCH3112 (0x7c), SCH3114 (0x7d), and SCH3116 (0x7f). */
+	/* Check device ID. */
 	reg = sch311x_sio_inb(sio_config_port, 0x20);
-	if (!(reg == 0x7c || reg == 0x7d || reg == 0x7f)) {
+	switch (reg) {
+	case 0x7c: /* SCH3112 */
+		dev_id = 2;
+		break;
+	case 0x7d: /* SCH3114 */
+		dev_id = 4;
+		break;
+	case 0x7f: /* SCH3116 */
+		dev_id = 6;
+		break;
+	default:
 		err = -ENODEV;
 		goto exit;
 	}
-	dev_id = reg == 0x7c ? 2 : reg == 0x7d ? 4 : 6;
 
 	/* Select logical device A (runtime registers) */
 	sch311x_sio_outb(sio_config_port, 0x07, 0x0a);
-- 
1.8.3.2



