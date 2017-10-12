From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Thu, 12 Oct 2017 00:39:22 -0700
Message-ID: <20171012073922.GB18706@codeaurora.org>
References: <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
 <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org>
 <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
 <d53e67a2-4f69-752f-ba35-53872d9b9760@codeaurora.org>
 <CACRpkdYfAcKrgbgybccurUKTyR0E+tHDyzp7sbXxXxKuyMOGhQ@mail.gmail.com>
 <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org>
 <CACRpkdZFunwQ=tiQqsapap7Ozz42hr=df5vqbC0S5xy5Wn+ZWw@mail.gmail.com>
 <255ad0dc-2d16-ae7f-0b45-500e23cff1a4@codeaurora.org>
 <20171003220311.GU457@codeaurora.org>
 <CACRpkdYXsY5eixYkEeuZTHJn7q6_6BdTxZ-2yneUyEKUjKF3Gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYXsY5eixYkEeuZTHJn7q6_6BdTxZ-2yneUyEKUjKF3Gw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On 10/11, Linus Walleij wrote:
> On Wed, Oct 4, 2017 at 12:03 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> 
> > Could we remove the pin direction finding part here in
> > gpiochip_add_pin_range() and lazily resolve the pin direction
> > when a pin is requested? We would need a similar check in the msm
> > specific debugfs code where we skip pins that aren't requested.
> > This is basically a revert of commit 72d320006177 ("gpio: set up
> > initial state from .get_direction()").
> 
> It seems reasonable for the gpiolib to be able to call this
> function immediately after registering the new GPIO chip
> with its vtable.

I agree. I don't see the benefit though. Reading the direction
later would achieve the same effect and also work for ACPI qcom
platforms.

> 
> I think it is more up to the driver to numb the reply with
> some dummy return value (i.e. input mode) or refactor the
> callback so that it is acceptable for gpiolib to get an -EINVAL
> or so from the driver (again it will assume input mode) if the
> driver can't return the direction at this time.
> 

For qcom platforms the driver will never be able to return the
direction for these certain pins because reading the register is
not allowed by the firmware. Doing so will cause the device to
crash with a security violation.

If you don't want to delay reading the direction until request
time, we should have the DT msm pinctrl drivers leave the
get_direction() pointer as NULL. We don't need to read the
direction on DT platforms to make anything work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
