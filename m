From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Revisiting rbtx4927: gpiod_direction_output_raw: invalid GPIO
Date: Thu, 14 Apr 2016 21:06:05 +0200
Message-ID: <CAMuHMdUARn_SxhkWiTsGdSixFv9a=VjKLLgQMfPTtxufrjepCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34258 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750705AbcDNTGH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2016 15:06:07 -0400
Received: by mail-io0-f194.google.com with SMTP id z133so12241482iod.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Apr 2016 12:06:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Nemoto-san,

I've just updated my old rbtx4927 from v3.13-rc3 to v4.6-rc3.
Surprisingly, it boots to nfsroot without any kernel changes.

However, there's an annoying warning in the boot log:

        gpiod_direction_output_raw: invalid GPIO

This is caused by the following code in arch/mips/txx9/rbtx4927/setup.c:

        static void __init rbtx4927_mem_setup(void)
        {

                /* TX4927-SIO DTR on (PIO[15]) */
                gpio_request(15, "sio-dtr");

returns -EPROBE_DEFER

                gpio_direction_output(15, 1);

VALIDATE_DESC triggers the warning.

Probably a silly GPIO conversion was missed during the last 2+ years?

I can bisect (which may take a while), but perhaps this immediately rings a bell
with someone?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
