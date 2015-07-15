From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Wed, 15 Jul 2015 11:01:57 +1000
Message-ID: <20150715110157.72e7fc7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, Jiang Liu <jiang.liu@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/sirf/pinctrl-atlas7.c: In function 'atlas7_gpio_handle_irq':
drivers/pinctrl/sirf/pinctrl-atlas7.c:4300:20: error: 'irq' undeclared (first use in this function)
   if (bank->irq == irq)
                    ^

Caused by commit

  5dc1aeb0340f ("pinctrl/sirf: Prepare-x-gpio-handle-irq-for-irq-argument-removal.patch")
[hmmm, not a wonderful commit summary line]

I tried to use the tip tree from next-20150714, but for some reason that
broke the perf build:

  BUILD:   Doing 'make -j48' parallel build
make[3]: *** No rule to make target '../lib/hweight.c', needed by '/scratch/sfr/next/tools/perf/util/hweight.o'.  Stop.

So instead, I applied the following fix patch for today's issue:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 15 Jul 2015 10:56:28 +1000
Subject: [PATCH] pinctrl/sirf: fix for Prepare-x-gpio-handle-irq-for-irq-argument-removal.patch

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index f55c931f1088..7917b7719939 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -4294,6 +4294,7 @@ static void atlas7_gpio_handle_irq(unsigned int __irq, struct irq_desc *desc)
 	u32 status, ctrl;
 	int pin_in_bank = 0, idx;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned int irq = irq_desc_get_irq(desc);
 
 	for (idx = 0; idx < a7gc->nbank; idx++) {
 		bank = &a7gc->banks[idx];
-- 
2.1.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
