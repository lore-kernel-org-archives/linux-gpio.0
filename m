From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: msm: Mux out gpio function with
 gpio_request()
Date: Fri, 22 Jun 2018 11:31:29 -0700
Message-ID: <20180622183129.GD3402@tuxbook-pro>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-3-swboyd@chromium.org>
 <20180622175836.GC3402@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180622175836.GC3402@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Fri 22 Jun 10:58 PDT 2018, Bjorn Andersson wrote:

> On Mon 18 Jun 13:52 PDT 2018, Stephen Boyd wrote:
> 
> > We rely on devices to use pinmuxing configurations in DT to select the
> > GPIO function (function 0) if they're going to use the gpio in GPIO
> > mode. Let's simplify things for driver authors by implementing
> > gpio_request_enable() for this pinctrl driver to mux out the GPIO
> > function when the gpio is use from gpiolib.
> > 
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 

On second thought, while reading patch 3, when would this be used?

While both patch 2 and 3 are convenient ways to get around the annoyance
of having to specify a pinmux state both patches then ends up relying on
some default pinconf state; which I think is bad.


Further more in situations like i2c-qup (downstream), where the pins are
requested as gpios in order to "bitbang" a reset this would mean that
the driver has to counter the convenience; by either switching in the
default pinmux at the end of probe or postponing the gpio_request() to
the invocation of reset and then, after issuing the gpio_release,
switching in the default pinmux explicitly again.


So I'm not sure we want this.

Regards,
Bjorn

> Regards,
> Bjorn
> 
> > Cc: Doug Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 3563c4394837..eacfc5b85f7f 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -176,11 +176,27 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >  	return 0;
> >  }
> >  
> > +static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
> > +				   struct pinctrl_gpio_range *range,
> > +				   unsigned offset)
> > +{
> > +	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> > +	const struct msm_pingroup *g = &pctrl->soc->groups[offset];
> > +
> > +	/* No funcs? Probably ACPI so can't do anything here */
> > +	if (!g->nfuncs)
> > +		return 0;
> > +
> > +	/* For now assume function 0 is GPIO because it always is */
> > +	return msm_pinmux_set_mux(pctldev, 0, offset);
> > +}
> > +
> >  static const struct pinmux_ops msm_pinmux_ops = {
> >  	.request		= msm_pinmux_request,
> >  	.get_functions_count	= msm_get_functions_count,
> >  	.get_function_name	= msm_get_function_name,
> >  	.get_function_groups	= msm_get_function_groups,
> > +	.gpio_request_enable	= msm_pinmux_request_gpio,
> >  	.set_mux		= msm_pinmux_set_mux,
> >  };
> >  
> > -- 
> > Sent by a computer through tubes
> > 
