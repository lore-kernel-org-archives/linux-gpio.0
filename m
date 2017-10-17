From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V1 2/2] pinctrl: qcom: spmi-gpio: Set is_enabled flag in
 set_mux()
Date: Tue, 17 Oct 2017 12:36:09 +0800
Message-ID: <78f23ed8-7e3e-ffc9-bdbe-e10622e0c757@codeaurora.org>
References: <20171013061550.996-1-fenglinw@codeaurora.org>
 <20171013061550.996-3-fenglinw@codeaurora.org>
 <20171016222955.GQ1165@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016222955.GQ1165@minitux>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, collinsd@codeaurora.org, aghayal@codeaurora.org, wruan@codeaurora.org, subbaram@codeaurora.org, kgunda@codeaurora.org
List-Id: linux-gpio@vger.kernel.org

On 10/17/2017 6:29 AM, Bjorn Andersson wrote:
> On Thu 12 Oct 23:15 PDT 2017, fenglinw@codeaurora.org wrote:
> 
>> From: Fenglin Wu <fenglinw@codeaurora.org>
>>
>> The initial value of is_enabled flag is read out from hardware in
>> pmic_gpio_populate(), and it will be set in pmic_gpio_config_set() if
>> pinconf is defined. For any GPIOs disabled initially in hardware which
>> only have pinmux defined, they won't be enabled in pmic_gpio_set_mux()
>> calling. So set is_enabled flag in set_mux() to ensure the GPIO module
>> could be enabled in above case.
>>
> 
> I'm still interested in knowing when it is valid to configure a pin with
> only mux, no config.  I.e. in what cases does setting a alternative
> function make the pinconfig not count.
I agreed that any pins should be configured with pinmux as well as
pinconf, but the driver doesn't prevent the case of only pinmux defined,
right? I am not sure if this is valid case but it would happen: The
hardware or the sw prior to linux kernel has the default setting of the
function and config for one GPIO but we need to keep it disabled until
the consumer request it, in this case, we just need to define the pinmux
and ignore the pinconf definition in its device node.

> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> index 0a1e173..219c934 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> @@ -312,6 +312,7 @@ static int pmic_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned function,
>>   	}
>>   
>>   	pad = pctldev->desc->pins[pin].drv_data;
>> +	pad->is_enabled = true;
>>   	/*
>>   	 * Non-LV/MV subtypes only support 2 special functions,
>>   	 * offsetting the dtestx function values by 2
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project.
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
