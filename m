From: Timur Tabi <timur@tabi.org>
Subject: Re: [PATCH] gpiolib: Show correct direction from the beginning
Date: Thu, 20 Sep 2018 07:20:18 -0500
Message-ID: <015715f7-64bc-aca6-77fe-68ddb6c938a8@kernel.org>
References: <20180914070839.4667-1-ricardo.ribalda@gmail.com>
 <20180914070839.4667-2-ricardo.ribalda@gmail.com>
 <CACRpkdbqmK=MzGsOYLdtFO3AAbKHhzy_RD=Gr6wj3WnQunyCGg@mail.gmail.com>
 <CAPybu_0iDqSn02iGLEg8Ge9EdyCCNhRVV3JgHg180qrXK+bcdw@mail.gmail.com>
 <d84ee082-f578-3ed3-32be-dbeb9562980e@kernel.org>
 <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_39xtDfoHVo2dv2GZcU5hCQYjBpU7tW2hf3vfUwbUK1mQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, swboyd@chromium.org, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



On 09/19/2018 10:27 AM, Ricardo Ribalda Delgado wrote:
> Let me explain my current setup
> 
> I have a board with input and output gpios, the direction is defined
> via pdata. When I run gpioinfo all the gpios are shown as input,
> regardless if they are input or outputs: Eg:
> 
> root@qt5022:/tmp# ./gpioinfo
> 
> gpiochip0 - 16 lines:
>          line   0:     "PROG_B"       unused   input  active-high
>          line   1:         "M0"       unused   input  active-high
>          line   2:         "M1"       unused   input  active-high
>          line   3:         "M2"       unused   input  active-high
>          line   4:        "DIN"       unused   input  active-high
>          line   5:       "CCLK"       unused   input  active-high
>          line   6:      unnamed       unused   input  active-high
>          line   7:      unnamed       unused   input  active-high
>          line   8:       "DONE"       unused   input  active-high
>          line   9:     "INIT_B"       unused   input  active-high
>          line  10:      unnamed       unused   input  active-high
>          line  11:      unnamed       unused   input  active-high
>          line  12:      unnamed       unused   input  active-high
>          line  13:      unnamed       unused   input  active-high
>          line  14:      unnamed       unused   input  active-high
>          line  15:      unnamed       unused   input  active-high

Yes, this is a known problem that should be fixed.

> That is wrong and very confusing to the user, it can also lead to a
> mayor fuckup if the user decides to connect two output gpio pins
> because he expects that both are input. (This is the programming port,
> but I also have 24 V -high current GPIOs)

Users are expected to program the direction for every GPIO they want to 
use, regardless of whatever it's set to before they open it.

> There is a function in the API to tell libgpio if a gpio is out our
> in. Why not use it?

Because calling that API before properly claiming the GPIO is a 
programming error.

> - If the configuration is hardcoded, the driver will return a fixed value
> - If it is cheap to query the hardware, the driver will query the hardware,
> - If it is expensive to query the hardware the driver can either
> return a cached value or a fake value (current situation)

The reason why the Qualcomm driver is impacted the most is because on 
ACPI platforms, the GPIO map is "sparse".  That is, not every GPIO 
between 0 and n-1 actually exists.  So reading a GPIO that doesn't exist 
is invalid.

The way to protect against that is to claim the GPIO first.  If the 
claim is rejected, then you know that you can't access that GPIO.

The bug is that the original code that I deleted (and that you're trying 
to put back) doesn't claim the GPIO first.

>>From my point of view:  "The get_direction callback normally triggers
> a  read/write to hardware, but we shouldn't be touching the hardware
> for   an individual GPIO until after it's been properly claimed." is
> an statement specific for your platform and should be fixed in your
> driver.
> 
> Either that, or I have completely missunderstund the purpouse of gpiod
> :), and that could easily be the case.

It's not a platform-specific statement.  It applies to all drivers.  In 
some drivers, the get_direction function had side-effects (like 
programming muxes, IIRC) that no one really cared about but was 
technically wrong.

I'm not sure how to properly fix this, but I wonder if we need some kind 
of late-stage initialization where gpiolib scans all the GPIOs by 
claiming them first, reading the directions, and then releasing them.
