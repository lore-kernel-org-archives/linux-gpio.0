From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: Do not use gc->pin2mask()
Date: Fri, 20 Oct 2017 08:51:49 -0700
Message-ID: <CADtm3G71v3J9V==bAJBr-xxR2c3iWL32eh0dSg7o2v2C0oAQ2w@mail.gmail.com>
References: <20171020134817.28040-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:49801 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752425AbdJTPwV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 11:52:21 -0400
Received: by mail-wm0-f53.google.com with SMTP id b189so22650879wmd.4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 08:52:20 -0700 (PDT)
In-Reply-To: <20171020134817.28040-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Doug Berger <opendmb@gmail.com>

Hi Linus,

On Fri, Oct 20, 2017 at 6:48 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
> i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
> bit 15 or bit 31 or so.
>
> The brcmstb only uses big endian BYTE ORDER which will be taken car of
> by the ->write_reg() callback.
>
> Just use BIT(offset) to assign the bit.

I believe the patches that Doug is putting together already take care
of this, would you be OK with it being handled in there instead?

Thanks,
Gregory
