From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: gpio: mxs: fix duplicate level interrupts
Date: Fri, 21 Oct 2016 15:11:36 +0200
Message-ID: <20161021131138.10467-1-s.hauer@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>
List-Id: linux-gpio@vger.kernel.org

We observed that each level interrupt triggers two interrupts. This
is because the driver erroneously uses the IRQSTAT register to 
acknowledge level interrupts which according to the reference manual
is not possible. Patch 2/2 fixes that, look for its commit message
for a detailed description what happens and how it is fixed.

Sascha

----------------------------------------------------------------
Sascha Hauer (2):
      gpio: mxs: use enable/disable regs to (un)mask irqs
      gpio: mxs: fix duplicate level interrupts
