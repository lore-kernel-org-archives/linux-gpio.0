From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 3/4] pinctrl: bcm2835: activate strict mux mode
Date: Mon, 21 Jan 2019 08:11:24 +0100
Message-ID: <1548054685-3781-4-git-send-email-stefan.wahren@i2se.com>
References: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548054685-3781-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

This activates strict mode muxing for the bcm2835 pin controller,
as the GPIO Function Select Registers do not allow GPIO and functions
at the same time.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 183d1ff..452e734 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -894,6 +894,7 @@ static const struct pinmux_ops bcm2835_pmx_ops = {
 	.set_mux = bcm2835_pmx_set,
 	.gpio_disable_free = bcm2835_pmx_gpio_disable_free,
 	.gpio_set_direction = bcm2835_pmx_gpio_set_direction,
+	.strict = true,
 };
 
 static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
-- 
2.7.4
