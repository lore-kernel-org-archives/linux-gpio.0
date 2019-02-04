From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 -next 2/2] pinctrl: qcom: spmi-gpio: select IRQ_DOMAIN_HIERARCHY in Kconfig
Date: Mon,  4 Feb 2019 04:58:53 -0500
Message-ID: <20190204095853.12212-2-masneyb@onstation.org>
References: <20190204095853.12212-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204095853.12212-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, tglx@linutronix.de, marc.zyngier@arm.com
Cc: andy.gross@linaro.org, sboyd@kernel.org, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, broonie@kernel.org
List-Id: linux-gpio@vger.kernel.org

Select IRQ_DOMAIN_HIERARCHY for spmi-gpio in Kconfig since this driver
is now setup as a hierarchical IRQ chip.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v1:
- None

 drivers/pinctrl/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 836e9f3eae4c..93efbffcd3a4 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -137,6 +137,7 @@ config PINCTRL_QCOM_SPMI_PMIC
        select PINMUX
        select PINCONF
        select GENERIC_PINCONF
+       select IRQ_DOMAIN_HIERARCHY
        help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm GPIO and MPP blocks found in the Qualcomm PMIC's chips,
-- 
2.17.2
