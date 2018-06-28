From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Thu, 28 Jun 2018 10:14:28 -0700
Message-ID: <153020606866.143105.1849265284764230975@swboyd.mtv.corp.google.com>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-3-swboyd@chromium.org>
 <20180622175836.GC3402@tuxbook-pro> <20180622183129.GD3402@tuxbook-pro>
 <CACRpkdZr5tKCjyO6Eq2vPPE8Lg+m+Ky_f24wYBSiLjdZuQ4WwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZr5tKCjyO6Eq2vPPE8Lg+m+Ky_f24wYBSiLjdZuQ4WwA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2018-06-28 07:25:46)
> On Fri, Jun 22, 2018 at 8:29 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Fri 22 Jun 10:58 PDT 2018, Bjorn Andersson wrote:
> > > On Mon 18 Jun 13:52 PDT 2018, Stephen Boyd wrote:
> > >
> > > > We rely on devices to use pinmuxing configurations in DT to select =
the
> > > > GPIO function (function 0) if they're going to use the gpio in GPIO
> > > > mode. Let's simplify things for driver authors by implementing
> > > > gpio_request_enable() for this pinctrl driver to mux out the GPIO
> > > > function when the gpio is use from gpiolib.
> > > >
> > > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> (...)
> > While both patch 2 and 3 are convenient ways to get around the annoyance
> > of having to specify a pinmux state both patches then ends up relying on
> > some default pinconf state; which I think is bad.

What default state are we relying on? The reset state of the pins? I'm
very confused by this statement. These last two patches are making sure
that when a GPIO is requested as a GPIO or IRQ, it's really in GPIO
mode. If this code is not in place, then we'll allow drivers to request
a GPIO but pinmuxing won't be called to actually mux that pin to GPIO
mode unless they have a DT conf for function =3D "gpio". That seems
entirely unexpected and easy to mess up.

> =

> Nothing stops you from setting up a default conf in
> this callback though.
> =

> But admittedly this call was added for simpler hardware.
> =

> > Further more in situations like i2c-qup (downstream), where the pins are
> > requested as gpios in order to "bitbang" a reset this would mean that
> > the driver has to counter the convenience; by either switching in the
> > default pinmux at the end of probe or postponing the gpio_request() to
> > the invocation of reset and then, after issuing the gpio_release,
> > switching in the default pinmux explicitly again.
> =

> That's a bigger problem. If the system is using device and GPIO
> mode orthogonally, it'd be good to leave like this.
> =


Doesn't that driver need to explicitly mux GPIO mode vs. device mode
right now? So having gpio_request() do the muxing to GPIO mode and then
explicit muxing of the pin to device mode would be what we have after
this patch, while before this patch we would have mux to GPIO, request
GPIO (nop), mux to device. We saved an explicit pinmux call?
