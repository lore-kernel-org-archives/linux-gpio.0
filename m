From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH v2 1/7] gpio: brcmstb: Do not use gc->pin2mask()
Date: Tue, 24 Oct 2017 12:54:45 -0700
Message-ID: <20171024195451.30535-2-opendmb@gmail.com>
References: <20171024195451.30535-1-opendmb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171024195451.30535-1-opendmb@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Brian Norris <computersforpeace@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
bit 15 or bit 31 or so.

The brcmstb only uses big endian BYTE ORDER which will be taken car of
by the ->write_reg() callback.

Just use BIT(offset) to assign the bit.

Cc: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-brcmstb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 27e92e57adae..9b8fcca7ad17 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -20,6 +20,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/interrupt.h>
 #include <linux/reboot.h>
+#include <linux/bitops.h>
 
 #define GIO_BANK_SIZE           0x20
 #define GIO_ODEN(bank)          (((bank) * GIO_BANK_SIZE) + 0x00)
@@ -68,16 +69,15 @@ static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 {
 	struct gpio_chip *gc = &bank->gc;
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
-	u32 mask = gc->pin2mask(gc, offset);
 	u32 imask;
 	unsigned long flags;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
 	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
 	if (enable)
-		imask |= mask;
+		imask |= BIT(offset);
 	else
-		imask &= ~mask;
+		imask &= ~BIT(offset);
 	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
-- 
2.14.1
