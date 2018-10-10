From: Sodagudi Prasad <psodagud@codeaurora.org>
Subject: Re: protected pins and debugfs
Date: Wed, 10 Oct 2018 12:40:41 -0700
Message-ID: <5848ff92c1388b7d6904e88b57bbfec8@codeaurora.org>
References: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
 <153897864285.119890.13024399324598460044@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153897864285.119890.13024399324598460044@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2018-10-07 23:04, Stephen Boyd wrote:
> Quoting Sodagudi Prasad (2018-10-03 05:38:24)
>> 
>>          for (i = 0; i < chip->ngpio; i++, gpio++) {
>> +               label = gpiochip_is_requested(chip, i);
>> +               if (!label)
>> +                       continue;
>>                  msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
>> -               seq_puts(s, "\n");
>>          }
>>   }
>> 
> 
> Does something not work with the following code in
> msm_gpio_dbg_show_one()?
> 
> 
>         if (!gpiochip_line_is_valid(chip, offset))
> 		return;

Hi Stephen,
I didnt realize that these changes are merged on tip. I was testing on 
4.14 kernel.

https://lore.kernel.org/patchwork/patch/878107/
https://lore.kernel.org/patchwork/patch/878106/
https://lore.kernel.org/patchwork/patch/878109/

I will add "gpio-reserved-ranges" to internal platforms and this issue 
should not be observed.

-thanks, Prasad

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
Linux Foundation Collaborative Project
