From: Fenglin Wu <fenglinw@codeaurora.org>
Subject: Re: [PATCH V1 3/3] pinctrl: qcom: spmi-gpio: Correct power_source
 range check
Date: Thu, 13 Jul 2017 13:55:27 +0800
Message-ID: <4095df2e-63c9-93c4-c56b-f501724140d5@codeaurora.org>
References: <20170613061707.13892-1-fenglinw@codeaurora.org>
 <20170613061707.13892-4-fenglinw@codeaurora.org>
 <20170712213314.GL1618@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54726 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdGMFzd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jul 2017 01:55:33 -0400
In-Reply-To: <20170712213314.GL1618@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-soc@vger.kernel.org, linux-gpio@vger.kernel.org, collinsd@quicinc.com, aghayal@qti.qualcomm.com, wruan@quicinc.com, kgunda@qti.qualcomm.com

On 7/13/2017 5:33 AM, Bjorn Andersson wrote:
> On Mon 12 Jun 23:16 PDT 2017, fenglinw@codeaurora.org wrote:
> 
>> From: Fenglin Wu <fenglinw@codeaurora.org>
>>
>> Power source selection in DIG_VIN_CTL is indexed from 0, in the range
>> check it shouldn't be equal to the total number of power sources.
>>
>> Signed-off-by: Fenglin Wu <fenglinw@codeaurora.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> This patch is unrelated to the other patches in the series, when this is
> the case it's better to send it on its own.
> 
> Regards,
> Bjorn
> 
Sure, I will send it as an independent patch.
>> ---
>>   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> index 581309d..1fd677c 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> @@ -500,7 +500,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>   			pad->is_enabled = false;
>>   			break;
>>   		case PIN_CONFIG_POWER_SOURCE:
>> -			if (arg > pad->num_sources)
>> +			if (arg >= pad->num_sources)
>>   				return -EINVAL;
>>   			pad->power_source = arg;
>>   			break;
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project.
>>

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
