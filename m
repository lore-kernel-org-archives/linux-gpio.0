From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/9 v2] sh-pfc: modify PINMUX_IPSR_MSEL() and r8a7795 support
Date: Thu, 3 Sep 2015 09:23:07 +0200
Message-ID: <CAMuHMdWC65qrYxdvxn2UBy5GTG+ECV0L6oxE5BmzHgjDa5m7zw@mail.gmail.com>
References: <87oahkql0v.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36630 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbbICHXI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2015 03:23:08 -0400
In-Reply-To: <87oahkql0v.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

Hi Morimoto-san,

On Thu, Sep 3, 2015 at 4:48 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> These are v2 of r8a7795 PFC support.
>
> r8a7795 needs 1) 8) 9)
> 2) - 7) are cleanup patches, but not related to r8a7795
>
> This time r8a7795 PFC driver is using many macros.
> I took precedence "readable code" more than "80 character".
> These macro are same as "datasheet" style. So, I believe review is easy.
>
> Kuninori Morimoto (9):
>       1) sh-pfc: modify PINMUX_IPSR_MSEL() macro order
>       2) sh-pfc: pfc-sh7734: use PINMUX_IPSR_MSEL()
>       3) sh-pfc: pfc-r8a7794: use PINMUX_IPSR_MSEL()
>       4) sh-pfc: pfc-r8a7791: use PINMUX_IPSR_MSEL()
>       5) sh-pfc: pfc-r8a7790: use PINMUX_IPSR_MSEL()
>       6) sh-pfc: pfc-r8a7779: use PINMUX_IPSR_MSEL()
>       7) sh-pfc: remove unused PINMUX_IPSR_MODSEL_DATA()
>       8) sh-pfc: Initial R8A7795 PFC support
>       9) sh-pfc: r8a7795: add SCIFx support

Thank you.

Imported as renesas-drivers#topic/r8a7795-pfc-v2.

P.S. Renamed topic/r8a7795-pfc-v1 to topic/r8a7795-pfc-rfc,
             topic/r8a7795-pfc-v2 to topic/r8a7795-pfc-v1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
