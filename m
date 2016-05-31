From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving pinctrl node under syscon for UniPhier pinctrl driver
Date: Tue, 31 May 2016 10:18:48 +0200
Message-ID: <CACRpkdY_5mK29fvnqnXQLXDJyWzCPui5rApAa3v=uoa6+zG3fQ@mail.gmail.com>
References: <CAK7LNARp2t8y=8OaCTLG3ozBO-ZpyxVdEpo2M74TQ9ctcSnepQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:32958 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755520AbcEaISu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2016 04:18:50 -0400
Received: by mail-oi0-f53.google.com with SMTP id k23so292087769oih.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2016 01:18:49 -0700 (PDT)
In-Reply-To: <CAK7LNARp2t8y=8OaCTLG3ozBO-ZpyxVdEpo2M74TQ9ctcSnepQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 24, 2016 at 6:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, the pinctrl node is a syscon node,
> but I noticed that it should be moved under the syscon node
> to ease my next development.

OK

>     pinctrl {
>             compatible = "socionext,foo-pinctrl", "syscon";
>             ....
>     };
>
>
> New DT
> ------
>
>     soc_glue {
>             compatible = "socionext,foo-socglue", "syscon",
>                          "simple-mfd";
>             pinctrl {
>                     compatible = "socionext,foo-pinctrl";
>             };
>
>             phy {
>                      .....
>             };
>     }
>
>
> (The "soc_glue" node is a syscon node
> that consists of a bunch of system-configuration registers,
> such as pinctrl, some phys, and some misc registers.
> Various registers are mixed in one hardware block,
> so it is difficult to split it.)

Yeah that is what "simple-mfd" is for.

> But, this effectively breaks the current DT binding.

Does it really? What matters is if it still works after the change.

> [1] Add the new binding support with a new compatible string.
>     (note the old binding is still supported for backward compatibility)
>
> [2] Wait a couple of releases, keeping both of the two bindings
>
> [3] Drop the old binding support
>
> If it is OK, I want to move it forward.

It is OK with *ME* because I'm just the GPIO maintainer and I'm
not really picky about breaking DT ABI's, I think you need to crack
a few eggs to make an omelet from time to time.

The problem is rather the devicetree people: do *THEY* accept
this?

Yours,
Linus Walleij
