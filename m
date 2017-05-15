From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 14/14] pinctrl: mcp23s08: fix comment for mcp23s08_platform_data.base
Date: Mon, 15 May 2017 11:24:38 +0200
Message-ID: <20170515092438.13076-15-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59894 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760622AbdEOJZc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 May 2017 05:25:32 -0400
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>

The comment does not match the driver, which actually supports
automatic assignment. Fix this by updating the comment.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 include/linux/spi/mcp23s08.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
index 4354beefd584..82d96a346e6f 100644
--- a/include/linux/spi/mcp23s08.h
+++ b/include/linux/spi/mcp23s08.h
@@ -7,11 +7,11 @@ struct mcp23s08_platform_data {
 	 */
 	u32 spi_present_mask;
 
-	/* "base" is the number of the first GPIO.  Dynamic assignment is
-	 * not currently supported, and even if there are gaps in chip
-	 * addressing the GPIO numbers are sequential .. so for example
-	 * if only slaves 0 and 3 are present, their GPIOs range from
-	 * base to base+15 (or base+31 for s17 variant).
+	/* "base" is the number of the first GPIO or -1 for dynamic
+	 * assignment. If there are gaps in chip addressing the GPIO
+	 * numbers are sequential .. so for example if only slaves 0
+	 * and 3 are present, their GPIOs range from base to base+15
+	 * (or base+31 for s17 variant).
 	 */
 	unsigned	base;
 };
-- 
2.11.0

