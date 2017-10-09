From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V1] pinctrl: qcom: spmi-gpio: Update GPIO EN_CTL when
 setting pin config
Date: Mon, 9 Oct 2017 13:34:05 +0800
Message-ID: <c770e00d-9bd5-8cae-0f47-da4d4beee0c4@codeaurora.org>
References: <20170912003331.3092-1-fenglinw@codeaurora.org>
 <20171005162750.GY1165@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171005162750.GY1165@minitux>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On 10/6/2017 12:27 AM, Bjorn Andersson wrote:
> On Mon 11 Sep 17:32 PDT 2017, fenglinw@codeaurora.org wrote:
> 
>> From: Fenglin Wu <fenglinw@codeaurora.org>
>>
>> GPIO is expected to be disabled iff PIN_CONFIG_BIAS_HIGH_IMPEDANCE is
>> configured. Update is_enabled flag in config_set() so that it can
>> reflect GPIO status correctly. Also modify EN_CTL register based on
>> is_enabled flag in config_set() to configure the GPIO properly.
>>
>> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> index c2c0bab..a0edaa8 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> @@ -453,6 +453,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>   
>>   	pad = pctldev->desc->pins[pin].drv_data;
>>   
>> +	pad->is_enabled = true;
>>   	for (i = 0; i < nconfs; i++) {
>>   		param = pinconf_to_config_param(configs[i]);
>>   		arg = pinconf_to_config_argument(configs[i]);
>> @@ -600,6 +601,10 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>   			return ret;
>>   	}
>>   
>> +	val = pad->is_enabled << PMIC_GPIO_REG_MASTER_EN_SHIFT;
>> +
>> +	ret = pmic_gpio_write(state, pad, PMIC_GPIO_REG_EN_CTL, val);
>> +
> 
> This looks good.
> 
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> 
> But I spotted another issue while reviewing this; currently the initial
> state of is_enabled is unconditionally set to enabled in
> pmic_gpio_populate(), so reading the initial pinconf or configuring a
> pinmux before setting a pinconf will operate on the potentially wrong
> information.
> 
> So I think the initial value should be read out from REG_EN_CTL rather
> than being just "true".
> 
> Can you please either submit another patch for this?

Hmm, considering a GPIO which is disabled by default in hardware
setting, what's its expected state if we only define "function" for it?
I was thinking we need to enable it once it has any setting in pinmux or
pinconf. If you think that we need to keep its original state until we
set pinconf for it, yes, I can submit a change to address this.


> 
> Regards,
> Bjorn
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
