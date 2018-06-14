From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] gpio: uniphier: set legitimate irq trigger type in .to_irq
 hook
Date: Thu, 14 Jun 2018 14:27:45 +0900
Message-ID: <1528954065-25563-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

If a GPIO chip is a part of a hierarchy IRQ domain, there is no
way to specify the trigger type when gpio(d)_to_irq() allocates an
interrupt on-the-fly.

Currently, uniphier_gpio_to_irq() sets IRQ_TYPE_NONE, but it causes
an error in the .alloc() hook of the parent domain.
(drivers/irq/irq-uniphier-aidet.c)

Even if we change irq-uniphier-aidet.c to accept the NONE type,
GIC complains about it since commit 83a86fbb5b56 ("irqchip/gic:
Loudly complain about the use of IRQ_TYPE_NONE").

Instead, use IRQ_TYPE_LEVEL_HIGH as a temporary value when an irq
is allocated.  irq_set_irq_type() will override it when the irq is
really requested.

Fixes: dbe776c2ca54 ("gpio: uniphier: add UniPhier GPIO controller driver")
Reported-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
---

 drivers/gpio/gpio-uniphier.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index d3cf950..58faeb1 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -181,7 +181,11 @@ static int uniphier_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 	fwspec.fwnode = of_node_to_fwnode(chip->parent->of_node);
 	fwspec.param_count = 2;
 	fwspec.param[0] = offset - UNIPHIER_GPIO_IRQ_OFFSET;
-	fwspec.param[1] = IRQ_TYPE_NONE;
+	/*
+	 * IRQ_TYPE_NONE is rejected by the parent irq domain. Set LEVEL_HIGH
+	 * temporarily. Anyway, ->irq_set_type() will override it later.
+	 */
+	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
 
 	return irq_create_fwspec_mapping(&fwspec);
 }
-- 
2.7.4
