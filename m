From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCHv3 13/14] pinctrl: mcp23s08: drop comment about missing irq support
Date: Mon, 15 May 2017 11:24:37 +0200
Message-ID: <20170515092438.13076-14-sebastian.reichel@collabora.co.uk>
References: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170515092438.13076-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, linux-gpio@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: linux-gpio@vger.kernel.org

The driver supports using mcp23xxx as interrupt controller, so
let's drop all comments stating otherwise.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 19 ++-----------------
 include/linux/spi/mcp23s08.h       |  3 ---
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 29d9c1fd4309..3e40d4245512 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -1,14 +1,4 @@
-/*
- * MCP23S08 SPI/I2C GPIO gpio expander driver
- *
- * The inputs and outputs of the mcp23s08, mcp23s17, mcp23008 and mcp23017 are
- * supported.
- * For the I2C versions of the chips (mcp23008 and mcp23017) generation of
- * interrupts is also supported.
- * The hardware of the SPI versions of the chips (mcp23s08 and mcp23s17) is
- * also capable of generating interrupts, but the linux driver does not
- * support that yet.
- */
+/* MCP23S08 SPI/I2C GPIO driver */
 
 #include <linux/kernel.h>
 #include <linux/device.h>
@@ -27,7 +17,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
-/**
+/*
  * MCP types supported by driver
  */
 #define MCP_TYPE_S08	0
@@ -1131,11 +1121,6 @@ static int mcp23s08_probe(struct spi_device *spi)
 	}
 	data->ngpio = ngpio;
 
-	/* NOTE:  these chips have a relatively sane IRQ framework, with
-	 * per-signal masking and level/edge triggering.  It's not yet
-	 * handled here...
-	 */
-
 	return 0;
 }
 
diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
index 211f3c0ef49c..4354beefd584 100644
--- a/include/linux/spi/mcp23s08.h
+++ b/include/linux/spi/mcp23s08.h
@@ -1,6 +1,3 @@
-
-/* FIXME driver should be able to handle IRQs...  */
-
 struct mcp23s08_platform_data {
 	/* For mcp23s08, up to 4 slaves (numbered 0..3) can share one SPI
 	 * chipselect, each providing 1 gpio_chip instance with 8 gpios.
-- 
2.11.0
