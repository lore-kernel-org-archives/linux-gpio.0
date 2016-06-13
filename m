From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 2/2] pinctrl: as3722: convert PINCTRL_AS3722 from bool to tristate
Date: Mon, 13 Jun 2016 17:10:22 -0400
Message-ID: <20160613211022.32033-3-paul.gortmaker@windriver.com>
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

config PINCTRL_AS3722
        bool "Pinctrl and GPIO driver for ams AS3722 PMIC"

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
index a92e61870024..2f805014cc21 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -35,7 +35,7 @@ config PINCTRL_ADI2
 	  machine and arch are selected to build.
 
 config PINCTRL_AS3722
-	bool "Pinctrl and GPIO driver for ams AS3722 PMIC"
+	tristate "Pinctrl and GPIO driver for ams AS3722 PMIC"
 	depends on MFD_AS3722 && GPIOLIB
 	select PINMUX
 	select GENERIC_PINCONF
-- 
2.8.4
