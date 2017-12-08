From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] Add support for muxing individual pins
Date: Fri, 8 Dec 2017 15:40:49 +0100
Message-ID: <CACRpkdZ_TjC2zoghHpHLXY3tFGkicRGz0pyt=i0828fDs4NjWQ@mail.gmail.com>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <CACRpkdYMBan5WrEvsQDu0dveq13bW4w=3bOgS71fcFfd4e=UGA@mail.gmail.com> <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:42715 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753592AbdLHOku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Dec 2017 09:40:50 -0500
Received: by mail-it0-f46.google.com with SMTP id p139so5280602itb.1
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2017 06:40:50 -0800 (PST)
In-Reply-To: <20171208142923.2exqaateli2qmtzl@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: ext Tony Lindgren <tony@atomide.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>

On Fri, Dec 8, 2017 at 3:29 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> (...) I have finally
> managed to get some time to look over the pinctrl-single stuff.
>
> Naively one could convert the pinctrl-single stuff over to use
> the patches I proposed creating one large group for the driver
> and then mux each pin individually from within that.  However I
> am not really sure it would make sense. From the implementation
> so far the pinctrl-single stuff appears to target systems where
> there isn't really a concept of groups. Each pin is just a
> completely separate entry and you can only configure things one
> pin at a time. In that case it almost makes more sense to model
> each pin as an individual group such that it is clearly distinct
> from the others. My thinking had been more along the lines of you
> perhaps have a group that represents an I2S port but you can also
> individually assign each of those pins as a GPIO when not in use
> as the I2S port.

So then I toss the qcom driver into the game instead :)

If you look at drivers/pinctrl/qcom/* e.g. pinctrl-ipq4019.c or
essentially any of the subdrivers, you find exactly this scenario.

I am concerned that if we add infrastructure for this, it needs
to have more than one user. Qualcomm does fit your description
above I think.

Yours,
Linus Walleij
