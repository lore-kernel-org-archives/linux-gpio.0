From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: fix confusing debug message in pinctrl_register_map()
Date: Tue, 2 Jun 2015 21:16:52 +0900
Message-ID: <CAK7LNAR7Y8KRDc_V7Y48cLNuz0cnY8YTQqboTi1TTpMbyYzuUw@mail.gmail.com>
References: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdYFRxizbJmJhzx7sa11EEdXu5s5myz+2amgPC-JQC6Kgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg004.nifty.com ([202.248.44.42]:22705 "EHLO
	conssluserg004-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753091AbbFBMRH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 08:17:07 -0400
In-Reply-To: <CACRpkdYFRxizbJmJhzx7sa11EEdXu5s5myz+2amgPC-JQC6Kgg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2015-06-02 20:33 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, May 28, 2015 at 2:52 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> There are two types for pinctrl maps: pinmux and pinconfig
>> This debug message shows the number of maps of both types.
>> The string "pinmux map" is not precise.  Let's say "pinctrl map"
>> instead.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Patch applied, also changed %d->%u as suggested by Joe.
>


When you apply a patch, please check if it is the latest version.

I had already posted v2, so that you do not need to tweak the patch locally.

http://patchwork.ozlabs.org/patch/477666/



-- 
Best Regards
Masahiro Yamada
