From: Deepak Das <deepak_das@mentor.com>
Subject: Re: [PATCH] driver: base: pinctrl: return error from
 pinctrl_bind_pins()
Date: Wed, 14 Sep 2016 11:52:00 +0530
Message-ID: <57D8EC88.1060808@mentor.com>
References: <57D7A700.8080402@mentor.com>
 <CACRpkdandEmr5PTfhUt39wMezMpbE9wEHDTR=jMidzUZY2Cn7A@mail.gmail.com>
 <57D80212.7060303@mentor.com>
 <CACRpkdZewXRXqj2nFTwbnbEor=OSV44AGedwCWOVROmktxcZQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:56299 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751764AbcINGWI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 02:22:08 -0400
In-Reply-To: <CACRpkdZewXRXqj2nFTwbnbEor=OSV44AGedwCWOVROmktxcZQQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, vzapolsk <Vladimir_Zapolskiy@mentor.com>



On Wednesday 14 September 2016 02:31 AM, Linus Walleij wrote:
> On Tue, Sep 13, 2016 at 3:41 PM, Deepak Das <deepak_das@mentor.com> wrote:
>
>>> Can you confim that this works for you too?
>>
>> Yes, This works for me as well but do we really need this extra error
>> message ?
>
> Nah, good point. I'll go in and drop it then.

Hi Linus,

I will release V2 version of this patch with following change :-
-       /* Only return deferrals */
+       /* Return deferrals & invalid pin requests */
         if ((ret != -EPROBE_DEFER) && (ret != -EINVAL))
                 ret = 0;

Thanks & regards,
Deepak Das

>
> Yours,
> Linus Walleij
>

