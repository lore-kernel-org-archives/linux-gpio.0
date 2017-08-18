From: David Daney <david.daney@cavium.com>
Subject: [PATCH v8 0/7] genirq/gpio: Add driver for ThunderX and OCTEON-TX SoCs
Date: Thu, 17 Aug 2017 17:53:29 -0700
Message-ID: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: linux-gpio@vger.kernel.org

The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
the interrupt signal from each GPIO line being routed to a dedicated
MSI-X.  This interrupt routing requires that we add some custom
processing to the beginning of the MSI-X irqdomain hierarchy.

Changes from v7:

 - Refactoring of irqdomain.c changes as suggested by Marc Zyngier.

 - Renaming of new handler functions in chip.c and making building of
   these conditional on a Kconfig variable, suggested by Thomas Gleixner.

Changes from v6:

 - Trivial rebase to v4.13.0-rc4:  Omit device tree bindings patch,
   which was already merged, and fix MAINTAINERS patch collision.

Changes from v5:

 - Added .irq_{request,release}_resources() functions to irq_chip.

 - Quit calling irq_set_irq_type() in the irq_map() function.

 - Added more error condition checking to irq_domain_{push,pop}_irq()

Changes from v4:

 - Rebased to post-v4.10 to support .set_config() function.

 - Added .get_direction() support.

 - Added PIN_CONFIG_INPUT_DEBOUNCE support.

 - Removed some improper use of ENOSYS.

Changes from v3:

 - Add some "depends on" to the driver Kconfig to avoid build errors
   in some architectures when doing COMPILE_TEST builds.

Changes from v2:

 - in 4/6: Added Rob Harring's Acked-by

 - Added three patches to genirq/irqdomain to support interrupt code
   in the driver.

 - Rewrite irq code in driver to use irqdomain hierarchy.

 - Other naming and style changes as recommended by Linus Walleij.

Changes from v1:

 - in 1/3: Addressed Rob Harring's comments.

 - in 2/3: Trivial cleanups found in internal review + add some
   comments.

David Daney (7):
  genirq: Export more irq_chip_*_parent() functions.
  genirq: Add handle_fasteoi_{level,edge}_irq flow handlers.
  irqdomain: Factor out code to add and remove items to and from the
    revmap
  irqdomain: Check for NULL function pointer in
    irq_domain_free_irqs_hierarchy()
  irqdomain: Add irq_domain_{push,pop}_irq() functions.
  gpio: Add gpio driver support for ThunderX and OCTEON-TX
  MAINTAINERS: Add entry for THUNDERX GPIO Driver.

 MAINTAINERS                  |   5 +
 drivers/gpio/Kconfig         |   9 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-thunderx.c | 639 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/irq.h          |   2 +
 include/linux/irqdomain.h    |   3 +
 kernel/irq/Kconfig           |   4 +
 kernel/irq/chip.c            | 109 ++++++++
 kernel/irq/irqdomain.c       | 230 ++++++++++++++--
 9 files changed, 972 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpio/gpio-thunderx.c

-- 
1.8.3.1
