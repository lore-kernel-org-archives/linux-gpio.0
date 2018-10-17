From: Sodagudi Prasad <psodagud@codeaurora.org>
Subject: Re: protected pins and debugfs
Date: Tue, 16 Oct 2018 19:00:45 -0700
Message-ID: <91594b8e6578d542dc7cbebf34458b0c@codeaurora.org>
References: <9aec322678417753fe4022691f4bfdbe@codeaurora.org>
 <153897864285.119890.13024399324598460044@swboyd.mtv.corp.google.com>
 <5848ff92c1388b7d6904e88b57bbfec8@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5848ff92c1388b7d6904e88b57bbfec8@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On 2018-10-10 12:40, Sodagudi Prasad wrote:
> On 2018-10-07 23:04, Stephen Boyd wrote:
>> Quoting Sodagudi Prasad (2018-10-03 05:38:24)
>>> 
>>>          for (i = 0; i < chip->ngpio; i++, gpio++) {
>>> +               label = gpiochip_is_requested(chip, i);
>>> +               if (!label)
>>> +                       continue;
>>>                  msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
>>> -               seq_puts(s, "\n");
>>>          }
>>>   }
>>> 
>> 
>> Does something not work with the following code in
>> msm_gpio_dbg_show_one()?
>> 
>> 
>>         if (!gpiochip_line_is_valid(chip, offset))
>> 		return;
> 
> Hi Stephen,
> I didnt realize that these changes are merged on tip. I was testing on
> 4.14 kernel.
> 
> https://lore.kernel.org/patchwork/patch/878107/
> https://lore.kernel.org/patchwork/patch/878106/
> https://lore.kernel.org/patchwork/patch/878109/


Hi Stephen,

After checking this further, adding "gpio-reserved-ranges" in not good 
option. Because of the following reasons.
1) These gpio information changes from platform to platform. So need to 
maintain reserved-range properly for each platform.
2) Also some of the gpio can be changed to secure/protected gpio 
dynamically based on the use case.

It looks adding the "gpio-reserved-ranges" ranges is not good option for 
most of the platforms.

Can you please check the initial patch suggested in this thread? Please 
let me know if you have any other options for the above points.

-Thanks, Prasad

> 
> I will add "gpio-reserved-ranges" to internal platforms and this issue
> should not be observed.
> 
> -thanks, Prasad

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
Linux Foundation Collaborative Project
