From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Wed, 19 Sep 2018 17:27:26 +0200
Message-ID: <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com> <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com> <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Timur
On Wed, Sep 19, 2018 at 1:50 PM Timur Tabi <timur@kernel.org> wrote:
>
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

Let me explain my current setup

I have a board with input and output gpios, the direction is defined
via pdata. When I run gpioinfo all the gpios are shown as input,
regardless if they are input or outputs: Eg:

root@qt5022:/tmp# ./gpioinfo

gpiochip0 - 16 lines:
        line   0:     "PROG_B"       unused   input  active-high
        line   1:         "M0"       unused   input  active-high
        line   2:         "M1"       unused   input  active-high
        line   3:         "M2"       unused   input  active-high
        line   4:        "DIN"       unused   input  active-high
        line   5:       "CCLK"       unused   input  active-high
        line   6:      unnamed       unused   input  active-high
        line   7:      unnamed       unused   input  active-high
        line   8:       "DONE"       unused   input  active-high
        line   9:     "INIT_B"       unused   input  active-high
        line  10:      unnamed       unused   input  active-high
        line  11:      unnamed       unused   input  active-high
        line  12:      unnamed       unused   input  active-high
        line  13:      unnamed       unused   input  active-high
        line  14:      unnamed       unused   input  active-high
        line  15:      unnamed       unused   input  active-high

That is wrong and very confusing to the user, it can also lead to a
mayor fuckup if the user decides to connect two output gpio pins
because he expects that both are input. (This is the programming port,
but I also have 24 V -high current GPIOs)

There is a function in the API to tell libgpio if a gpio is out our
in. Why not use it?
- If the configuration is hardcoded, the driver will return a fixed value
- If it is cheap to query the hardware, the driver will query the hardware,
- If it is expensive to query the hardware the driver can either
return a cached value or a fake value (current situation)


>From my point of view:  "The get_direction callback normally triggers
a  read/write to hardware, but we shouldn't be touching the hardware
for   an individual GPIO until after it's been properly claimed." is
an statement specific for your platform and should be fixed in your
driver.

Either that, or I have completely missunderstund the purpouse of gpiod
:), and that could easily be the case.

Regards!

-- 
Ricardo Ribalda
