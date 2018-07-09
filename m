From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Mon, 09 Jul 2018 08:37:22 -0700
Message-ID: <153115064295.143105.5291742668895542720@swboyd.mtv.corp.google.com>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-3-swboyd@chromium.org>
 <20180622175836.GC3402@tuxbook-pro> <20180622183129.GD3402@tuxbook-pro>
 <CACRpkdZr5tKCjyO6Eq2vPPE8Lg+m+Ky_f24wYBSiLjdZuQ4WwA@mail.gmail.com>
 <153020606866.143105.1849265284764230975@swboyd.mtv.corp.google.com>
 <CAD=FV=Xmo4p7DbOReO02JVKnykoAOz7PtnkbdwryxvpsgZCgWw@mail.gmail.com>
 <153055420964.143105.3738779882090053054@swboyd.mtv.corp.google.com>
 <CACRpkdbNSNzT8tiYDXk1dc447xGqf1bV+O93hgEQdT+GcQtddA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbNSNzT8tiYDXk1dc447xGqf1bV+O93hgEQdT+GcQtddA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2018-07-09 06:54:01)
> On Mon, Jul 2, 2018 at 7:56 PM Stephen Boyd <swboyd@chromium.org> wrote:
> =

> > I could do with some more clarity from Linus in the "Drivers needing
> > both pin control and GPIOs" section of
> > Documentation/driver-api/pinctl.rst but I read that section as stating
> > that the GPIO driver needs to mux the pin as a GPIO by requesting the
> > pinctrl backend to do so, unless the hardware overrides the muxed
> > function selection when the GPIO is used, without involving pinctrl
> > software.
> =

> Yeah that text is especially terse :/
> =

> What it says (or what I meant to say) is that there is a choice
> between letting the pin control and GPIO functionality on the
> same pin be handled orthogonally or implementing these
> gpio_*() callbacks into the pin control backend, but in either case
> the two APIs must be used in sequence:
> pin control setting comes first, second the GPIO subsystem can
> request the GPIO line.
> =

> I'll see if I can clarify.
> =


Ok. Is my interpretation correct though? The fundamental question here
is if gpio_request() should remux the GPIO for the GPIO function or if
drivers are expected to have pinmux settings to use their pin as a GPIO.
