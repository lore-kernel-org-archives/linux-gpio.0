From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] irqchip: renesas: Use proper irq_chip name and parent
Date: Fri,  7 Jun 2019 11:58:54 +0200
Message-ID: <20190607095858.10028-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

	Hi all,

Recently, Marc pointed out some common misconceptions w.r.t. the .name
and .parent_device fields in struct irq_chip.  This patch series fixes
them in the Renesas interrupt controller drivers.

The first two patches are destined for the irqchip tree, the last two
for the GPIO tree.

Thanks!

Geert Uytterhoeven (4):
  irqchip/renesas-intc-irqpin: Use proper irq_chip name and parent
  irqchip/renesas-irqc: Use proper irq_chip name and parent
  gpio: em: Use proper irq_chip name
  gpio: rcar: Use proper irq_chip name

 drivers/gpio/gpio-em.c                    | 2 +-
 drivers/gpio/gpio-rcar.c                  | 2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c | 3 ++-
 drivers/irqchip/irq-renesas-irqc.c        | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
