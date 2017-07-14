From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 14 Jul 2017 12:17:23 -0500
Message-ID: <6ca041fa-533d-6c6b-8c77-4c079cb7e9f6@codeaurora.org>
References: <1499982763-29619-1-git-send-email-timur@codeaurora.org>
 <1499982763-29619-2-git-send-email-timur@codeaurora.org>
 <20170714171148.GH22780@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170714171148.GH22780@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 07/14/2017 12:11 PM, Stephen Boyd wrote:

>> +/*
>> + * Request a GPIO. If the number of pins for this GPIO group is zero,
>> + * then assume that the GPIO is unavailable.
>> + */
>> +static int msm_request(struct pinctrl_dev *pctldev, unsigned int offset)
> 
> These names are awful. Reminds me of the serial driver that has
> functions like msm_reset(). But when in Rome this is how it goes
> I suppose.

I can change it to msm_pinctrl_request().

>> @@ -430,6 +445,14 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>>   
>>   	g = &pctrl->soc->groups[offset];
>>   
>> +	/*
>> +	 * If the GPIO is unavailable, just return error.  This is necessary
>> +	 * because the GPIO layer tries to initialize the direction of all
>> +	 * the GPIOs, even the ones that are unavailable.
>> +	 */
>> +	if (!g->npins)
>> +		return -ENODEV;
>> +
> 
> gpiochips also have a request() hook. Can we use that before
> initializing direction to make sure the GPIO is accessible?

I'll try that.

>>   static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>> @@ -511,10 +539,8 @@ static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>>   	unsigned gpio = chip->base;
>>   	unsigned i;
>>   
>> -	for (i = 0; i < chip->ngpio; i++, gpio++) {
>> +	for (i = 0; i < chip->ngpio; i++, gpio++)
>>   		msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
>> -		seq_puts(s, "\n");
>> -	}
>>   }
> 
> Were these two hunks necessary? Looks like noise.

Yes, because otherwise there will be a whole bunch of blank lines for 
hidden GPIOs.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
