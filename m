From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/2] Last step to working Allwinner R40 pinctrl
Date: Thu,  6 Jul 2017 22:28:20 +0800
Message-ID: <20170706142822.20296-1-icenowy@aosc.io>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:41532 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751741AbdGFO2s (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Jul 2017 10:28:48 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>

This patchset contains only two patches.

The first one is a minor fix for the A10 pinctrl driver, add a function
of a pin, which used to be missing in A10/A20 pinctrl driver.

The second one is the real R40 pinctrl part, with fixes suggested by
Chen-Yu.

Icenowy Zheng (2):
  pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
  pinctrl: sunxi: add support of R40 to A10 pinctrl driver

 drivers/pinctrl/sunxi/Kconfig             |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 281 +++++++++++++++++++++---------
 2 files changed, 204 insertions(+), 79 deletions(-)

-- 
2.13.0

