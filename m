From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/2] r8a7795 pinctrl: Add drive strength support
Date: Thu, 31 Mar 2016 10:41:24 +0200
Message-ID: <CAMuHMdVSU1b9ZuG6Z3kqBP=SfvOCOjFV1k=4XwKR_U7FvDC3FA@mail.gmail.com>
References: <1458741961-4039-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<CACRpkdZdmEwfbU1zyTzNHRHAm8xep8oUDveinKLVewYD75Mg5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33287 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751866AbcCaIlZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:41:25 -0400
In-Reply-To: <CACRpkdZdmEwfbU1zyTzNHRHAm8xep8oUDveinKLVewYD75Mg5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Linus,

On Thu, Mar 31, 2016 at 10:34 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Wed, Mar 23, 2016 at 3:05 PM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
>
>> This patch series adds drive strength control support to the sh-pfc driver for
>> the R8A7795 (R-Car H3) SoC.
>
> LooksGoodToMe(TM)

Thanks!

> Geert, are you queuing a pull request to me or do you think
> Renesas activity is down to a level where I can return to applying
> PFC patches directly to my tree?

Already queued up in sh-pfc-for-v4.7.

It depends on how many pull requests you want to see during a release
cycle ;-)
Do you already want a pull request now?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
