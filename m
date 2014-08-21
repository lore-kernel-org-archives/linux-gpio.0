From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH linux-next] irq: export handle_fasteoi_irq
Date: Fri, 22 Aug 2014 01:31:20 +0200
Message-ID: <1408663880-29179-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Thomas Gleixner <tglx@linutronix.de>, Lars-Peter Clausen <lars@metafoo.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Export handle_fasteoi_irq to be able to use it in e.g. the Zynq gpio dr=
iver
since commit 6dd859508336 ("gpio: zynq: Fix IRQ handlers").

This fixes the following link issue:

  ERROR: "handle_fasteoi_irq" [drivers/gpio/gpio-zynq.ko] undefined!

Signed-off-by: Vincent Stehl=C3=A9 <vincent.stehle@laposte.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---

Hi,

This can be seen in Linux next-20140822 with e.g. arm allmodconfig.

Zync gpio seems to be the first code to use handle_fasteoi_irq, which c=
an be
compiled as a module.

Best regards,

V.

 kernel/irq/chip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index a2b28a2..6223fab 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -517,6 +517,7 @@ out:
 		chip->irq_eoi(&desc->irq_data);
 	raw_spin_unlock(&desc->lock);
 }
+EXPORT_SYMBOL_GPL(handle_fasteoi_irq);
=20
 /**
  *	handle_edge_irq - edge type IRQ handler
--=20
2.1.0.rc1
