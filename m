From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/3] ARM: davinci: define gpio interrupts as separate resources
Date: Tue, 13 Nov 2018 14:50:49 +0100
Message-ID: <20181113135051.15308-2-brgl@bgdev.pl>
References: <20181113135051.15308-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20181113135051.15308-1-brgl@bgdev.pl>
Sender: stable-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Since commit eb3744a2dd01 ("gpio: davinci: Do not assume continuous
IRQ numbering") the davinci GPIO driver fails to probe if we boot
in legacy mode from any of the board files. Since the driver now
expects every interrupt to be defined as a separate resource, split
the definition in devices-da8xx.c instead of having a single continuous
interrupt range.

Fixes: eb3744a2dd01 ("gpio: davinci: Do not assume continuous IRQ numbering")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/devices-da8xx.c | 42 ++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-davinci/devices-da8xx.c b/arch/arm/mach-davinci/devices-da8xx.c
index 1fd3619f6a09..8c4ae9866e3c 100644
--- a/arch/arm/mach-davinci/devices-da8xx.c
+++ b/arch/arm/mach-davinci/devices-da8xx.c
@@ -701,9 +701,49 @@ static struct resource da8xx_gpio_resources[] = {
 	},
 	{ /* interrupt */
 		.start	= IRQ_DA8XX_GPIO0,
-		.end	= IRQ_DA8XX_GPIO8,
+		.end	= IRQ_DA8XX_GPIO0,
 		.flags	= IORESOURCE_IRQ,
 	},
+	{
+		.start	= IRQ_DA8XX_GPIO1,
+		.end	= IRQ_DA8XX_GPIO1,
+		.flags	= IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO2,
+		.end    = IRQ_DA8XX_GPIO2,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO3,
+		.end    = IRQ_DA8XX_GPIO3,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO4,
+		.end    = IRQ_DA8XX_GPIO4,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO5,
+		.end    = IRQ_DA8XX_GPIO5,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO6,
+		.end    = IRQ_DA8XX_GPIO6,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO7,
+		.end    = IRQ_DA8XX_GPIO7,
+		.flags  = IORESOURCE_IRQ,
+	},
+	{
+		.start  = IRQ_DA8XX_GPIO8,
+		.end    = IRQ_DA8XX_GPIO8,
+		.flags  = IORESOURCE_IRQ,
+	}
 };
 
 static struct platform_device da8xx_gpio_device = {
-- 
2.19.1
