From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH v2 0/2] Power management callbacks for irqchips
Date: Wed, 4 Nov 2015 12:15:58 -0800
Message-ID: <1446668160-17522-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Lars-Peter Clausen <lars@metafoo.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Grygorii Strashko <grygorii.strashko@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

Hi,

we recently discussed how to handle power management with GPIO devices
that can generate interrupts here: https://lkml.org/lkml/2015/10/23/305=
=2E
At the end of that discussion stood Lars' suggestion to add a new pair =
of
callbacks to the irqchip for this purpose. This is a first, naive
implementation of that approach.

        Thanks,
        S=C3=B6ren

v2:
 - add mailing lists (sorry for forgetting that in v1)

S=C3=B6ren Brinkmann (2):
  genirq: Add irq_pm_(get|put) callbacks to the irqchip
  gpio: zynq: Implement irq_pm_(get|put)

 drivers/gpio/gpio-zynq.c | 20 ++++++++++++++++++++
 include/linux/irq.h      |  4 ++++
 kernel/irq/internals.h   | 14 ++++++++++++++
 kernel/irq/manage.c      | 20 ++++++++++++++++----
 4 files changed, 54 insertions(+), 4 deletions(-)

--=20
2.6.2.3.ga463a5b
