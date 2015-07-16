From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] ARM: shmobile: r8a73a4 dtsi: Add missing
 "gpio-ranges" to gpio node
Date: Thu, 16 Jul 2015 11:42:06 +0200
Message-ID: <CACRpkdbB6mLZAxpvPq8X5cWVLYD05ruF2XbwZSYn16Kj8tXvdQ@mail.gmail.com>
References: <1435650327-2542-1-git-send-email-geert+renesas@glider.be>
	<1435650327-2542-2-git-send-email-geert+renesas@glider.be>
	<32630741.rNENluEsDE@avalon>
	<CAMuHMdX4=C6DsbsaphndXQuPm8WFqv08kwq+cdQRJJQtDph1cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:36321 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754759AbbGPJmH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 05:42:07 -0400
Received: by obnw1 with SMTP id w1so43526708obn.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 02:42:06 -0700 (PDT)
In-Reply-To: <CAMuHMdX4=C6DsbsaphndXQuPm8WFqv08kwq+cdQRJJQtDph1cg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alexandre Courbot <gnurou@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Benoit Parrot <bparrot@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Jul 14, 2015 at 2:05 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Jun 30, 2015 at 11:49 AM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:

>>> To fix this, add a "gpio-ranges" property to the gpio device node, so
>>> the ranges are added by of_gpiochip_add_pin_range(), which is called by
>>> of_gpiochip_add() before the call to of_gpiochip_scan_hogs().
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> This looks sane to me, even though referencing the same DT node seems a bit
>> dodgy. I'll let Linus comment on that, but for the implementation itself,
>>
>> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Thank you!
>
> Any wise words from Linus?

I don't know if I'm wise but I'm OK with this:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
