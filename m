From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Tue, 19 Jun 2018 14:38:57 -0700
Message-ID: <CAD=FV=VjqvPQA5jTUyiMzmetk2br-4fiPQdM4cVzb6ivWcta9A@mail.gmail.com>
References: <20180618205255.246104-1-swboyd@chromium.org> <20180618205255.246104-3-swboyd@chromium.org>
 <CAD=FV=VpFR4hpREnWpvG2MQAONheKtNfLkyNM8-AFXMcGD7OPQ@mail.gmail.com> <152944311714.16708.13638961630238512631@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152944311714.16708.13638961630238512631@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Tue, Jun 19, 2018 at 2:18 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Doug Anderson (2018-06-18 16:54:49)
>> Hi,
>>
>> On Mon, Jun 18, 2018 at 1:52 PM, Stephen Boyd <swboyd@chromium.org> wrote:
>> > We rely on devices to use pinmuxing configurations in DT to select the
>> > GPIO function (function 0) if they're going to use the gpio in GPIO
>> > mode. Let's simplify things for driver authors by implementing
>> > gpio_request_enable() for this pinctrl driver to mux out the GPIO
>> > function when the gpio is use from gpiolib.
>> >
>> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> > Cc: Doug Anderson <dianders@chromium.org>
>> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>> > ---
>> >  drivers/pinctrl/qcom/pinctrl-msm.c | 16 ++++++++++++++++
>> >  1 file changed, 16 insertions(+)
>> >
>> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> > index 3563c4394837..eacfc5b85f7f 100644
>> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> > @@ -176,11 +176,27 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>> >         return 0;
>> >  }
>> >
>> > +static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
>> > +                                  struct pinctrl_gpio_range *range,
>> > +                                  unsigned offset)
>> > +{
>> > +       struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>> > +       const struct msm_pingroup *g = &pctrl->soc->groups[offset];
>> > +
>> > +       /* No funcs? Probably ACPI so can't do anything here */
>> > +       if (!g->nfuncs)
>> > +               return 0;
>>
>> Is there a reason why you'd want to return 0 instead of some sort of
>> error code?  Wouldn't you want to know that this pin can't be a GPIO?
>
> On ACPI there aren't any functions and thus all pins are GPIO mode and
> only GPIO mode if they're used as GPIOs. At least that's my
> understanding of how the ACPI version of this driver works.

OK.  I have no understanding of how the ACPI version of this driver
works, so your understanding is much more likely to be right than
mine.  I guess this is just "pinctrl-qdf2xxx.c"?


>> Another non-ACPI example is sdc2 on sdm845 and it seems like you'd
>> want to know if someone tried to set one of those as a GPIO.
>>
>> ...oh, but I guess ufs_reset also has no funcs but it still probably
>> wants to use the GPIO framework to write something.  Hrmmm...  Maybe
>> check if either in_bit or out_bit is not -1?
>
> ufs_reset and sdc2 aren't in the GPIO chip's numberspace so I don't
> think we need to care? At least I can't convince myself that those pins
> would eventually call into the this function. We could check if offset
> is greater than ngpios for the chip but that seems useless if higher
> layers are handling this already.

Ah, I see what you mean.  These pins do have numbers in the code:

PINCTRL_PIN(150, "SDC2_CLK"),
PINCTRL_PIN(151, "SDC2_CMD"),
PINCTRL_PIN(152, "SDC2_DATA"),
PINCTRL_PIN(153, "UFS_RESET"),

...but those are effectively made up numbers and they are all past the
"ngpios" (150).  ...and the higher level code seems to be already
checking that.


OK, thought I've already proven my cluelessness about this driver,
FWIW this patch makes sense to me now so FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
