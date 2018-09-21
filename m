From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Fri, 21 Sep 2018 09:07:38 -0700
Message-ID: <CACRpkdYV+A9rUZvYN_Vh3wD6Vb73qj8=SkHJCJ0ZiTWP5Ojw1A@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com> <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
 <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org> <CACRpkdYGpEVG9gqPxNaOsD55k9idEfGaxOUrObbN9VZS06x5jw@mail.gmail.com>
 <bcb79947-dfe0-e5e2-fb48-3b6992720f01@kernel.org> <CACRpkdbz0hyjy5U3-xo8Oi-ojB_H3=DEwuJtmoqJTJQNiAYYaA@mail.gmail.com>
 <27c8e13a-44bf-18b5-083b-25b87d7b8605@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27c8e13a-44bf-18b5-083b-25b87d7b8605@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 20, 2018 at 7:05 PM Timur Tabi <timur@kernel.org> wrote:
> On 9/20/18 5:36 PM, Linus Walleij wrote:
> > What I mean is that $SUBJECT patch might not hurt Qualcomms
> > GPIOs (not crash the platform) if and only if it is augmented to not
> > try to get the initial direction from lines masked off in .valid_mask
> > if .need_valid_mask is true.
> >
> > Whether it makes sense semantically is a different debate, but it
> > seems possible to reintroduce calling .get_direction() without
> > hurting anyone.
>
> That means that all the logic for checking valid_mask needs to be added
> to the chip driver's .get_direction() function.  We can add that logic
> to msm_gpio_get_direction (at one point, I had a patch that did that,
> but it was rejected).

Nah, what is in patch v2 is better, just checking it when we need to.

> My concern is: what if a driver depends on a .request call being made
> (in order to configure muxes, for example) before touching the hardware?

Hm. That is a good question.

I wonder if we have that problem in practice. If this happens, maybe the
driver needs to keep track of stuff a bit. I think if we just loop request
over everything we could disturb other mux set-up.

> I wonder if this is something that really should be handled in the
> driver's .probe function.  The driver should collect that information
> and pass it to add_data.

I see the idea, but it seems complicated compared to just calling
the callbacks. Let's try the v2 patch approach first.

Yours,
Linus Walleij
