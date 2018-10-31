From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix possible use after free on label
Date: Wed, 31 Oct 2018 11:32:11 +0100
Message-ID: <CACRpkdbht0wn=Vy4-M-sgEbsiY-S8u3eP0s_DM+j+6vWvZG5cQ@mail.gmail.com>
References: <20181024134040.115413-1-smuchun@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024134040.115413-1-smuchun@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: smuchun@gmail.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Muchun,

thanks for your patch!

On Wed, Oct 24, 2018 at 3:41 PM Muchun Song <smuchun@gmail.com> wrote:

> gpiod_request_commit() copies the pointer to the label
> passed as an argument only to be used later. But there's a
> chance the caller could immediately free the passed string
> (e.g., local variable). This could trigger a use after free
> when we use gpio label(e.g., gpiochip_unlock_as_irq(),
> gpiochip_is_requested()).
>
> To be on the safe side: duplicate the string with
> kstrdup_const() so that if an unaware user passes an address
> to a stack-allocated buffer, we won't get the arbitrary label.
>
> Signed-off-by: Muchun Song <smuchun@gmail.com>

I am a bit worried about the memory consumption for this,
but I guess typically this should not be much.

I am a little bit lost in const-correctness here, and I do
understand that the label could point to something allocated on
the stack, but it seems like an awkward way of shooting
oneself in the foot really. Allocate something and then
pass it as a const char *? That is something we could pretty
much detect with a cocinelle script I think?

Anyways: if you want to proceed with this approach, also
make sure to fix gpiod_set_consumer_name() to free previous
label and make a new strdup when called.

Yours,
Linus Walleij
