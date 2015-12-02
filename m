From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] Pin control fixes for the v4.4 series
Date: Wed, 2 Dec 2015 15:23:44 +0100
Message-ID: <CACRpkdYeS5vySLS8HvTZu+iGPqM=hckhhMtFXm9Kx7KqQc4K4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34790 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757350AbbLBOXp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2015 09:23:45 -0500
Received: by obbbj7 with SMTP id bj7so33505890obb.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Dec 2015 06:23:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

here is a set of assorted pin control fixes for the v4.4 series.
More details in the signed tag as usual.

Please pull this in.

Yours,
Linus Walleij

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.4-2

for you to fetch changes up to 48111b79b77f9fb1f139e1878b3cfcd56b46b789:

  pinctrl: sh-pfc: sh7734: Add missing cfg macro parameter to fix
build (2015-12-01 11:13:04 +0100)

----------------------------------------------------------------
These are some v4.4 pin control fixes:

- Drop a redundant if-clause from Kconfig

- Fix a missing of_node_put() memory leak in the
  Freescale i.MX driver

- Fix 64bit compilation of the Qualcomm SSBI driver.

- Fix a logic inversion in the Mediatek driver.

- Fix a compilation error for the odd one off in the
  Super-H instance of the SH PFC driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      pinctrl: fix qcom ssbi drivers for 64-bit compilation

Geert Uytterhoeven (1):
      pinctrl: sh-pfc: sh7734: Add missing cfg macro parameter to fix build

Hongzhou Yang (1):
      pinctrl: mediatek: Add get_direction support.

Masahiro Yamada (1):
      pinctrl: remove redundant if conditional from Kconfig

Vaishali Thakkar (1):
      pinctrl: imx1-core: add missing of_node_put

 drivers/pinctrl/Kconfig                       |  4 ----
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |  8 ++++++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 11 ++++-------
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c      |  2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c       |  2 +-
 drivers/pinctrl/sh-pfc/pfc-sh7734.c           |  6 +++---
 6 files changed, 15 insertions(+), 18 deletions(-)
