From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 0/2] Last step to working Allwinner R40 pinctrl
Date: Tue, 18 Jul 2017 15:42:52 +0800
Message-ID: <20170718074254.20732-1-icenowy@aosc.io>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:44221 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751336AbdGRHnE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Jul 2017 03:43:04 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>

This patchset contains only two patches.

The first one is a minor fix for the A10 pinctrl driver, add a function
of a pin, which used to be missing in A10/A20 pinctrl driver. Thanks for
Chen-Yu for discovering it when reviewing my R40 pinctrl patchset.

The second one is the real R40 pinctrl part, with fixes suggested by
Chen-Yu and Maxime.

Icenowy Zheng (2):
  pinctrl: sunxi: add a missing function of A10/A20 pinctrl driver
  pinctrl: sunxi: add support of R40 to A10 pinctrl driver

 drivers/pinctrl/sunxi/Kconfig             |   2 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c | 274 +++++++++++++++++++++---------
 2 files changed, 197 insertions(+), 79 deletions(-)

-- 
2.13.0

