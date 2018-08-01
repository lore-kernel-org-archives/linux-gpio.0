From: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH] pinctrl: berlin: fix 'pctrl->functions' allocation in
 berlin_pinctrl_build_state
Date: Wed, 1 Aug 2018 12:12:30 +0800
Message-ID: <e2b74e25-9fbd-312b-8fd5-e2e72ad79771@huawei.com>
References: <20180731142501.21888-1-yuehaibing@huawei.com>
 <20180801103645.5df924b9@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180801103645.5df924b9@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc: linus.walleij@linaro.org, yamada.masahiro@socionext.com, keescook@chromium.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2018/8/1 10:36, Jisheng Zhang wrote:
> Hi,
> 
> On Tue, 31 Jul 2018 22:25:01 +0800 YueHaibing wrote:
> 
>> fixes following Smatch static check warning:
>>
>>  drivers/pinctrl/berlin/berlin.c:237 berlin_pinctrl_build_state()
>>  warn: passing devm_ allocated variable to kfree. 'pctrl->functions'
>>
>> As we will be calling krealloc() on pointer 'pctrl->functions', which means
>> kfree() will be called in there, devm_kzalloc() shouldn't be used with
>> the allocation in the first place.  Fix the warning by calling kcalloc()
>> and managing the free procedure in error path on our own.
> 
> Good catch. Comments below.
> 
>>
>> Fixes: 3de68d331c24 ("pinctrl: berlin: add the core pinctrl driver for Marvell Berlin SoCs")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/pinctrl/berlin/berlin.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
>> index d6d183e..db2afb2 100644
>> --- a/drivers/pinctrl/berlin/berlin.c
>> +++ b/drivers/pinctrl/berlin/berlin.c
>> @@ -216,10 +216,8 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>>  	}
>>  
>>  	/* we will reallocate later */
>> -	pctrl->functions = devm_kcalloc(&pdev->dev,
>> -					max_functions,
>> -					sizeof(*pctrl->functions),
>> -					GFP_KERNEL);
>> +	pctrl->functions = kcalloc(max_functions,
>> +				   sizeof(*pctrl->functions), GFP_KERNEL);
>>  	if (!pctrl->functions)
>>  		return -ENOMEM;
>>  
>> @@ -257,8 +255,10 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>>  				function++;
>>  			}
>>  
>> -			if (!found)
>> +			if (!found) {
>> +				kfree(function);
> 
> is it enough to just free one function? I think we need to free functions.

Yep, should free 'pctrl->functions', Thanks!

Will send v2.

> 
>>  				return -EINVAL;
>> +			}
>>  
>>  			if (!function->groups) {
>>  				function->groups =
>> @@ -267,8 +267,10 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
>>  						     sizeof(char *),
>>  						     GFP_KERNEL);
>>  
>> -				if (!function->groups)
>> +				if (!function->groups) {
>> +					kfree(function);
> 
> ditto
> 
>>  					return -ENOMEM;
>> +				}
>>  			}
>>  
>>  			groups = function->groups;
> 
> 
> 
