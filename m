From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: nomadik: abx500: constify gpio_chip structure
Date: Tue, 1 Aug 2017 09:59:11 +0200
Message-ID: <CACRpkdZmUMRWZLak+3u3uGNyPDBmxqe6GH-aV2V1medoKmebBg@mail.gmail.com>
References: <20170711212929.GA1037@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34792 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbdHAH7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 03:59:13 -0400
Received: by mail-io0-f174.google.com with SMTP id o9so5282674iod.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 00:59:13 -0700 (PDT)
In-Reply-To: <20170711212929.GA1037@embeddedgus>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Alessandro Rubini <rubini@unipv.it>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 11, 2017 at 11:29 PM, Gustavo A. R. Silva
<garsilva@embeddedor.com> wrote:

> This structure is only used to copy into another structure, so declare
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
>   17545    5376       0   22921    5989 drivers/pinctrl/nomadik/pinctrl-abx500.o
>
> after:
>             bss     dec     hex filename
>   17273    5320       0   22593    5841 drivers/pinctrl/nomadik/pinctrl-abx500.o
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
