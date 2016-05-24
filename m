From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10 0/2] gpio: add DT support for memory-mapped GPIOs
Date: Tue, 24 May 2016 12:43:03 +0200
Message-ID: <CACRpkdZybWKbZVaQ9hcEfb2oghMwZEq-J48hk19fb_RgtOSgKg@mail.gmail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1463172434.git.chunkeey@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, May 13, 2016 at 11:07 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> v9 -> v10:
>         - split "gpio: mmio: add DT support for memory-mapped GPIOs"
>           into two parts.
>                 - PATCH 1/2 adds the DT infrastructure
>                 - PATCH 2/2 adds the "wd,mbl-gpio" driver binding and
>                   property parser.
>         - removed "move clps711x, moxart, ts4800 and gpio-ge into gpio-mmio"

This minimal patch set looks good to me, Alexandre is this OK with you?

Yours,
Linus Walleij
