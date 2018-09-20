From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Thu, 20 Sep 2018 16:14:00 +0200
Message-ID: <CAPybu_2ovB3T1fOD2gP9rM46z37WVuOuzu5FyKamfyMWoVg=yw@mail.gmail.com>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com> <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
 <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org> <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
 <015715f7-64bc-aca6-77fe-68ddb6c938a8@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <015715f7-64bc-aca6-77fe-68ddb6c938a8@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: timur@tabi.org
Cc: Linus Walleij <linus.walleij@linaro.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi
On Thu, Sep 20, 2018 at 2:20 PM Timur Tabi <timur@tabi.org> wrote:
>
>
>
> On 09/19/2018 10:27 AM, Ricardo Ribalda Delgado wrote:
> > Let me explain my current setup
> >
> > I have a board with input and output gpios, the direction is defined
> > via pdata. When I run gpioinfo all the gpios are shown as input,
> > regardless if they are input or outputs: Eg:
> >
> > root@qt5022:/tmp# ./gpioinfo
> >
> > gpiochip0 - 16 lines:
> >          line   0:     "PROG_B"       unused   input  active-high
> >          line   1:         "M0"       unused   input  active-high
> >          line   2:         "M1"       unused   input  active-high
> >          line   3:         "M2"       unused   input  active-high
> >          line   4:        "DIN"       unused   input  active-high
> >          line   5:       "CCLK"       unused   input  active-high
> >          line   6:      unnamed       unused   input  active-high
> >          line   7:      unnamed       unused   input  active-high
> >          line   8:       "DONE"       unused   input  active-high
> >          line   9:     "INIT_B"       unused   input  active-high
> >          line  10:      unnamed       unused   input  active-high
> >          line  11:      unnamed       unused   input  active-high
> >          line  12:      unnamed       unused   input  active-high
> >          line  13:      unnamed       unused   input  active-high
> >          line  14:      unnamed       unused   input  active-high
> >          line  15:      unnamed       unused   input  active-high
>
> Yes, this is a known problem that should be fixed.
>
> > That is wrong and very confusing to the user, it can also lead to a
> > mayor fuckup if the user decides to connect two output gpio pins
> > because he expects that both are input. (This is the programming port,
> > but I also have 24 V -high current GPIOs)
>
> Users are expected to program the direction for every GPIO they want to
> use, regardless of whatever it's set to before they open it.

I do not agree that the user should program the direction of a GPIO
which direction cannot be used.

Also I am not talking about programming a gpio, I am talking about an
technician  connecting portA to portB and burning something because
the system provided erroneous information

>
> > There is a function in the API to tell libgpio if a gpio is out our
> > in. Why not use it?
>
> Because calling that API before properly claiming the GPIO is a
> programming error.

Is there a place where this API is defined?. Which functions require
to be defined.? What is the correct order.?

>
> > - If the configuration is hardcoded, the driver will return a fixed value
> > - If it is cheap to query the hardware, the driver will query the hardware,
> > - If it is expensive to query the hardware the driver can either
> > return a cached value or a fake value (current situation)
>
> The reason why the Qualcomm driver is impacted the most is because on
> ACPI platforms, the GPIO map is "sparse".  That is, not every GPIO
> between 0 and n-1 actually exists.  So reading a GPIO that doesn't exist
> is invalid.

Why are we adding GPIOs that are invalid?
If you can figure out that a GPIO is invalid when the user claims a
gpio, you can also figure it out when the user asks the direction.

>
> The way to protect against that is to claim the GPIO first.  If the
> claim is rejected, then you know that you can't access that GPIO.
>
> The bug is that the original code that I deleted (and that you're trying
> to put back) doesn't claim the GPIO first.
>
> >>From my point of view:  "The get_direction callback normally triggers
> > a  read/write to hardware, but we shouldn't be touching the hardware
> > for   an individual GPIO until after it's been properly claimed." is
> > an statement specific for your platform and should be fixed in your
> > driver.
> >
> > Either that, or I have completely missunderstund the purpouse of gpiod
> > :), and that could easily be the case.
>
> It's not a platform-specific statement.  It applies to all drivers.  In
> some drivers, the get_direction function had side-effects (like
> programming muxes, IIRC) that no one really cared about but was
> technically wrong.

A get operation should not set any functionality..., it should return
a cached value or query safely the hardware.


>
> I'm not sure how to properly fix this, but I wonder if we need some kind
> of late-stage initialization where gpiolib scans all the GPIOs by
> claiming them first, reading the directions, and then releasing them.

That sounds like a good compromise. Or returning
-unconfigured / unknown

is also an option.


-- 
Ricardo Ribalda
