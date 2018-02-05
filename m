From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] net: mediatek: Explicitly include pinctrl headers
Date: Mon, 5 Feb 2018 20:02:40 +0100
Message-ID: <CACRpkdYrG6=qwJgOTW2ccyq-UBSOkH+EBBui54PtGqJF7CMRDw@mail.gmail.com>
References: <20180205124750.19305-1-thierry.reding@gmail.com>
 <20180205125436.24005-1-thierry.reding@gmail.com> <CA+55aFy--bQRDZEUsBfiWhyP+Of3+s4zEcKo1T8cCoAMXBrwsw@mail.gmail.com>
 <20180205175906.GA8237@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180205175906.GA8237@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-gpio@vger.kernel.org, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 5, 2018 at 6:59 PM, Thierry Reding <thierry.reding@gmail.com> wrote:

> Anyway, I think going with the pinctrl/devinfo.h include only is fine
> for now. If it turns out that the Mediatek ethernet and Rockchip LVDS
> drivers can just omit the bits fiddling with struct dev_pin_info, we can
> swap out the pinctrl/devinfo.h include for pinctrl/consumer.h at that
> time.
>
> LinusW: what are your thoughts on the struct dev_pin_info usage by these
> drivers? Does their code seem redundant to you, too?

I don't think they should use struct dev_pin_info at all,
that thing is for the device core only.

I like to think that <linux/pinctrl/consumer.h> is for drivers that
explicitly grab and control pin control states so this driver should
only include <linux/pinctrl/consumer.h>.

Torvalds: can you do it like that instead? Either way will
make the compile work again, we can also tidy it up later.
(i.e. I will grep for includes of pinctrl/dev_info.h and replace
it with consumer.h) at some point.

It wasn't pretty that these drivers were relying on implicit
#includes in the first place so either is anyway prettier than
what it used to look like.

In a way I kind of like this sideffect even if it broke some
compiles.

Yours,
Linus Walleij
