From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: enable generic support and input-enable
 pinctrl conf
Date: Mon, 26 Jan 2015 17:23:42 -0800
Message-ID: <54C6E89E.2050701@codeaurora.org>
References: <1422289494-31461-1-git-send-email-svarbanov@mm-sol.com> <54C6E753.606@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <54C6E753.606@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: linux-gpio@vger.kernel.org

On 01/26/15 17:18, Stephen Boyd wrote:
> On 01/26/15 08:24, Stanimir Varbanov wrote:
>
>>  		return -ENOTSUPP;
>>  	}
>>  
>> @@ -208,14 +208,12 @@ static int msm_config_get(struct pinctrl_dev *pctldev,
>>  			  unsigned int pin,
>>  			  unsigned long *config)
>>  {
>> -	dev_err(pctldev->dev, "pin_config_set op not supported\n");
> Same for here.
>
>>  	return -ENOTSUPP;
>>  }
>>  
>>  static int msm_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>>  				unsigned long *configs, unsigned num_configs)
>>  {
>> -	dev_err(pctldev->dev, "pin_config_set op not supported\n");
> And here.

Actually it looks like we can just remove these two functions and the
core does the right thing and prints errors. That would be a good patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
