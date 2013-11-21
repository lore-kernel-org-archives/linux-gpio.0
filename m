From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 0/2] gpio: davinci: preparation fixes and updates to reuse it for Keystone
Date: Thu, 21 Nov 2013 17:34:34 +0200
Message-ID: <1385048076-7875-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:47189 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750827Ab3KUPiI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 10:38:08 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: prabhakar.csengg@gmail.com, nsekhar@ti.com, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

This series is a preparation step for reusing Davinci GPIO driver
for Keystone SoCs.
And it's been created in order to break the strict dependency of
Davinci GPIO driver from Davinci platform code.

Based on patch:
http://www.spinics.net/lists/kernel/msg1632405.html

Grygorii Strashko (2):
  gpio: davinci: get rid of DAVINCI_N_GPIO
  gpio: introduce GPIO_DAVINCI kconfig option

 drivers/gpio/Kconfig        |    7 +++++++
 drivers/gpio/Makefile       |    2 +-
 drivers/gpio/gpio-davinci.c |    4 ++--
 3 files changed, 10 insertions(+), 3 deletions(-)

-- 
1.7.9.5

