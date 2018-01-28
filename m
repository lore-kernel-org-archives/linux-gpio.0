From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: msm: allow the gpio base to be configurable
Date: Sun, 28 Jan 2018 17:29:59 -0600
Message-ID: <042b6cea-38f7-a660-0059-5f24fc7db9eb@codeaurora.org>
References: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
 <20180128232310.GA12728@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180128232310.GA12728@builder>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 1/28/18 5:23 PM, Bjorn Andersson wrote:
> What platform has multiple TLMMs?
> 
> [..]

An upcoming one.

>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index b7b6849625ec..4dc76e15bd14 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -901,7 +901,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>   		return -EINVAL;
>>   
>>   	chip = &pctrl->chip;
>> -	chip->base = 0;

> My bad, this should have been -1.

Perhaps, but it's been 0 for a very long time, so I don't want to break 
any existing platforms by suddenly relocating all GPIOs across all 
Qualcomm platforms.

What do you think about my other idea?

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
