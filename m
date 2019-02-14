From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH -next 1/3] spmi: pmic-arb: select IRQ_DOMAIN_HIERARCHY in Kconfig
Date: Wed, 13 Feb 2019 20:36:39 -0500
Message-ID: <20190214013641.9740-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: sboyd@kernel.org, lee.jones@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Select IRQ_DOMAIN_HIERARCHY for pmic-arb in Kconfig since this driver
uses the version 2 IRQ interfaces. IRQ_DOMAIN_HIERARCHY selects
IRQ_DOMAIN, so it can be removed from here.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
This addresses a build failure found by make randconfig in linux-next:
https://lore.kernel.org/lkml/fb0508f1-131d-ff17-9b5d-123ec75275dd@infradead.org/

 drivers/spmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index 0d3b70b3bda8..d48ed7c2c6c4 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -12,7 +12,7 @@ if SPMI
 
 config SPMI_MSM_PMIC_ARB
 	tristate "Qualcomm MSM SPMI Controller (PMIC Arbiter)"
-	select IRQ_DOMAIN
+	select IRQ_DOMAIN_HIERARCHY
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	default ARCH_QCOM
-- 
2.17.2
