From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 00/63] Allow compile testing of most gpio drivers
Date: Fri, 26 Feb 2016 14:17:09 +0100
Message-ID: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:63386 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751505AbcBZNST (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:18:19 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

This patch set allows compile testing of most gpio drivers. I compiled all
from this list for x86_64 and arm. The drivers missing are using arch specific
includes or code only available on that platform, e.g. msr on x86, which is
unavailable on others.
I didn't include the OF people for the first one in purpose as I want some
feedback first.

Alexander Stein (63):
  of: Empty of_read_number when !OF
  gpio: gpiolib-of: Allow compile testing
  gpio: tegra: Allow compile test
  gpio: davinci: Allow compile testing
  gpio: em: Allow compile testing
  gpio: ge: Allow compile testing
  gpio: iop: Allow compile testing
  gpio: moxart: Allow compile testing
  gpio: mvebu: Allow compile testing
  gpio: mxc: Allow compile testing
  gpio: mxs: Allow compile testing
  gpio: omap: Allow compile testing
  gpio: pl061: Allow compile testing
  gpio: pxa: Allow compile testing
  gpio: spear-spics: Allow compile testing
  gpio: sta2x11: Allow compile testing
  gpio: syscon: Allow compile testing
  gpio: tb10x: Allow compile testing
  gpio vf610: Explicitly include pinctrl consumer header
  gpio: vf610: Allow compile testing
  gpio: xgene: Allow compile testing
  gpio: xlp: Allow compile testing
  gpio: zynq: Allow compile testing
  gpio: mc9s08dz60: Allow compile testing
  gpio: adp5520: Allow compile testing
  gpio: arizona: Allow compile testing
  gpio: crystalcove: Allow compile testing
  gpio: da9052: Allow compile testing
  gpio: da9055: Allow compile testing
  gpio: dln2: Allow compile testing
  gpio: jantz-ttl: Allow compile testing
  gpio: kempld: Allow compile testing
  gpio: lp3943: Allow compile testing
  gpio: msic: Allow compile testing
  gpio: palmas: Allow compile testing
  gpio: rc5t583: Allow compile testing
  gpio: timberdale: Allow compile testing
  gpio: tps65218: Allow compile testing
  gpio: tps6586x: Allow compile testing
  gpio: tps65910: Allow compile testing
  gpio: tps65912: Allow compile testing
  gpio: twl4030: Allow compile testing
  gpio: twl6040: Allow compile testing
  gpio: ucb1400: Allow compile testing
  gpio: wm831x: Allow compile testing
  gpio: wm8350: Allow compile testing
  gpio: wm8994: Allow compile testing
  gpio: viperboard: Allow compile testing
  gpio: stmpe: Move dependencies to a single line
  gpio: stmpe: Allow compile testing
  gpio: tc3589x: Move dependencies to a single line
  gpio: tc3589x: Allow compile testing
  gpio: ich: Allow compile testing
  gpio: lynxpoint: Allow compile testing
  gpio: vx855: Allow compile testing
  gpio: sch: Allow compile testing
  gpio: bt8xx: Allow compile testing
  gpio: intel-mid: Allow compile testing
  gpio: sodaville: Allow compile testing
  gpio: 74x164: Allow compile testing
  gpio: etraxfs: Allow compile testing
  gpio: grgpio: Allow compile testing
  gpio: mvebu: Allow compile testing

 drivers/gpio/Kconfig      | 126 ++++++++++++++++++++++++----------------------
 drivers/gpio/Makefile     |   2 +-
 drivers/gpio/gpio-vf610.c |   1 +
 include/linux/of.h        |   5 ++
 4 files changed, 72 insertions(+), 62 deletions(-)

-- 
2.7.2

