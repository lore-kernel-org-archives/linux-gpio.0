From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 0/2] MIPS: ath79: Move the GPIO driver to drivers/gpio
Date: Fri,  3 Jul 2015 11:11:47 +0200
Message-ID: <1435914709-15092-1-git-send-email-albeu@free.fr>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:59518 "EHLO smtp2-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754570AbbGCJMU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 3 Jul 2015 05:12:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>

Hi all,

as requested when I posted the ATH79 OF support serie, here is the move of
the GPIO driver to the GPIO drivers directory. While at it I also removed
the custom pinmux API as it not used by any board.

Alban

Alban Bedel (2):
  MIPS: ath79: Remove the unused GPIO function API
  MIPS: ath79: Move the GPIO driver to drivers/gpio

 arch/mips/ath79/Makefile  |   2 +-
 arch/mips/ath79/common.h  |   3 -
 arch/mips/ath79/gpio.c    | 279 ----------------------------------------------
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-ath79.c | 236 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 238 insertions(+), 283 deletions(-)
 delete mode 100644 arch/mips/ath79/gpio.c
 create mode 100644 drivers/gpio/gpio-ath79.c

-- 
2.0.0

