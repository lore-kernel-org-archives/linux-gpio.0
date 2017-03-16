From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 6/6] gpio: mvebu: let the compiler inline
Date: Thu, 16 Mar 2017 07:34:01 +0100
Message-ID: <20170316063402.8667-7-ralph.sennhauser@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

A modern compiler should know better when to inline, so drop the inline
keywords.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index d9aa77b..029f43c 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -99,35 +99,32 @@ struct mvebu_gpio_chip {
  * Functions returning addresses of individual registers for a given
  * GPIO controller.
  */
-static inline void __iomem *mvebu_gpioreg_out(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_out(struct mvebu_gpio_chip *mvchip)
 {
 	return mvchip->membase + GPIO_OUT_OFF;
 }
 
-static inline void __iomem *mvebu_gpioreg_blink(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_blink(struct mvebu_gpio_chip *mvchip)
 {
 	return mvchip->membase + GPIO_BLINK_EN_OFF;
 }
 
-static inline void __iomem *
-mvebu_gpioreg_io_conf(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_io_conf(struct mvebu_gpio_chip *mvchip)
 {
 	return mvchip->membase + GPIO_IO_CONF_OFF;
 }
 
-static inline void __iomem *mvebu_gpioreg_in_pol(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_in_pol(struct mvebu_gpio_chip *mvchip)
 {
 	return mvchip->membase + GPIO_IN_POL_OFF;
 }
 
-static inline void __iomem *
-mvebu_gpioreg_data_in(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_data_in(struct mvebu_gpio_chip *mvchip)
 {
 	return mvchip->membase + GPIO_DATA_IN_OFF;
 }
 
-static inline void __iomem *
-mvebu_gpioreg_edge_cause(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_edge_cause(struct mvebu_gpio_chip *mvchip)
 {
 	int cpu;
 
@@ -144,8 +141,7 @@ mvebu_gpioreg_edge_cause(struct mvebu_gpio_chip *mvchip)
 	}
 }
 
-static inline void __iomem *
-mvebu_gpioreg_edge_mask(struct mvebu_gpio_chip *mvchip)
+static void __iomem *mvebu_gpioreg_edge_mask(struct mvebu_gpio_chip *mvchip)
 {
 	int cpu;
 
-- 
2.10.2
