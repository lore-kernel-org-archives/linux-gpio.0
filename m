From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 0/2] pinctrl: uniphier: one fix, one addition
Date: Thu, 24 Sep 2015 21:26:45 +0900
Message-ID: <1443097607-29011-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg012.nifty.com ([202.248.44.38]:17573 "EHLO
	conuserg012-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754293AbbIXM1c (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 08:27:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

1/2 is a bug fix, but it is not very critical.
I can wait until 4.4-rc1 if it is a hassle.

2/2 provides some more pin-mux settings.


Changes in v3:
  - Sort pin groups alphabetically
  - Add missing UNIPHIER_PINMUX_FUNCTION(sd) to ph1_sld8_functions

Changes in v2:
  - trivial.  Fix a typo in git-log  s/value/values/

Masahiro Yamada (2):
  pinctrl: uniphier: fix input enable settings for PH1-sLD8
  pinctrl: uniphier: add SD card pinmux settings

 drivers/pinctrl/uniphier/pinctrl-ph1-ld4.c     |   5 +
 drivers/pinctrl/uniphier/pinctrl-ph1-ld6b.c    |   5 +
 drivers/pinctrl/uniphier/pinctrl-ph1-pro4.c    |  11 ++
 drivers/pinctrl/uniphier/pinctrl-ph1-pro5.c    |   5 +
 drivers/pinctrl/uniphier/pinctrl-ph1-sld8.c    | 231 +++++++++++++------------
 drivers/pinctrl/uniphier/pinctrl-proxstream2.c |   5 +
 6 files changed, 149 insertions(+), 113 deletions(-)

-- 
1.9.1

