From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH 8/8] pinctrl: qcom: ssbi: Family A gpio & mpp drivers
Date: Wed, 24 Jun 2015 11:17:23 +0300
Message-ID: <1435133843.2334.34.camel@linaro.org>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com>
	 <1434610052-602-9-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1434610052-602-9-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, marc.zyngier@arm.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Bjorn, 

On Wed, 2015-06-17 at 23:47 -0700, Bjorn Andersson wrote:
> This introduces pinctrl drivers for gpio and mpp blocks found in family A
> PMICs.
> 
> +
> +static struct platform_driver pm8xxx_gpio_driver = {
> +       .driver = {
> +               .name = "pm8xxx_gpio",

Name of the SPMI based GPIO PMIC driver is "qcom-spmi-gpio".

You know, all of the PMIC's are PM8..something. Could we have 
SSBI in the name of this one?

> +               .of_match_table = pm8xxx_gpio_of_match,
> +       },
> +       .probe = pm8xxx_gpio_probe,
> +       .remove = pm8xxx_gpio_remove,
> +};
> +
> +module_platform_driver(pm8xxx_gpio_driver);
> +
> +MODULE_AUTHOR("Bjorn Andersson andersson@sonymobile.com>");
> +MODULE_DESCRIPTION("Qualcomm PM8xxx GPIO driver");

And the same of MPP driver.

Regards,
Ivan
