From: <kamlakant.patel@linaro.org>
Subject: [RTF] [PATCH 00/26] gpio: use platform based module init
Date: Tue, 9 Sep 2014 15:59:25 +0530
Message-ID: <1410258591-28248-1-git-send-email-kamlakant.patel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw2-out.broadcom.com ([216.31.210.63]:36487 "EHLO
	mail-gw2-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932299AbaIIK3r (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Sep 2014 06:29:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Kamlakant Patel <kamlakant.patel@linaro.org>, linux-gpio@vger.kernel.org

From: Kamlakant Patel <kamlakant.patel@linaro.org>

This patch removes *_initcall based driver initialization
and adds regular module_platform_driver to instantiate
GPIO drivers which makes the code smaller and simpler.

NOTE: This patch needs to be tested on different platforms.

Kamlakant Patel (26):
  gpio: em: use platform based module init
  gpio: ep93xx: use platform based module init
  gpio: iop: use platform based module init
  gpio: msm-v1: use platform based module init
  gpio: mxc: use platform based module init
  gpio: mxs: use platform based module init
  gpio: palmas: use platform based module init
  gpio: SPEAr: use platform based module init
  gpio: stmpe: use platform based module init
  gpio: tc3589x: use platform based module init
  gpio: tps6586x: use platform based module init
  gpio: tps65910: use platform based module init
  gpio: use platform based module init
  gpio: twl4030: use platform based module init
  gpio: wm831x: use platform based module init
  gpio: wm8350: use platform based module init
  gpio: wm8994: use platform based module init
  gpio: zynq: use platform based module init
  gpio: da9055: use platform based module init
  gpio: lynxpoint: use platform based module init
  gpio: lantiq: use platform based module init
  gpio: msic: use platform based module init
  gpio: rc5t583: use platform based module init
  gpio: xway: use platform based module init
  gpio: tz1090-pdc: use platform based module init
  gpio: tz1090: use platform based module init

 drivers/gpio/gpio-da9055.c      | 13 +------------
 drivers/gpio/gpio-em.c          | 13 +------------
 drivers/gpio/gpio-ep93xx.c      |  7 +------
 drivers/gpio/gpio-iop.c         |  7 +------
 drivers/gpio/gpio-lynxpoint.c   | 14 +-------------
 drivers/gpio/gpio-mm-lantiq.c   |  8 +-------
 drivers/gpio/gpio-msic.c        |  8 +-------
 drivers/gpio/gpio-msm-v1.c      |  6 +-----
 drivers/gpio/gpio-mxc.c         |  7 +------
 drivers/gpio/gpio-mxs.c         |  6 +-----
 drivers/gpio/gpio-palmas.c      | 13 +------------
 drivers/gpio/gpio-rc5t583.c     | 13 +------------
 drivers/gpio/gpio-spear-spics.c |  7 +------
 drivers/gpio/gpio-stmpe.c       | 13 +------------
 drivers/gpio/gpio-stp-xway.c    |  8 +-------
 drivers/gpio/gpio-tc3589x.c     | 13 +------------
 drivers/gpio/gpio-tps6586x.c    | 13 +------------
 drivers/gpio/gpio-tps65910.c    | 13 +------------
 drivers/gpio/gpio-tps65912.c    | 13 +------------
 drivers/gpio/gpio-twl4030.c     | 13 +------------
 drivers/gpio/gpio-tz1090-pdc.c  |  7 +------
 drivers/gpio/gpio-tz1090.c      |  7 +------
 drivers/gpio/gpio-wm831x.c      | 13 +------------
 drivers/gpio/gpio-wm8350.c      | 13 +------------
 drivers/gpio/gpio-wm8994.c      | 13 +------------
 drivers/gpio/gpio-zynq.c        | 12 +-----------
 26 files changed, 26 insertions(+), 247 deletions(-)

-- 
1.9.1

