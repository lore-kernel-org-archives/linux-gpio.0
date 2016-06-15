From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] pinctrl: uniphier: two more fixes for UniPhier pin data
Date: Wed, 15 Jun 2016 17:18:04 +0900
Message-ID: <1465978686-28578-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:37641 "EHLO
	conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429AbcFOITI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2016 04:19:08 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Masahiro Yamada (2):
  pinctrl: uniphier: prohibit drive control for pin 61-66 of PH1-LD11
  pinctrl: uniphier: fix meaningless drive control offsets

 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 12 ++++++------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

-- 
1.9.1

