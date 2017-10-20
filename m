From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: brcmstb: Do not use gc->pin2mask()
Date: Fri, 20 Oct 2017 18:39:47 +0200
Message-ID: <CACRpkdaHx+=B=0xigumJieOOm99O=vuDQ-ZxFKjh7DGLxtjBtA@mail.gmail.com>
References: <20171020134817.28040-1-linus.walleij@linaro.org> <CADtm3G71v3J9V==bAJBr-xxR2c3iWL32eh0dSg7o2v2C0oAQ2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:57155 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752542AbdJTQjt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Oct 2017 12:39:49 -0400
Received: by mail-it0-f46.google.com with SMTP id r127so14070585itb.5
        for <linux-gpio@vger.kernel.org>; Fri, 20 Oct 2017 09:39:48 -0700 (PDT)
In-Reply-To: <CADtm3G71v3J9V==bAJBr-xxR2c3iWL32eh0dSg7o2v2C0oAQ2w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Doug Berger <opendmb@gmail.com>

On Fri, Oct 20, 2017 at 5:51 PM, Gregory Fong <gregory.0xf0@gmail.com> wrote:
> Hi Linus,
>
> On Fri, Oct 20, 2017 at 6:48 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> The pin2mask() accessor only shuffles BIT ORDER in big endian systems,
>> i.e. the bitstuffing is swizzled big endian so "bit 0" is bit 7 or
>> bit 15 or bit 31 or so.
>>
>> The brcmstb only uses big endian BYTE ORDER which will be taken car of
>> by the ->write_reg() callback.
>>
>> Just use BIT(offset) to assign the bit.
>
> I believe the patches that Doug is putting together already take care
> of this, would you be OK with it being handled in there instead?

I would prefer that those changes base on top of this instead.

I need to get rid of ->pin2mask() for other GPIO improvements in
the core, like supporting .get_multiple() in gpio-mmio.

I can apply this to the devel branch per immediately so Doug can base
his work on top of it.

Yours,
Linus Walleij
