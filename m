From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Thu, 20 Sep 2018 15:36:26 -0700
Message-ID: <CACRpkdbz0hyjy5U3-xo8Oi-ojB_H3=DEwuJtmoqJTJQNiAYYaA@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com> <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
 <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org> <CACRpkdYGpEVG9gqPxNaOsD55k9idEfGaxOUrObbN9VZS06x5jw@mail.gmail.com>
 <bcb79947-dfe0-e5e2-fb48-3b6992720f01@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bcb79947-dfe0-e5e2-fb48-3b6992720f01@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 20, 2018 at 5:35 AM Timur Tabi <timur@kernel.org> wrote:
> On 9/20/18 12:23 AM, Linus Walleij wrote:
> > I think most gpiochips easily survives calling the .get_direction()
> > early, Qualcomm's stand out here.
> >
> > Now that we have .valid_mask in the gpiochip could we simply just
> > add this back, resepecting valid_mask and avoid checking the
> > direction of precisely these GPIOs?
>
> Can you be more specific?  One of the proposals made previously was to
> add a check in msm_gpio_get_direction(), but that was rejected because
> the consensus was the valid_mask checks in gpiolib are sufficient.

What I mean is that $SUBJECT patch might not hurt Qualcomms
GPIOs (not crash the platform) if and only if it is augmented to not
try to get the initial direction from lines masked off in .valid_mask
if .need_valid_mask is true.

Whether it makes sense semantically is a different debate, but it
seems possible to reintroduce calling .get_direction() without
hurting anyone.

Yours,
Linus Walleij
