From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2 0/6] mcp23s08 pinconf support
Date: Fri, 28 Apr 2017 10:22:24 +0200
Message-ID: <CACRpkdZVQJ+KvoKVzfMjGeaPMJ4MT+uf3HSr5JixBx5MgJ8xeQ@mail.gmail.com>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:34679 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756318AbdD1IW1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 04:22:27 -0400
Received: by mail-io0-f174.google.com with SMTP id a103so53459724ioj.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Apr 2017 01:22:27 -0700 (PDT)
In-Reply-To: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Sebastian Reichel <sre@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 27, 2017 at 4:19 PM, Sebastian Reichel
<sebastian.reichel@collabora.co.uk> wrote:

> Back in January I sent patches adding pinconf support
> for configuring mcp23s08's pull-ups. Apart from my
> custom Raspberry Pi setup the pull-up support is also
> needed by Toby Churchill SL50.
>
> Changes since PATCHv1:
>  * Add patch moving mcp23s08 from gpio/ to pinctrl/
>  * Add patches updating config references in arch/
>  * Add patch removing pdata support for pullup config

I like this and I would like to queue it early in the v4.13 development
cycle.

> I see the following merge strategies:
>
>  a) Ignore limited bisectability and merge all
>     patches through their own subsystem. Compilation
>         should always succeed, but the blackfin boards
>         will be without mcp23s08 support with only one of
>         patch 1 and 2 being applied.
>  b) - Squash patch 1 & 2
>     - Queue that patch into gpio/pinctrl
>         - Provide immutable-branch for blackfin & arm
>         - Blackfin & ARM can pull immutable-branch & apply defconfig patch
>         - gpio/pinctrl can queue patch 5 & 6
>  c) The same as b), but squash patch 1-4 to guarantee
>     bisectability for defconfig.

Can't I just get ACKs from the blackfin and ARM SoC maintainers
for their subsystems, merge it all into pinctrl and GPIO and provide them
an immutable branch from pinctrl to pull in if they need it?

I will anyway need to have an immutable branch between pinctrl
and GPIO for this.

I expect ARM and blackfin can optimistically ignore my branch unless
they get merge conflicts.

Yours,
Linus Walleij
