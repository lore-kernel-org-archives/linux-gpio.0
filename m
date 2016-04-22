From: Linus Walleij <linus.walleij@linaro.org>
Subject: [GIT PULL] pin control fixes for v4.6 take three
Date: Fri, 22 Apr 2016 20:18:00 +0200
Message-ID: <CACRpkdb2MYFP=U3PdOrcbLnERXpeyY1SwpoyfsDx1820mRi1vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33150 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754552AbcDVSSC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2016 14:18:02 -0400
Received: by mail-oi0-f49.google.com with SMTP id r78so124877052oie.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2016 11:18:01 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

some pin control driver fixes came in. One headed for stable
and the other two are just ordinary merge window fixes.

Details in the tag and commits.

Please pull it in.

Yours,
Linus Walleij

The following changes since commit bf16200689118d19de1b8d2a3c314fc21f5dc7bb:

  Linux 4.6-rc3 (2016-04-10 17:58:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v4.6-3

for you to fetch changes up to 56b367c0cd67d4c3006738e7dc9dda9273fd2bfe:

  pinctrl: single: Fix pcs_parse_bits_in_pinctrl_entry to use __ffs
than ffs (2016-04-15 11:26:55 +0200)

----------------------------------------------------------------
Pin control fixes for the v4.6 series:
- Make the i.MX driver select REGMAP as a dependency
- Fix up the Mediatek debounce time unit
- Fix a real hairy ffs vs __ffs issue in the Single pinctrl driver

----------------------------------------------------------------
Alexander Kurz (1):
      pinctrl: imx: Kconfig: PINCTRL_IMX select REGMAP

Keerthy (1):
      pinctrl: single: Fix pcs_parse_bits_in_pinctrl_entry to use __ffs than ffs

Yingjoe Chen (1):
      pinctrl: mediatek: correct debounce time unit in mtk_gpio_set_debounce

 drivers/pinctrl/freescale/Kconfig             | 1 +
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 9 +++++----
 drivers/pinctrl/pinctrl-single.c              | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)
