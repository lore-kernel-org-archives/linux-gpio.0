From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Wed, 19 Sep 2018 22:23:42 -0700
Message-ID: <CACRpkdYGpEVG9gqPxNaOsD55k9idEfGaxOUrObbN9VZS06x5jw@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com> <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com> <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Timur Tabi <timur@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Sep 19, 2018 at 4:50 AM Timur Tabi <timur@kernel.org> wrote:
> On 9/18/18 11:04 PM, Ricardo Ribalda Delgado wrote:
> > And should't that be tacked in qcom hardware with something like:
> >
> > if (!priv->initialized)
> >     return INPUT;
> >
> > if you or Timur point me to the harware that was crashing I would not
> > mind looking into that, but the current situations seems to me like a
> > hack.
>
> I'd say the previous code was the hack.  My comment about not touching
> the hardware until it is properly claimed is valid, and it applies to
> all platforms.

I am a bit uncertain, I understand the reasoning that unless a GPIO line
has been "claimed" (i.e. .request() was called on it) then we should not
call any of the gpiochip callbacks.

But this is merely a convention, the gpiochip becomes what we want
it to be and it has the semantics we want it to have.

It also makes sense to inquire the direction initially so we know the
state of the hardware in the library.

I think most gpiochips easily survives calling the .get_direction()
early, Qualcomm's stand out here.

Now that we have .valid_mask in the gpiochip could we simply just
add this back, resepecting valid_mask and avoid checking the
direction of precisely these GPIOs?

Yours,
Linus Walleij
