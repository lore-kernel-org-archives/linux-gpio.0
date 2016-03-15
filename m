From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: mcp23s08: Fix clearing of interrupt.
Date: Tue, 15 Mar 2016 15:46:30 +0800
Message-ID: <1458027990-128142-2-git-send-email-preid@electromag.com.au>
References: <1458027990-128142-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [203.59.230.133] ([203.59.230.133]:40292 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-FAIL-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751548AbcCOHyb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 15 Mar 2016 03:54:31 -0400
In-Reply-To: <1458027990-128142-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

The mcp23s18 is configurable on clearing the interrupt on either reading
INTCAP or GPIO. Since driver reads INTCAP in IRQ and not the GPIO reg need
to set control byte for this mode.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-mcp23s08.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 72521d9..b42524f 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -49,6 +49,7 @@
 #	define IOCON_HAEN	(1 << 3)
 #	define IOCON_ODR	(1 << 2)
 #	define IOCON_INTPOL	(1 << 1)
+#	define IOCON_INTCC	(1)
 #define MCP_GPPU	0x06
 #define MCP_INTF	0x07
 #define MCP_INTCAP	0x08
@@ -680,6 +681,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (mirror)
 			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
 
+		if (type == MCP_TYPE_S18)
+			status |= IOCON_INTCC | (IOCON_INTCC << 8);
+
 		status = mcp->ops->write(mcp, MCP_IOCON, status);
 		if (status < 0)
 			goto fail;
-- 
1.8.3.1

