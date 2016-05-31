From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: copy per-pin driver private data to struct pin_desc
Date: Tue, 31 May 2016 10:28:24 +0200
Message-ID: <CACRpkdb=oo3AyO-fDicAUmpwXxxAmGgC-kKN30JZ=XaSVuFRRw@mail.gmail.com>
References: <1464152971-11533-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464152971-11533-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 25, 2016 at 7:09 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Currently, struct pinctrl_pin_desc can have per-pin driver private
> data, but it is not copied to struct pin_desc.
>
> For a driver with sparse pin space, for-loop search like below would
> be necessary in order to get the driver-specific data for a desired
> pin number.
>
>   for (i = 0; i < pctldev->desc->npins; i++)
>           if (pin_number == pctldev->desc->pins[i].number)
>                   return pctldev->desc->pins[i].drv_data;
>
> This is not efficient for a driver with a large number of pins.
> So, copy the data to struct pin_desc when each pin is registered
> for the faster radix tree lookup.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks useful. I was a bit hesitant since the patch does not make
use of the new member, but I guess you need this for future
patches so applied it anyways. The refactoring looks nice in
all ways.

Yours,
Linus Walleij
