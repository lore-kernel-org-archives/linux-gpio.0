From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Really force states during suspend/resume
Date: Thu, 23 Feb 2017 11:30:06 +0100
Message-ID: <CACRpkdaUMGy1s24hsrs0wCr8s7Di_9WSmrsM8is784deChnr9g@mail.gmail.com>
References: <20170208011759.15478-1-f.fainelli@gmail.com> <CAHp75VejE9ofBBSbKraon96pWDg7a00TJgViS-m6BGO4p0_E8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VejE9ofBBSbKraon96pWDg7a00TJgViS-m6BGO4p0_E8A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Al Cooper <alcooperx@gmail.com>, Stephen Warren <swarren@nvidia.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 8, 2017 at 10:46 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Btw, I have got similar issue and thinking about those states they are
> quite orthogonal to the pin states. Wouldn't be better to actually
> differentiate PM related states and pin states?

I don't fully understand what you mean here, but I like the sound
of it.

"sleep" and "default" were traditionally related to the system
suspend/resume states. It was suggested that the core handle this
automatically, but it doesn't work because of things like that
userspace can disable a TTY/UART and then it should sleep,
regardless of the state of the system.

Runtime PM "sleep" and "resume" is closer to what we want to
achieve here, and might be a good integration point.
(CC:ing Ulf, he's looking into things like this.)

> In my case I have a ->probe() function where device is requested GPIO
> in order to make it wake capable source without using anywhere else.
> So, this requires to have "init" state to be defined which is kinda
> inconvenient.
>
> On resume/suspend it calls pinctrl_pm_state*() and requires "default"
> and "sleep" states to be defined.
>
> I think GPIO case is quite generic and pin control framework lacks of
> something like switching some pins of the group to GPIO state and back
> whenever they defined as wake capable sources.

I guess by "GPIO state" you are referring to what is discussed in
Documentation/pinctrl.txt as "GPIO mode pitfalls", i.e. it is not really
used as a GPIO, but as part of a device functionality it just happens
that the TRM calls the asynchronous (low power mode) edge detector
mode "GPIO".

> I would work towards fixing this issue anyway (to get UART runtime PM
> working on serial consoles).

Everyone would be grateful for that.

Yours,
Linus Walleij
