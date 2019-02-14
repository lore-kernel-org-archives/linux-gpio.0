From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH -next 2/3] mfd: pm8xxx: select IRQ_DOMAIN_HIERARCHY in Kconfig
Date: Wed, 13 Feb 2019 20:36:40 -0500
Message-ID: <20190214013641.9740-2-masneyb@onstation.org>
References: <20190214013641.9740-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214013641.9740-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: sboyd@kernel.org, lee.jones@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Select IRQ_DOMAIN_HIERARCHY for pm8xxx in Kconfig since this driver uses
the version 2 IRQ interfaces. IRQ_DOMAIN_HIERARCHY selects IRQ_DOMAIN,
so it can be removed from here.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Linus: For your ib-qcom-ssbi branch.

 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index c9ffe8efcbb6..8f316a820b38 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -927,7 +927,7 @@ config UCB1400_CORE
 config MFD_PM8XXX
 	tristate "Qualcomm PM8xxx PMIC chips driver"
 	depends on (ARM || HEXAGON || COMPILE_TEST)
-	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
 	select MFD_CORE
 	select REGMAP
 	help
-- 
2.17.2
