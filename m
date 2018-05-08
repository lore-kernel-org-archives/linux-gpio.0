From: djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org
Subject: [PATCH v0 1/2] gpio: syscon: Add gpio-syscon for rk3328
Date: Tue,  8 May 2018 10:48:23 +0800
Message-ID: <1525747704-8537-2-git-send-email-djw@t-chip.com.cn>
References: <1525747704-8537-1-git-send-email-djw@t-chip.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1525747704-8537-1-git-send-email-djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wayne Chou <zxf-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>, Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

From: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>

In Rockchip RK3328 Soc, there's a output only gpio pin labeled
`gpiomut_pmuio_iout`, which can be set by bit[1] of GRF_SOC_CON10.
(bit[0] controls the enable state of the pin and defaults to enabled.)

This pin is used by the roc-rk3328-cc board to switch sdmmc io signal
voltage between 1.8V and 3.3V, which is essential to the SD card UHS
support.

Signed-off-by: Levin Du <djw-Efosm3t9Qi2Pt1CcHtbs0g@public.gmane.org>
---

 drivers/gpio/gpio-syscon.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 537cec7..b69f65f 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -135,6 +135,34 @@ static const struct syscon_gpio_data clps711x_mctrl_gpio = {
 	.dat_bit_offset	= 0x40 * 8 + 8,
 };
 
+static void rockchip_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int val)
+{
+	struct syscon_gpio_priv *priv = gpiochip_get_data(chip);
+	unsigned int offs;
+	u8 bit;
+	u32 data;
+	int ret;
+
+	offs = priv->dreg_offset + priv->data->dat_bit_offset + offset;
+	bit = offs % SYSCON_REG_BITS;
+	data = (val ? BIT(bit) : 0) | BIT(bit + 16);
+	ret = regmap_write(priv->syscon,
+			   (offs / SYSCON_REG_BITS) * SYSCON_REG_SIZE,
+			   data);
+	if (ret < 0)
+		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
+}
+
+static const struct syscon_gpio_data rk3328_gpio_syscon10 = {
+	/* Rockchip RK3328 GRF_SOC_CON10 Bits 0-1 */
+	.compatible	= "rockchip,rk3328-grf",
+	.flags		= GPIO_SYSCON_FEAT_OUT,
+	.bit_count	= 2,
+	.dat_bit_offset	= 0x0428 * 8,
+	.set		= rockchip_gpio_set,
+};
+
 #define KEYSTONE_LOCK_BIT BIT(0)
 
 static void keystone_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
@@ -175,6 +203,10 @@ static const struct of_device_id syscon_gpio_ids[] = {
 		.compatible	= "ti,keystone-dsp-gpio",
 		.data		= &keystone_dsp_gpio,
 	},
+	{
+		.compatible	= "rockchip,rk3328-gpio-syscon10",
+		.data		= &rk3328_gpio_syscon10,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, syscon_gpio_ids);
-- 
2.7.4
