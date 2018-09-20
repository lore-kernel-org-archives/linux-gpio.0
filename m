From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Thu, 20 Sep 2018 15:43:46 -0700
Message-ID: <CACRpkdYHJT+C+M3wBr-zR=O9DYM4uVMqprCW8gXSiTMPJhzFnQ@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com> <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
 <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org> <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
 <015715f7-64bc-aca6-77fe-68ddb6c938a8@kernel.org> <CAPybu_2ovB3T1fOD2gP9rM46z37WVuOuzu5FyKamfyMWoVg=yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_2ovB3T1fOD2gP9rM46z37WVuOuzu5FyKamfyMWoVg=yw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Timur Tabi <timur@tabi.org>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 20, 2018 at 7:14 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> On Thu, Sep 20, 2018 at 2:20 PM Timur Tabi <timur@tabi.org> wrote:

> > Users are expected to program the direction for every GPIO they want to
> > use, regardless of whatever it's set to before they open it.
>
> I do not agree that the user should program the direction of a GPIO
> which direction cannot be used.
>
> Also I am not talking about programming a gpio, I am talking about an
> technician  connecting portA to portB and burning something because
> the system provided erroneous information

So what is clear is that your need, I guess in userspace, reliable
information about the direction of the GPIOs at boot.

> > Because calling that API before properly claiming the GPIO is a
> > programming error.
>
> Is there a place where this API is defined?. Which functions require
> to be defined.? What is the correct order.?

There is nothing like such. We would have to establish semantics.
I don't see a point in it, the APIs are for using and understanding,
not for discussing API contracts. I would avoid trying to etch this
API in stone.

> > The reason why the Qualcomm driver is impacted the most is because on
> > ACPI platforms, the GPIO map is "sparse".  That is, not every GPIO
> > between 0 and n-1 actually exists.  So reading a GPIO that doesn't exist
> > is invalid.
>
> Why are we adding GPIOs that are invalid?
> If you can figure out that a GPIO is invalid when the user claims a
> gpio, you can also figure it out when the user asks the direction.

Right and that is what the (later introduced) valid_mask
can do.

Any time we call into any of the callbacks that take an offset
we should (theoretically) check the .valid_mask if active.

Since we normally check it when requesting the GPIO, we
can't request invalid GPIOs and normally the other callbacks
would only get called after that, so we are fine.

> > I'm not sure how to properly fix this, but I wonder if we need some kind
> > of late-stage initialization where gpiolib scans all the GPIOs by
> > claiming them first, reading the directions, and then releasing them.
>
> That sounds like a good compromise. Or returning
> -unconfigured / unknown
>
> is also an option.

I would just skip over anything asked off in the valid_mask.

I feel positive of a version of this patch that respect valid_mask
some way, as that should be safe for Qualcomms usecase.

Rough consensus and running code.

Yours,
Linus Walleij
