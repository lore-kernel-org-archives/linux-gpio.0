From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 00/19] gpio: Interrupt cleanups and API change preparation
Date: Mon, 13 Jul 2015 20:41:14 -0000
Message-ID: <20150712232317.244138485@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

The following patch series contains the following changes:

    - Consolidation of chained interrupt handler setup/removal

    - Switch to functions which avoid a redundant interrupt
      descriptor lookup

    - Preparation of interrupt flow handlers for the 'irq' argument
      removal

The series has no dependencies and is also available as a git branch
for your convenience:

 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/gpio

If you want me to carry the patches in the irq/core branch of tip,
please let me know.

Thanks,

	tglx
