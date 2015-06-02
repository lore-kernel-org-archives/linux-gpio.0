From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: add pinctrl_register_reason() to return proper
 error code
Date: Wed, 3 Jun 2015 00:32:33 +0900
Message-ID: <CAK7LNASuVz1R7ftXTGZycMm-qdgx8MGxe6nCpA9QwDG0fJoDsg@mail.gmail.com>
References: <1432899016-18155-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdZywHgUHbMg-1gfBDPZ3uXHuBWMvkAUZgkDRbn6Hi2Ovg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:51921 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932228AbbFBPcr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 11:32:47 -0400
In-Reply-To: <CACRpkdZywHgUHbMg-1gfBDPZ3uXHuBWMvkAUZgkDRbn6Hi2Ovg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,


2015-06-02 21:56 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, May 29, 2015 at 1:30 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> The pinctrl_register() just returns NULL on error, so the callers
>> can not know the exact reason of the failure.
>>
>> Some of the pinctrl drivers return -EINVAL, some -ENODEV, and some
>> -ENOMEM on error of pinctrl_register() , although the error code
>> might be different from the actual cause of the error.
>>
>> This new function, pinctrl_register_reason(), helps the drivers get
>> and return the appropriate error code.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>
> It should be named pinctrl_register_strict() or something.
> "reason" is anyways wrong, should be "cause", but please
> use _strict().

OK, I will do it.


>> If this patch is accepted, I can send a series to replace
>> the pinctrl_register() in each driver with pinctrl_register_reason().
>
> If it is replaced *everywhere* there is no point in keeping
> a separate function. Then you should just do a big
> patch changing all usage sites and the original function.


If nobody is opposed to this, I can send a single big patch
replacing all the references.

In that case, we would not need _strict().

My concern is the sudden change of the function interface
will break drivers that are under development out of the source tree.



-- 
Best Regards
Masahiro Yamada
