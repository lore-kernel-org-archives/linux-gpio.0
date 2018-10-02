From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Tue, 2 Oct 2018 09:38:05 +0200
Message-ID: <CACRpkdaccTSqpKQeUc1c6UEMo+fZmB+w0BQJL--gubrLMmKSgw@mail.gmail.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com> <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
 <ffe11a8c-368b-8c74-54a7-a088c3997032@kernel.org> <3e07cab8-0f3e-7474-8f6d-e6bb16e8f998@codeaurora.org>
 <5aea282d-6fc9-cd70-cec4-10f28aa819b9@codeaurora.org> <CAOZdJXUUWUWHzus+3sbEXbW_q92e+SSzTQJCqCyQp6Y6_HOo3g@mail.gmail.com>
 <D3E6F4C4-E1C4-4D88-B118-878576BF5281@gmail.com> <CACRpkdawwrpEe6AAfdaxw6OMFXkCnq0gpznk1Up5p1=Wigx_2g@mail.gmail.com>
 <CAPybu_1P-RWCP8yjQKkFYAX11KtYGhAfASY24Q_NZ19PD09gxA@mail.gmail.com>
 <CACRpkdaN5G4ephY+6BPLRF+aUrO4-sPa+2erRYrwTGwPBwu8fw@mail.gmail.com> <CAPybu_33WNiCdkwgNtkiTP2PL+9ai85Z2LiMB6yqNZrV5JdmXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_33WNiCdkwgNtkiTP2PL+9ai85Z2LiMB6yqNZrV5JdmXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: timur@kernel.org, jhugo@codeaurora.org, Stephen Boyd <swboyd@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 2, 2018 at 9:15 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> On Mon, Oct 1, 2018 at 11:20 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > gpiochip_add_data() doesn't allocate anything, it
> > just adds a already allocated (or static!) gpio_chip
> > to the gpiolib subsystem.
>
> Take a look to gpiochip_add_data_with_key()
>   ->gpiochip_init_valid_mask()
>        -> gpiochip->valid_mask = gpiochip_allocate_mask(gpiochip);

Aha I see...

> > In fact I think it is wrong to set up the mask after
> > calling gpiolob_add_data(), because of exactly the
> > type of problem you're seeing.
>
> I agree, and I believe that the cleaner way would be to add a function
> pointer that replaces:
>
> gpiochip_allocate_mask()
>   bitmap_fill(p, chip->ngpio);
>
> with a proper initalization from the driver

OK

> But as today the only driver that seems to be using valid_mask is msm,
> so perhaps a hack is something better and then when we have a second
> driver that requires it we figure out the real requirements. But it is
> definately your decision ;)

I would just add some exported function to gpiolib to do what you
need so you can set up the valid_mask before calling
gpiochip_add*.

Yours,
Linus Walleij
