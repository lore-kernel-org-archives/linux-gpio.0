From: Muchun Song <smuchun@gmail.com>
Subject: Re: [PATCH] gpiolib: fix possible use after free on label
Date: Wed, 31 Oct 2018 22:25:46 +0800
Message-ID: <CAPSr9jEW_+9BSFRLbqMVO=m4+AMih4cHm_AS241TjfvGcMFKAA@mail.gmail.com>
References: <20181024134040.115413-1-smuchun@gmail.com> <CACRpkdbht0wn=Vy4-M-sgEbsiY-S8u3eP0s_DM+j+6vWvZG5cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbht0wn=Vy4-M-sgEbsiY-S8u3eP0s_DM+j+6vWvZG5cQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Thanks for your review.

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2018=E5=B9=B410=E6=9C=883=
1=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:32=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi Muchun,
>
> thanks for your patch!
>
> On Wed, Oct 24, 2018 at 3:41 PM Muchun Song <smuchun@gmail.com> wrote:
>
> > gpiod_request_commit() copies the pointer to the label
> > passed as an argument only to be used later. But there's a
> > chance the caller could immediately free the passed string
> > (e.g., local variable). This could trigger a use after free
> > when we use gpio label(e.g., gpiochip_unlock_as_irq(),
> > gpiochip_is_requested()).
> >
> > To be on the safe side: duplicate the string with
> > kstrdup_const() so that if an unaware user passes an address
> > to a stack-allocated buffer, we won't get the arbitrary label.
> >
> > Signed-off-by: Muchun Song <smuchun@gmail.com>
>
> I am a bit worried about the memory consumption for this,
> but I guess typically this should not be much.

Yeah, I think so. In most cases, we pass the label, which is
in .rodata section.

>
> I am a little bit lost in const-correctness here, and I do
> understand that the label could point to something allocated on
> the stack, but it seems like an awkward way of shooting
> oneself in the foot really. Allocate something and then
> pass it as a const char *? That is something we could pretty
> much detect with a cocinelle script I think?

Some user may have more than one gpio to request
and may program the following code to request one gpio=EF=BC=9A

int gpio_request_one(int gpio)
{
        char name[8];

        snprintf(name, sizeof(name), "GPIO_%d", gpio);

        return gpio_request(gpio, name);
}

In this case, it could trigger a use after free when we use gpio label.
But the user may not realize it. With this patch applied, we can get
the right label.

>
> Anyways: if you want to proceed with this approach, also
> make sure to fix gpiod_set_consumer_name() to free previous
> label and make a new strdup when called.
>
> Yours,
> Linus Walleij

Sorry, I forgot to fix gpiod_set_consumer_name().
I will send you a patch of v2 later. Thanks.

Yours,
Muchun Song
