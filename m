From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/2] MIPS: TXx9: Move GPIO setup from .mem_setup() to .arch_init()
Date: Sun, 11 Sep 2016 10:48:31 +0200
Message-ID: <1473583713-10275-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:57070 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751425AbcIKIsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2016 04:48:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Ralf, Nemoto-san,

After upgrading my good old rbtx4927 from v3.13-rc3 to v4.6-rc3, I
noticed the following warning:

	gpiod_direction_output_raw: invalid GPIO

This is caused by the following code in arch/mips/txx9/rbtx4927/setup.c:

	static void __init rbtx4927_mem_setup(void)
	{

		/* TX4927-SIO DTR on (PIO[15]) */
		gpio_request(15, "sio-dtr");

returns -EPROBE_DEFER

		gpio_direction_output(15, 1);

VALIDATE_DESC triggers the warning.

Note that as of commit 54d77198fdfbc4f0 ("gpio: bail out silently on
NULL descriptors") the warning message is no longer printed, but the
underlying issue is still there.

Nemoto-san pointed out that the GPIO setup may now be done too early,
and that indeed is the case.  Hence the following patch series postpones
GPIO setup from .mem_setup() time to .arch_init() time to fix it, for
all TXx9 platforms.

Changes since v1:
  - Add Acked-by.

This has been tested on RBTX4927 only.

Thanks!

Geert Uytterhoeven (2):
  MIPS: TXx9: tx39xx: Move GPIO setup from .mem_setup() to .arch_init()
  MIPS: TXx9: tx49xx: Move GPIO setup from .mem_setup() to .arch_init()

 arch/mips/txx9/generic/setup_tx3927.c |  1 -
 arch/mips/txx9/generic/setup_tx4927.c |  1 -
 arch/mips/txx9/generic/setup_tx4938.c |  1 -
 arch/mips/txx9/jmr3927/setup.c        | 11 +++++++++--
 arch/mips/txx9/rbtx4927/setup.c       | 32 ++++++++++++++++++++++----------
 arch/mips/txx9/rbtx4938/setup.c       |  1 +
 6 files changed, 32 insertions(+), 15 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
