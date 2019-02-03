From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH -next 2/2] pinctrl: qcom: spmi-gpio: select
 IRQ_DOMAIN_HIERARCHY in Kconfig
Date: Sun,  3 Feb 2019 07:31:31 -0500
Message-ID: <20190203123131.28323-2-masneyb@onstation.org>
References: <20190203123131.28323-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190203123131.28323-1-masneyb@onstation.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, tglx@linutronix.de, marc.zyngier@arm.com
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org, linux-next@vger.kernel.org, andy.gross@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Select IRQ_DOMAIN_HIERARCHY for spmi-gpio in Kconfig since this driver
is now setup as a hierarchical IRQ chip.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
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
