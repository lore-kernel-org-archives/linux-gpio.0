From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] gpiolib: Free the last requested descriptor
Date: Mon, 17 Sep 2018 12:14:17 +0200
Message-ID: <CAPybu_3aaCyw9e4FJpu2r7QbGUVzDrjPmfo4oSue1Ncu0jkLGQ@mail.gmail.com>
References: <20180913133704.15739-1-ricardo.ribalda@gmail.com> <CACRpkdYgC7Z79c3swKE=ZwEUfVTC+oijKOqo5HwVdXLOsTT8Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYgC7Z79c3swKE=ZwEUfVTC+oijKOqo5HwVdXLOsTT8Mg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus
On Fri, Sep 14, 2018 at 10:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Sep 13, 2018 at 3:37 PM Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>
> > The current code only frees N-1 gpios if an error occurs during
> > gpiod_set_transitory, gpiod_direction_output or gpiod_direction_input.
> > Leading to gpios that cannot be used by userspace nor other drivers.
> >
> > Cc: Timur Tabi <timur@codeaurora.org>
> > Cc: stable@vger.kernel.org
> > Fixes: ab3dbcf78f60f46d ("gpioib: do not free unrequested descriptors)
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>
> Patch applied for fixes with Jan's Reported-by tag.

Just a heads-up

I haven't seem the patch on your kernel tree at
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/refs/heads

it is probably on your computer tree, but I wanted to make sure the
patch is not lost in the wind :P

Thanks!


>
> Yours,
> Linus Walleij



-- 
Ricardo Ribalda
