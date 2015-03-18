From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] gpio: rcar: Fix wake up using gpio-keys with PM domain
Date: Wed, 18 Mar 2015 19:41:06 +0100
Message-ID: <1426704069-26389-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:41997 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755106AbbCRSlL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 14:41:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi,

This patch series contains a few cleanups and updates for the Renesas
R-Car GPIO driver, and fixes wake-up from s2ram using gpio-keys when
using a PM Domain to manage the module clock.

It was tested on r8a7791/koelsch.

Thanks!

Geert Uytterhoeven (3):
  gpio: rcar: Use local variable gpio_chip in gpio_rcar_probe()
  gpio: rcar: Add more register documentation
  gpio: rcar: Prevent module clock disable when wake-up is enabled

 drivers/gpio/gpio-rcar.c | 63 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 17 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
