From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 0/9] ARM: sa1100: Rework IRQ handling
Date: Fri, 15 Nov 2013 12:47:51 +0400
Message-ID: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:47746 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752774Ab3KOIsS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2013 03:48:18 -0500
Received: by mail-wi0-f173.google.com with SMTP id ey16so656069wid.12
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2013 00:48:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Dmitry Artamonow <mad_soft@inbox.ru>

This is a considerable rework of my previous attempt to update sa1100 irq
handling. IRQ code is updated to support MULTI_IRQ_HANDLER and is mostly
prepared to be converted to irqchip driver (if the need arises in future).
I have integrated idea of Linus Waleij to use irq domains. GPIO irq handling
is split to gpio driver, which also undergo an update/rewrite.


Dmitry Eremin-Solenikov (9):
      ARM: sa1100 collie: use gpio-charger instead of pda-power
      ARM: locomo: don't clobber chip data for chained irq
      ARM: sa1100: switch to MULTI_IRQ_HANDLER
      ARM: sa1100: convert gpio driver to be a proper platform driver
      ARM: sa1100: add platform functions to handle PWER settings
      ARM: sa1100: enable IRQ domains
      ARM: sa1100: move gpio irq handling to GPIO driver
      ARM: sa1100: move per-IRQ PWER settings to core code
      ARM: sa1100: refactor irq driver

 arch/arm/Kconfig                                |   2 +
 arch/arm/common/locomo.c                        |   4 +-
 arch/arm/mach-sa1100/collie.c                   |  55 ++-------------
 arch/arm/mach-sa1100/generic.c                  |  46 +++++++++++-
 arch/arm/mach-sa1100/generic.h                  |   3 +-
 arch/arm/mach-sa1100/include/mach/SA-1100.h     |   2 +
 arch/arm/mach-sa1100/include/mach/entry-macro.S |  41 -----------
 arch/arm/mach-sa1100/include/mach/irqs.h        |  73 +++++++++++--------
 arch/arm/mach-sa1100/irq.c                      | 322 +++++++++++++++++++++--------------------------------------------------------------
 drivers/gpio/Kconfig                            |   6 ++
 drivers/gpio/Makefile                           |   2 +-
 drivers/gpio/gpio-sa1100.c                      | 332 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 12 files changed, 500 insertions(+), 388 deletions(-)
 delete mode 100644 arch/arm/mach-sa1100/include/mach/entry-macro.S


