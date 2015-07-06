From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/7] This series adds pinctrl drivers for UniPhier SoC family.
Date: Mon,  6 Jul 2015 21:29:16 +0900
Message-ID: <1436185763-4308-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg012.nifty.com ([202.248.44.38]:36183 "EHLO
	conuserg012-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754797AbbGFMaV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2015 08:30:21 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

1/7: core support code commonly used for all the pinctrl drivers.
2/7-7/7: driver for each SoC



Masahiro Yamada (7):
  pinctrl: UniPhier: add UniPhier pinctrl core support
  pinctrl: UniPhier: add UniPhier PH1-LD4 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-Pro4 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-sLD8 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-Pro5 pinctrl driver
  pinctrl: UniPhier: add UniPhier ProXstream2 pinctrl driver
  pinctrl: UniPhier: add UniPhier PH1-LD6b pinctrl driver

 drivers/pinctrl/Kconfig                          |    1 +
 drivers/pinctrl/Makefile                         |    1 +
 drivers/pinctrl/uniphier/Kconfig                 |   32 +
 drivers/pinctrl/uniphier/Makefile                |    8 +
 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c       |  875 ++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c      | 1264 ++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c      | 1539 ++++++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c      | 1325 +++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c      |  784 +++++++++++
 drivers/pinctrl/uniphier/pinctrl-proxstream2.c   | 1249 ++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c |  686 ++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier.h      |  217 +++
 12 files changed, 7981 insertions(+)
 create mode 100644 drivers/pinctrl/uniphier/Kconfig
 create mode 100644 drivers/pinctrl/uniphier/Makefile
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-proxstream2.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier.h

-- 
1.9.1

