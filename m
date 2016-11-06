From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Sun, 6 Nov 2016 11:11:30 +0100
Message-ID: <CACRpkdbwCMWum8Co91DnL0GgOvihud1M3HnPZTdRvKoj_RRWbA@mail.gmail.com>
References: <20160916135808.GA17518@lukather> <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather> <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
 <20160923210549.GY8719@lukather> <20161026154928.hu6rjalw7syrvbvg@lukather>
 <CACRpkda=_TD5S7N52CSYrmKvkY5WLU4Qi47_a=K+8Ud+kmphqg@mail.gmail.com> <20161102213142.ajano4g4oizusv74@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:34477 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751530AbcKFKLc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2016 05:11:32 -0500
Received: by mail-qt0-f182.google.com with SMTP id n6so72302147qtd.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2016 02:11:31 -0800 (PST)
In-Reply-To: <20161102213142.ajano4g4oizusv74@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

On Wed, Nov 2, 2016 at 10:31 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> So no, I really don't think the DT ABI matters here, or at least
> compared to the bug we face and the changes that we would need to make
> in order to fix it. But Mark will probably disagree.

In this case we have to think about that it is a community effort driving
DT standardization for the community, the company Allwinner is not
actively involved.

I think etching DT bindings in stone is for companies shipping products.
Those decisions will affect their internal company culture and therefore
we exercise pressure on them as a standards body. It is a clear message
that they need to work together to standardize and take responsibility for
what they ship.

For community efforts just wanting to have a nice and upstream-compliant
structure on things, the requirements for ABI should be lower. Getting the
community code to even run on the device is a hacker undertaking already
in the first place, and the community is using their precious free time for
this.

Yours,
Linus Walleij
