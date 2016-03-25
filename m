From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] tools/gpio: Add missing initialization of device_name
Date: Fri, 25 Mar 2016 13:36:28 +0100
Message-ID: <1458909390-2686-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:45714 "EHLO
	michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752769AbcCYMga (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2016 08:36:30 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Linus, Alex,

This small series enables compiler optimization for the GPIO tools, to
catch more bugs, and fix the bug found by it.

Geert Uytterhoeven (2):
  tools/gpio: Enable compiler optimization to catch more bugs
  tools/gpio: Add missing initialization of device_name

 tools/gpio/Makefile | 2 +-
 tools/gpio/lsgpio.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
