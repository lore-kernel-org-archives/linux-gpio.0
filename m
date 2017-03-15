From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH fixes v4] pinctrl: Do not check previous and current state
Date: Wed, 15 Mar 2017 11:28:11 +0100
Message-ID: <CACRpkdawrRDyL=vWs5nR4RSycPdLpUwcK-XdOa-x-6+kWM3chQ@mail.gmail.com>
References: <20170307185236.31805-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170307185236.31805-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Warren <swarren@nvidia.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 7, 2017 at 7:52 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> In case a platform only defaults a "default" set of pins, but not a
> "sleep" set of pins, and this particular platform suspends and resumes
> in a way that the pin states are not preserved by the hardware, when we
> resume, we would call pinctrl_single_resume() -> pinctrl_force_default()
> -> pinctrl_select_state() and the first thing we do is check that the
> pins state is the same as before, and do nothing.
>
> In order to fix this, just remove the p->state == state check from
> pinctrl_select_state() since it would not allow callers of this function
> to get the pins to be brought into the expected state.
>
> Fixes: 6e5e959dde0d ("pinctrl: API changes to support multiple states per device")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

I responded to some patch in the series yesterday that what we
need is to inform the pinctrl core that we lost state, so let's discuss
this in that thread.

Yours,
Linus Walleij
