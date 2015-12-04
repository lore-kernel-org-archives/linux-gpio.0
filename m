From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] gpio: rcar: Miscellaneous updates
Date: Fri,  4 Dec 2015 16:33:51 +0100
Message-ID: <1449243233-11089-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:46792 "EHLO
	xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755130AbbLDPdy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 10:33:54 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus, Alex,

Here are two updates for the Renesas R-Car GPIO driver.
I combined them in one series, as the second patch depends on the first.

Thanks for applying!

Geert Uytterhoeven (2):
  gpio: rcar: Remove obsolete platform data support
  gpio: rcar: Improve clock error handling and reporting

 drivers/gpio/gpio-rcar.c                | 88 ++++++++++++++-------------------
 include/linux/platform_data/gpio-rcar.h | 29 -----------
 2 files changed, 36 insertions(+), 81 deletions(-)
 delete mode 100644 include/linux/platform_data/gpio-rcar.h

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
