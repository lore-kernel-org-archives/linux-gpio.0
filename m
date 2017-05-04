From: Marek Vasut <marex@denx.de>
Subject: [PATCH] gpio: mcp23s08: Populate subnodes
Date: Thu,  4 May 2017 12:30:50 +0200
Message-ID: <20170504103050.10726-1-marex@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:43636 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751609AbdEDKa7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2017 06:30:59 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>

The MCP23S08 driver can have OF subnodes which bind ie. LEDs to the
expander pins. Populate those subnodes so that the drivers get bound
to them.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 drivers/gpio/gpio-mcp23s08.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 2a57d024481d..8d11fa715028 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -682,6 +682,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (ret)
 			goto fail;
 	}
+
+	of_platform_populate(mcp->chip.of_node, of_default_bus_match_table,
+			     NULL, dev);
+
 fail:
 	if (ret < 0)
 		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
-- 
2.11.0

