From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 1/2] gpio: aspeed: Make bank names strings
Date: Mon, 23 Jan 2017 15:56:06 +1030
Message-ID: <20170123052607.9424-2-andrew@aj.id.au>
References: <20170123052607.9424-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123052607.9424-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: linux-gpio@vger.kernel.org

From: Joel Stanley <joel@jms.id.au>

The Aspeed SoCs have more GPIOs than can be represented with A-Z. The
documentation uses two letter names such as AA and AB, so make the names
a three-character array in the bank struct to accommodate this.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 03a5925a423c..20f6f8ae4671 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -28,39 +28,39 @@ struct aspeed_gpio {
 struct aspeed_gpio_bank {
 	uint16_t	val_regs;
 	uint16_t	irq_regs;
-	const char	names[4];
+	const char	names[4][3];
 };
 
 static const struct aspeed_gpio_bank aspeed_gpio_banks[] = {
 	{
 		.val_regs = 0x0000,
 		.irq_regs = 0x0008,
-		.names = { 'A', 'B', 'C', 'D' },
+		.names = { "A", "B", "C", "D" },
 	},
 	{
 		.val_regs = 0x0020,
 		.irq_regs = 0x0028,
-		.names = { 'E', 'F', 'G', 'H' },
+		.names = { "E", "F", "G", "H" },
 	},
 	{
 		.val_regs = 0x0070,
 		.irq_regs = 0x0098,
-		.names = { 'I', 'J', 'K', 'L' },
+		.names = { "I", "J", "K", "L" },
 	},
 	{
 		.val_regs = 0x0078,
 		.irq_regs = 0x00e8,
-		.names = { 'M', 'N', 'O', 'P' },
+		.names = { "M", "N", "O", "P" },
 	},
 	{
 		.val_regs = 0x0080,
 		.irq_regs = 0x0118,
-		.names = { 'Q', 'R', 'S', 'T' },
+		.names = { "Q", "R", "S", "T" },
 	},
 	{
 		.val_regs = 0x0088,
 		.irq_regs = 0x0148,
-		.names = { 'U', 'V', 'W', 'X' },
+		.names = { "U", "V", "W", "X" },
 	},
 	/*
 	 * A bank exists for { 'Y', 'Z', "AA", "AB" }, but is not implemented.
-- 
2.9.3
