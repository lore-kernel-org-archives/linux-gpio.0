From: Deepak Das <deepak_das@mentor.com>
Subject: Re: [PATCH] driver: base: pinctrl: return error from
 pinctrl_bind_pins()
Date: Tue, 13 Sep 2016 19:11:38 +0530
Message-ID: <57D80212.7060303@mentor.com>
References: <57D7A700.8080402@mentor.com>
 <CACRpkdandEmr5PTfhUt39wMezMpbE9wEHDTR=jMidzUZY2Cn7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:64377 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbcIMNlo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 09:41:44 -0400
In-Reply-To: <CACRpkdandEmr5PTfhUt39wMezMpbE9wEHDTR=jMidzUZY2Cn7A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, vzapolsk <Vladimir_Zapolskiy@mentor.com>



On Tuesday 13 September 2016 05:29 PM, Linus Walleij wrote:
> On Tue, Sep 13, 2016 at 9:13 AM, Deepak <deepak_das@mentor.com> wrote:
>
>> strict pin controller returns -EINVAL in case of pin request which
>> is already claimed by somebody else.
>> Following is the sequence of calling pin_request() from
>> pinctrl_bind_pins():-
>> pinctrl_bind_pins()->pinctrl_select_state()->pinmux_enable_setting()->
>> pin_request()
>>
>> But pinctrl_bind_pins() only returns -EPROBE_DEFER which makes device
>> driver probe successful even if the pin request is rejected by the pin
>> controller subsystem.
>>
>> This commit modifies pinctrl_bind_pins() to return error if the pin is
>> rejected by pin control subsystem.
>>
>> Signed-off-by: Deepak Das <deepak_das@mentor.com>
>
> Aha
>
>>       /* Only return deferrals */
>> -    if (ret != -EPROBE_DEFER)
>> +    if ((ret != -EPROBE_DEFER) && (ret != -EINVAL))
>>           ret = 0;
>
> I rewrote this when applying, like this:
>
> -       /* Only return deferrals */
> -       if (ret != -EPROBE_DEFER)
> -               ret = 0;
> +       /* Return deferrals */
> +       if (ret == -EPROBE_DEFER)
> +               return ret;
> +       if (ret == -EINVAL) {
> +               dev_err(dev, "could not initialize pin control state\n");
> +               return ret;
> +       }
> +       /* We ignore errors like -ENOENT meaning no pinctrl state */
>
> -       return ret;
> +       return 0;
>
> Can you confim that this works for you too?

Yes, This works for me as well but do we really need this extra error 
message ?
error message is printed before returning -EINVAL from most places, 
Although I did not checked all places. For example, error message in 
pin_request():-
dev_err(pctldev->dev, "pin %s already requested by %s; cannot claim for 
%s\n", desc->name, desc->mux_owner, owner);

Thanks,
Deepak Das
>
> Yours,
> Linus Walleij
>

