From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Update GPIO EN_CTL when
 setting pin config
Date: Tue, 10 Oct 2017 22:48:52 -0700
Message-ID: <20171011054852.GH1165@minitux>
References: <20170912003331.3092-1-fenglinw@codeaurora.org>
 <20171005162750.GY1165@minitux>
 <c770e00d-9bd5-8cae-0f47-da4d4beee0c4@codeaurora.org>
 <20171009055643.GB1165@minitux>
 <35aec5d7-8808-9930-8d6d-e0399df12a9e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <35aec5d7-8808-9930-8d6d-e0399df12a9e@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Fenglin Wu <fenglinw@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On Mon 09 Oct 17:17 PDT 2017, Fenglin Wu wrote:

> On 10/9/2017 1:56 PM, Bjorn Andersson wrote:
> > On Sun 08 Oct 22:34 PDT 2017, Fenglin Wu wrote:
> > 
> > > On 10/6/2017 12:27 AM, Bjorn Andersson wrote:
[..]
> > > > But I spotted another issue while reviewing this; currently the initial
> > > > state of is_enabled is unconditionally set to enabled in
> > > > pmic_gpio_populate(), so reading the initial pinconf or configuring a
> > > > pinmux before setting a pinconf will operate on the potentially wrong
> > > > information.
> > > > 
> > > > So I think the initial value should be read out from REG_EN_CTL rather
> > > > than being just "true".
> > > > 
> > > > Can you please either submit another patch for this?
> > > 
> > > Hmm, considering a GPIO which is disabled by default in hardware
> > > setting, what's its expected state if we only define "function" for it?
> > > I was thinking we need to enable it once it has any setting in pinmux or
> > > pinconf. If you think that we need to keep its original state until we
> > > set pinconf for it, yes, I can submit a change to address this.
> > > 
> > 
> > Are there valid cases where only function should be selected and no
> > other configuration is used? If so it makes sense to make
> > pmic_gpio_set_mux() enable the block.
> > 
> > 
> > Regardless of this, if there are disabled pins that are not mentioned in
> > DT they will still appear as enabled in the debugfs interface; and this
> > I consider an error worth fixing.
> How about we do both: read the HW initial state in pmic_gpio_populate(),
> and also enable the GPIO block in pmic_gpio_set_mux()?
> 

That sounds good.

Please do this as two separate patches, with the commit message clearly
describing a case where the pinconf does not affect the function of the
pin, so a pinmux is the only thing needed.

Regards,
Bjorn
