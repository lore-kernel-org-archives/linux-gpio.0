From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Mon, 12 Sep 2016 17:33:56 +0200
Message-ID: <20160912153356.GD10121@twins.programming.kicks-ass.net>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net>
 <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2016 at 05:16:14PM +0200, Bartosz Golaszewski wrote:

> >>                                                - - - - -
> >>  -------             ---------  Bus segment 1 |         |
> >> |       |           |         |---------------  Devices
> >> |       | SCL/SDA   |         |               |         |
> >> | Linux |-----------| I2C MUX |                - - - - -
> >> |       |    |      |         | Bus segment 2
> >> |       |    |      |         |-------------------
> >>  -------     |       ---------                    |
> >>              |           |                    - - - - -
> >>         ------------     | MUX GPIO          |         |
> >>        |            |    |                     Devices
> >>        |    GPIO    |    |                   |         |
> >>        | Expander 1 |----                     - - - - -
> >>        |            |                             |
> >>         ------------                              | SCL/SDA
> >>                                                   |
> >>                                              ------------
> >>                                             |            |
> >>                                             |    GPIO    |
> >>                                             | Expander 2 |
> >>                                             |            |
> >>                                              ------------

> > The tricky part, and here I have absolutely no clue what so ever, is
> > being able to tell at pca953x_probe() time that this is so.
> >
> 
> AFAIK there is no clean way to tell that a GPIO is used by an I2C
> multiplexer at probe time. Linus, Alexandre could you confirm?

You cannot inspect the device tree while probing?

> It uses the fact that the two expanders we have are of different type
> (pca9534 and pca9535). The id pointer points to per-chip device info
> residing in .data which makes it suitable for mutex key.
> 
> I don't think such hack is suitable for mainline though.

Right, that works by accident rather than anything else :-)
