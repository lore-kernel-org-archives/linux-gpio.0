From: John Keeping <john@metanate.com>
Subject: [PATCH v4 0/4] pinctrl: rockchip: PREEMPT_RT_FULL fixes
Date: Thu, 23 Mar 2017 10:59:27 +0000
Message-ID: <20170323105931.10455-1-john@metanate.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from dougal.metanate.com ([90.155.101.14]:38660 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932257AbdCWLAe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 07:00:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>

The aim of the series is to make the Rockchip pinctrl irq_chip
implementation safe for use with RT_FULL which requires that raw
spinlocks are used to avoid sleeping in hardirq context.

v4 is v3 rebased onto pinctrl/devel as of b9c6dcab265e ("pinctrl: rockchip:
rename RK1108 to RV1108").

John Keeping (4):
  pinctrl: rockchip: remove unnecessary locking
  pinctrl: rockchip: convert to raw spinlock
  pinctrl: rockchip: split out verification of mux settings
  pinctrl: rockchip: avoid hardirq-unsafe functions in irq_chip

 drivers/pinctrl/pinctrl-rockchip.c | 149 +++++++++++++++++++++----------------
 1 file changed, 85 insertions(+), 64 deletions(-)

-- 
2.12.0.377.gf910686b23.dirty

