From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH][next] pinctrl: actions: Fix Kconfig dependency and help text
Date: Tue,  1 May 2018 08:30:47 +0530
Message-ID: <20180501030047.305-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, afaerber@suse.de, rdunlap@infradead.org, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: linux-gpio@vger.kernel.org

1. Fix Kconfig dependency for Actions Semi S900 pinctrl driver which
generates below warning in x86:

WARNING: unmet direct dependencies detected for PINCTRL_OWL
  Depends on [n]: PINCTRL [=y] && (ARCH_ACTIONS || COMPILE_TEST [=n]) && OF [=n]
  Selected by [y]:
  - PINCTRL_S900 [=y] && PINCTRL [=y]

2. Add help text for OWL pinctrl driver

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pinctrl/actions/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/actions/Kconfig b/drivers/pinctrl/actions/Kconfig
index 1c7309c90f0d..ede97cdbbc12 100644
--- a/drivers/pinctrl/actions/Kconfig
+++ b/drivers/pinctrl/actions/Kconfig
@@ -1,12 +1,14 @@
 config PINCTRL_OWL
-	bool
+	bool "Actions Semi OWL pinctrl driver"
 	depends on (ARCH_ACTIONS || COMPILE_TEST) && OF
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
+	help
+	  Say Y here to enable Actions Semi OWL pinctrl driver
 
 config PINCTRL_S900
 	bool "Actions Semi S900 pinctrl driver"
-	select PINCTRL_OWL
+	depends on PINCTRL_OWL
 	help
 	  Say Y here to enable Actions Semi S900 pinctrl driver
-- 
2.14.1
