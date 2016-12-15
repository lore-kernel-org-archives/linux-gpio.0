From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: rcar: Fine-grained Runtime PM support
Date: Fri, 16 Dec 2016 00:12:29 +0100
Message-ID: <CACRpkdYie5oUwO+m+yj83V9CdtPAcP09Eo2-o5kvMLJQPqcufA@mail.gmail.com>
References: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
 <1984659.qgJsdhyW2B@avalon> <20161208231551.GL21834@bigcity.dyn.berto.se> <2561777.Aed1u6m3Fd@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:35548 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932771AbcLOXMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2016 18:12:31 -0500
Received: by mail-qt0-f180.google.com with SMTP id c47so72189283qtc.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2016 15:12:30 -0800 (PST)
In-Reply-To: <2561777.Aed1u6m3Fd@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>

On Fri, Dec 9, 2016 at 12:21 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 09 Dec 2016 00:15:51 Niklas S=C3=B6derlund wrote:

>> This was changed for the whole driver after the original patch was
>> applied (at the time of change the patch was not yet reverted), see [1].
>> I needed to update this when I resurrected the patch, maybe I could have
>> been more clever and reverted the revert patch but this felt cleaner, if
>> it's better to do it the other way around and revert a revert please let
>> me know so I can do so in the future.
>
> No, this is fine. I'm a bit dubious about [1] given that it consumes more=
 CPU
> cycles without any benefit as far as I can see. Maybe I can't see far eno=
ugh
> though, Linus Walleij could prove me wrong :-)

This was changed mainly for maintainability and code readability.
Lots of subsystems have the option to carry around a data poiner
and/or allocate an extra memory chunk for state containers.

I am relaxed on it, if someone very much want to use container_of()
because of $REASON I am not really bothered.

Yours,
Linus Walleij
