From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Tue, 19 Jun 2018 14:18:37 -0700
Message-ID: <152944311714.16708.13638961630238512631@swboyd.mtv.corp.google.com>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-3-swboyd@chromium.org>
 <CAD=FV=VpFR4hpREnWpvG2MQAONheKtNfLkyNM8-AFXMcGD7OPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=VpFR4hpREnWpvG2MQAONheKtNfLkyNM8-AFXMcGD7OPQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Quoting Doug Anderson (2018-06-18 16:54:49)
> Hi,
> =

> On Mon, Jun 18, 2018 at 1:52 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> > We rely on devices to use pinmuxing configurations in DT to select the
> > GPIO function (function 0) if they're going to use the gpio in GPIO
> > mode. Let's simplify things for driver authors by implementing
> > gpio_request_enable() for this pinctrl driver to mux out the GPIO
> > function when the gpio is use from gpiolib.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/=
pinctrl-msm.c
> > index 3563c4394837..eacfc5b85f7f 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -176,11 +176,27 @@ static int msm_pinmux_set_mux(struct pinctrl_dev =
*pctldev,
> >         return 0;
> >  }
> >
> > +static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
> > +                                  struct pinctrl_gpio_range *range,
> > +                                  unsigned offset)
> > +{
> > +       struct msm_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
> > +       const struct msm_pingroup *g =3D &pctrl->soc->groups[offset];
> > +
> > +       /* No funcs? Probably ACPI so can't do anything here */
> > +       if (!g->nfuncs)
> > +               return 0;
> =

> Is there a reason why you'd want to return 0 instead of some sort of
> error code?  Wouldn't you want to know that this pin can't be a GPIO?

On ACPI there aren't any functions and thus all pins are GPIO mode and
only GPIO mode if they're used as GPIOs. At least that's my
understanding of how the ACPI version of this driver works.

> Another non-ACPI example is sdc2 on sdm845 and it seems like you'd
> want to know if someone tried to set one of those as a GPIO.
> =

> ...oh, but I guess ufs_reset also has no funcs but it still probably
> wants to use the GPIO framework to write something.  Hrmmm...  Maybe
> check if either in_bit or out_bit is not -1?

ufs_reset and sdc2 aren't in the GPIO chip's numberspace so I don't
think we need to care? At least I can't convince myself that those pins
would eventually call into the this function. We could check if offset
is greater than ngpios for the chip but that seems useless if higher
layers are handling this already.

> =

> =

> > +
> > +       /* For now assume function 0 is GPIO because it always is */
> > +       return msm_pinmux_set_mux(pctldev, 0, offset);
> =

> nit: should you be consistent with msm_pinmux_set_mux() and call it
> "group" instead of "offset"?  It looks like it's supposed to be the
> same thing...
> =


This is copying the generic one and the function pointer prototype, so I
think it's best to leave it as 'offset'.
