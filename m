From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mcp23s08: add pinconf support
Date: Wed, 1 Feb 2017 16:12:24 +0100
Message-ID: <CACRpkdZ6Dh9wf8FXnHO5t8WnLfhLyTzNED_oRUzx=+3a0N8fQQ@mail.gmail.com>
References: <20170127144738.21107-1-sre@kernel.org> <20170127144738.21107-3-sre@kernel.org>
 <CACRpkdZyUq+v756vBhM=eu1i3ccsOrkMkEJObrt4HttmVXFkYQ@mail.gmail.com> <20170130164055.vuae4tesfepiwikd@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:35277 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdBAPM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2017 10:12:26 -0500
Received: by mail-io0-f177.google.com with SMTP id j18so158428713ioe.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2017 07:12:25 -0800 (PST)
In-Reply-To: <20170130164055.vuae4tesfepiwikd@earth>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jan 30, 2017 at 5:40 PM, Sebastian Reichel <sre@kernel.org> wrote:

>> Can we move the patch to drivers/pinctrl/* like all other mixed drivers
>> doing combined pinctrl and GPIO?
>
> Sure. Two questions:
>
>  * Should the config name change to PINCTRL_MCP23s08 (or PINCTRL_MCP23XXX)?
>    This will mean people will have to fix their .config

I never understood what the right way is to deal with this.

What happens actually when you run "make oldconfig"?

Is there a way to supply a replacement Kconfig symbol in a good
way?

Else I guess we can keep a dangling GPIO_MCP23S08 bool
that just selects the new PINCTRL_MCP23XXX for now?
With a comment that it got moved?

(Please verify that it works though...)

>  * Should there be a "SPI or I2C GPIO expanders" sub-menu for it as in the
>    gpio Kconfig?

Maybe, that would be a separate refactoring thing for later.
I think it is this one and SX150X that use I2C right now.

> I did not convert the custom caching in the regmap patch, since it
> should be done in its own cleanup patch. Introducing basic regmap
> was much more straight forward than removing the open-coded caching.

OK I take it that it will be fixed later then, that's fine.

> I guess the custom platform data based pullup config could also
> be removed. I just checked and there are not many users of the
> platform data:
>
> linux/arch $ git grep -l mcp23 | grep -v "/dts/"
> blackfin/mach-bf527/boards/tll6527m.c
> blackfin/mach-bf609/boards/ezkit.c
>
> None of them seems to use the pullups variable.

Just kill it off, good riddance!

As separate patch before/after moving it I guess.

Yours,
Linus Walleij
