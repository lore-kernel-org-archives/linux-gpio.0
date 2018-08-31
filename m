From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 1/5] gpio: davinci: Remove unused member of davinci_gpio_controller
Date: Fri, 31 Aug 2018 14:13:22 -0500
Message-ID: <20180831191326.25106-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>
List-Id: linux-gpio@vger.kernel.org

This was added as part of the patch in the fixes below, but was
not needed or used, remove this here.

Fixes: 8e11047b8f3c ("gpio: davinci: Add support for multiple GPIO controllers")
Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 include/linux/platform_data/gpio-davinci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/platform_data/gpio-davinci.h b/include/linux/platform_data/gpio-davinci.h
index 57a5a35e0073..b8e4957e7568 100644
--- a/include/linux/platform_data/gpio-davinci.h
+++ b/include/linux/platform_data/gpio-davinci.h
@@ -43,7 +43,6 @@ struct davinci_gpio_controller {
 	void __iomem		*regs[MAX_REGS_BANKS];
 	int			gpio_unbanked;
 	int			irqs[MAX_INT_PER_BANK];
-	unsigned int		base;
 };
 
 /*
-- 
2.18.0
