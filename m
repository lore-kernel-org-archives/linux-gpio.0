From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/2] pinctrl: palmas: convert PINCTRL_PALMAS from bool to tristate
Date: Mon, 13 Jun 2016 17:10:21 -0400
Message-ID: <20160613211022.32033-2-paul.gortmaker@windriver.com>
References: <20160613211022.32033-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160613211022.32033-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

config PINCTRL_PALMAS
        bool "Pinctrl driver for the PALMAS Series MFD devices"

...meaning that it currently is not being built as a module by anyone.

During an audit for non-modular drivers using modular infrastructure
this driver showed up.

But rather than demodularize it, Laxman indicated that it would be
prefereable to instead convert the driver option to tristate.

This does that, and confirms that it will compile and modpost as
such.  However, since I do not have the hardware to confirm that
no new runtime issues exist when modular, that remains untested.

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ea25eeeceef1..a92e61870024 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -218,7 +218,7 @@ config PINCTRL_MAX77620
 	  open drain, FPS slots etc.
 
 config PINCTRL_PALMAS
-	bool "Pinctrl driver for the PALMAS Series MFD devices"
+	tristate "Pinctrl driver for the PALMAS Series MFD devices"
 	depends on OF && MFD_PALMAS
 	select PINMUX
 	select GENERIC_PINCONF
-- 
2.8.4
