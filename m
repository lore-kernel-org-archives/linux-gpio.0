From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 4/4] [v4] pinctrl: qcom: qdf2xxx: add support for new
 ACPI HID QCOM8002
Date: Wed, 13 Dec 2017 16:32:15 +0200
Message-ID: <1513175535.7000.10.camel@linux.intel.com>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
         <1512170904-4749-5-git-send-email-timur@codeaurora.org>
         <1513073105.25007.618.camel@linux.intel.com>
         <bae16fa3-1bdf-74b1-97b7-f6b2db212621@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <bae16fa3-1bdf-74b1-97b7-f6b2db212621@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, 2017-12-12 at 14:17 -0600, Timur Tabi wrote:
> On 12/12/2017 04:05 AM, Andy Shevchenko wrote:
> > > +static const struct acpi_device_id qdf2xxx_acpi_ids[] = {
> > > +	{"QCOM8001", QDF2XXX_V1},
> > > +	{"QCOM8002", QDF2XXX_V2},
> > > +	{},
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, qdf2xxx_acpi_ids);
> > > 
> > > +	const struct acpi_device_id *id =
> > > +		acpi_match_device(qdf2xxx_acpi_ids, &pdev->dev);
> > 
> > JFYI: there is no need to move IDs like this.
> > Use members of struct device_driver wisely.
> 
> I have to move it, otherwise I get:
> 
> drivers/pinctrl/qcom/pinctrl-qdf2xxx.c:49:21: error:
> 'qdf2xxx_acpi_ids' 
> undeclared (first use in this function); did you mean
> 'qdf2xxx_pinctrl'?
> 
> I reference the structure in qdf2xxx_pinctrl_probe().

Please, read my comment again. The key part of the phrase: 
"Use members of struct device_driver"

So, do not move the IDs. There are examples in the kernel how to access
it.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
