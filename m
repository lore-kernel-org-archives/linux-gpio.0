From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: Use u32 to store register data
Date: Mon, 9 Mar 2015 18:56:38 +0100
Message-ID: <CAMuHMdXFBwvyrWter-T49tJyQGe-EJQEEqeNCTB=0ivh4SrbpQ@mail.gmail.com>
References: <1425058685-12956-1-git-send-email-geert+renesas@glider.be>
	<1425058685-12956-4-git-send-email-geert+renesas@glider.be>
	<CACRpkdbDNu55E6Cd+w29koWiQQ=wpAkG_feg6ap2U_LuBgYueg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:43581 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751582AbbCIR4j (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 13:56:39 -0400
In-Reply-To: <CACRpkdbDNu55E6Cd+w29koWiQQ=wpAkG_feg6ap2U_LuBgYueg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>

Hi Linus,

On Mon, Mar 9, 2015 at 5:37 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Feb 27, 2015 at 6:38 PM, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
>> As PFC registers are either 8, 16, or 32 bits wide, use u32 (mostly
>> replacing unsigned long) to store (parts of) register values and masks.
>>
>> Switch the shadow register operations from {set,clear}_bit() to plain C
>> bit operations, as the former can operate on long data only.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Patch applied with Laurent's ACK.

Thanks!

I will post the reworked/new patches when I see your published branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
