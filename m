From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: vt8500: wmt: constify gpio_chip structure
Date: Tue, 1 Aug 2017 09:58:13 +0200
Message-ID: <CACRpkdYrM95Ku1vZ7uFFi-msW_srm9+5hkzKo57EwnTEQ9UDOQ@mail.gmail.com>
References: <20170711182842.GA23293@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:34592 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbdHAH6P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 03:58:15 -0400
Received: by mail-io0-f175.google.com with SMTP id o9so5274307iod.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 00:58:15 -0700 (PDT)
In-Reply-To: <20170711182842.GA23293@embeddedgus>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 11, 2017 at 8:28 PM, Gustavo A. R. Silva
<garsilva@embeddedor.com> wrote:

> This structure is only used to copy into other structure, so declare
> it as const.
>
> This issue was detected using Coccinelle and the following semantic patch:
>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct gpio_chip i@p = { ... };
>
> @ok@
> identifier r.i;
> expression e;
> position p;
> @@
> e = i@p;
>
> @bad@
> position p != {r.p,ok.p};
> identifier r.i;
> struct gpio_chip e;
> @@
> e@i@p
>
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct gpio_chip i = { ... };
>
> In the following log you can see a significant difference in the code size
> and data segment, hence in the dec segment. This log is the output
> of the size command, before and after the code change:
>
> before:
>    text    data     bss     dec     hex filename
>    7754    2328       0   10082    2762 drivers/pinctrl/vt8500/pinctrl-wmt.o
>
> after:
>    text    data     bss     dec     hex filename
>    7472    2272       0    9744    2610 drivers/pinctrl/vt8500/pinctrl-wmt.o
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
