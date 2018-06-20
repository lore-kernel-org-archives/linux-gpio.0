From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Tue, 19 Jun 2018 22:53:04 -0700
Message-ID: <152947398496.16708.16250874897441295979@swboyd.mtv.corp.google.com>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-3-swboyd@chromium.org>
 <CAD=FV=VpFR4hpREnWpvG2MQAONheKtNfLkyNM8-AFXMcGD7OPQ@mail.gmail.com>
 <152944311714.16708.13638961630238512631@swboyd.mtv.corp.google.com>
 <CAD=FV=VjqvPQA5jTUyiMzmetk2br-4fiPQdM4cVzb6ivWcta9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VjqvPQA5jTUyiMzmetk2br-4fiPQdM4cVzb6ivWcta9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Quoting Doug Anderson (2018-06-19 14:38:57)
> On Tue, Jun 19, 2018 at 2:18 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> > Quoting Doug Anderson (2018-06-18 16:54:49)
> >>
> >> Is there a reason why you'd want to return 0 instead of some sort of
> >> error code?  Wouldn't you want to know that this pin can't be a GPIO?
> >
> > On ACPI there aren't any functions and thus all pins are GPIO mode and
> > only GPIO mode if they're used as GPIOs. At least that's my
> > understanding of how the ACPI version of this driver works.
> =

> OK.  I have no understanding of how the ACPI version of this driver
> works, so your understanding is much more likely to be right than
> mine.  I guess this is just "pinctrl-qdf2xxx.c"?
> =


Yes that's the single ACPI driver.

> =

> >> Another non-ACPI example is sdc2 on sdm845 and it seems like you'd
> >> want to know if someone tried to set one of those as a GPIO.
> >>
> >> ...oh, but I guess ufs_reset also has no funcs but it still probably
> >> wants to use the GPIO framework to write something.  Hrmmm...  Maybe
> >> check if either in_bit or out_bit is not -1?
> >
> > ufs_reset and sdc2 aren't in the GPIO chip's numberspace so I don't
> > think we need to care? At least I can't convince myself that those pins
> > would eventually call into the this function. We could check if offset
> > is greater than ngpios for the chip but that seems useless if higher
> > layers are handling this already.
> =

> Ah, I see what you mean.  These pins do have numbers in the code:
> =

> PINCTRL_PIN(150, "SDC2_CLK"),
> PINCTRL_PIN(151, "SDC2_CMD"),
> PINCTRL_PIN(152, "SDC2_DATA"),
> PINCTRL_PIN(153, "UFS_RESET"),
> =

> ...but those are effectively made up numbers and they are all past the
> "ngpios" (150).  ...and the higher level code seems to be already
> checking that.

Right. Hopefully that saves us from this trouble.

> =

> =

> OK, thought I've already proven my cluelessness about this driver,
> FWIW this patch makes sense to me now so FWIW:
> =

> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> =


Thanks!
