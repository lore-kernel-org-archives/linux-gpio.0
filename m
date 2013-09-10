From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] IXP4 GPIO consolidation
Date: Tue, 10 Sep 2013 14:29:42 +0200
Message-ID: <1378816182-7903-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:56167 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751375Ab3IJM35 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2013 08:29:57 -0400
Received: by mail-lb0-f181.google.com with SMTP id u14so6014863lbd.26
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2013 05:29:55 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khc@pm.waw.pl>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>

This is an attempt to remove the custom GPIO API
with gpio_line* signatures from the IXP4 platform.
I'm looking for testing and ACKs to take this through
the GPIO tree eventually as part of the major clean-up
attempt.

Please do not report checkpatch errors on patch 7/7 as it
is just moving already existing code, not introducing new
code.

Linus Walleij (7):
  ARM: ixp4xx: convert remaining users to use gpiolib
  misc: ixp4-beeper: switch to use gpiolib
  misc: ixp4-beeper: use gpiolib strictly
  ptp: switch to use gpiolib
  staging: media/lirc: switch to use gpiolib
  ARM: ixp4: delete irq_to_gpio
  ARM: ixp4xx: stop broadcasting the custom GPIO API

 arch/arm/mach-ixp4xx/common.c                | 49 +++++++++++++++++++++-------
 arch/arm/mach-ixp4xx/dsmg600-setup.c         | 16 +++++----
 arch/arm/mach-ixp4xx/include/mach/platform.h | 39 ----------------------
 arch/arm/mach-ixp4xx/ixdp425-setup.c         |  8 +++--
 arch/arm/mach-ixp4xx/nas100d-setup.c         | 15 +++++----
 arch/arm/mach-ixp4xx/nslu2-setup.c           | 10 +++---
 drivers/input/misc/ixp4xx-beeper.c           | 25 +++++++++-----
 drivers/ptp/ptp_ixp46x.c                     |  9 ++++-
 drivers/staging/media/lirc/lirc_serial.c     | 16 +++++++--
 9 files changed, 102 insertions(+), 85 deletions(-)

-- 
1.8.3.1

