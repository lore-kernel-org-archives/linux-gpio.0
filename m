From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] gpio: 74x164: Misc improvements
Date: Mon, 30 Nov 2015 15:35:24 +0100
Message-ID: <1448894126-9309-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:54171 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754071AbbK3Ofc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2015 09:35:32 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus, Alex,

This patch series contains two improvements to the 74x164 GPIO driver.
It was tested with 2 daisy-chained 74HC595 shift registers, connected to
a Renesas MSIOF SPI master, which cannot keep its hardware chip select
asserted in between multiple transfers without using cs-gpios.

Thanks!

Geert Uytterhoeven (2):
  gpio: 74x164: Allocate buffer with gen_74x164_chip
  gpio: 74x164: Use a single SPI transfer instead of multiple transfers

 drivers/gpio/gpio-74x164.c | 69 +++++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 44 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
