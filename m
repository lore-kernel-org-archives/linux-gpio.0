From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/6] gpio: Set proper argument value to set_config
Date: Thu, 14 Mar 2019 20:32:50 +0100
Message-ID: <b9ed544722175ea00b1f6ecb29ca5c3e1322239f.1552591798.git-series.maxime.ripard@bootlin.com>
References: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.66d6a9a379de8ebf176e4c25a8542152dc09f366.1552591798.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

The gpio_set_config function creates a pinconf configuration for a given
pinc_config_param.

However, it always uses an arg of 0, which might not be a valid argument
for a given param. A good example of that would be the bias parameters,
where 0 means that the pull up or down resistor is null, and the pin is
directly connected to VCC/GND.

The framework uses in some other places the value 1 as a default argument
to enable the pull resistor, so let's use the same one here.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 drivers/gpio/gpiolib.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 144af0733581..27cb5783ef52 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2565,8 +2565,20 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
 			   enum pin_config_param mode)
 {
-	unsigned long config = { PIN_CONF_PACKED(mode, 0) };
+	unsigned long config;
+	unsigned arg;
 
+	switch (mode) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = 1;
+		break;
+
+	default:
+		arg = 0;
+	}
+
+	config = PIN_CONF_PACKED(mode, arg);
 	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
 }
 
-- 
git-series 0.9.1
