From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Thu, 27 Oct 2016 14:12:45 +0200
Message-ID: <CACRpkda=_TD5S7N52CSYrmKvkY5WLU4Qi47_a=K+8Ud+kmphqg@mail.gmail.com>
References: <20160916135808.GA17518@lukather> <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather> <CACRpkdY_YVhHuMwx=mwPVyHNpLveg7Gikc0uznUhsKBCYJwzzw@mail.gmail.com>
 <20160923210549.GY8719@lukather> <20161026154928.hu6rjalw7syrvbvg@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:36495 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965156AbcJ0OCF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2016 10:02:05 -0400
Received: by mail-qk0-f171.google.com with SMTP id o68so45833712qkf.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2016 07:02:05 -0700 (PDT)
In-Reply-To: <20161026154928.hu6rjalw7syrvbvg@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

On Wed, Oct 26, 2016 at 5:49 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> In order not to break the DT, we looked at the code of pin_request
> (which is the one using the strict flag), and went to the conclusion
> that it needs to be amended to check the owner based on the device
> structure pointer.
(...)
> Which means that in order to avoid removing one property from a DT to
> fix an actual bug that can cause real stability issues to Linux, we
> end up reworking the gpiolib API and fixing all the users.

DT backward compatibility is for one case: when devices are shipped
with a DT burnt into ROM/flash. Is that happening?

If Allwinner or their subvendors are not shipping devcie trees - i.e. if
this a community-only effort and you're just building and booting the
DT+kernel on all these devices, by all means break the ABI if it
makes sense. Noone is going to complain.

Then we can discuss backward compatibility the day Allwinner start
shipping device trees, not now.

Yours,
Linus Walleij
