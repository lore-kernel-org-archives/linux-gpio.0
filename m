From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Wed, 23 Aug 2017 09:32:28 +0200
Message-ID: <CACRpkdaa7JXhjgGxG=eMZxh2kfC3MJ4O_Sc5h5qZsmL5sWNVmg@mail.gmail.com>
References: <cover.1503319573.git.lukas@wunner.de> <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33922 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753329AbdHWHc3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 03:32:29 -0400
Received: by mail-oi0-f49.google.com with SMTP id j144so8968794oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2017 00:32:29 -0700 (PDT)
In-Reply-To: <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>

On Mon, Aug 21, 2017 at 3:12 PM, Lukas Wunner <lukas@wunner.de> wrote:

> A common idiom is to assign a value to a bit with:
>
>     if (value)
>         set_bit(nr, addr);
>     else
>         clear_bit(nr, addr);
>
> Likewise common is the one-line expression variant:
>
>     value ? set_bit(nr, addr) : clear_bit(nr, addr);
>
> Commit 9a8ac3ae682e ("dm mpath: cleanup QUEUE_IF_NO_PATH bit
> manipulation by introducing assign_bit()") introduced assign_bit()
> to the md subsystem for brevity.
>
> Make it available to others, in particular gpiolib and the upcoming
> driver for Maxim MAX3191x industrial serializer chips.
>
> Cc: Bart Van Assche <bart.vanassche@wdc.com>
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Looks reasonable.

> +static __always_inline void assign_bit(bool value, long nr,
> +                                      volatile unsigned long *addr)
> +{
> +       if (value)
> +               set_bit(nr, addr);
> +       else
> +               clear_bit(nr, addr);
> +}
> +
> +static __always_inline void __assign_bit(bool value, long nr,
> +                                        volatile unsigned long *addr)
> +{
> +       if (value)
> +               __set_bit(nr, addr);
> +       else
> +               __clear_bit(nr, addr);
> +}

What I have never understood is the semantic difference between
bitop_foo() and __bitop_foo().

And I even use them quite a lot.

Can someone explain when I use the bitop_foo() and when I
use the __bitop_foo(). I am asking so I can understand patch
2/4 in this series.

I guess this is why I generally detest the __annotation, since it is
so unspecific and unclear, but that is not something I expect you
to solve in this patch.

Yours,
Linus Walleij
