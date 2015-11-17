From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH V2 1/2] gpiolib: improve overlap check of range of gpio
Date: Tue, 17 Nov 2015 22:47:57 +0800
Message-ID: <CAFy1USQAQFW9rYTVvf9tww1T-JGxtuwS9i85WiCzjB-XPN4p4g@mail.gmail.com>
References: <1447650167-29070-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447650167-29070-2-git-send-email-bamvor.zhangjian@linaro.org>
	<CACRpkdYOQfMV46GCRfKBxeUFwz7FjUGw-r6Gej6SWef0_j03_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:34694 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751877AbbKQOr5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 09:47:57 -0500
Received: by igvg19 with SMTP id g19so97158791igv.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 06:47:57 -0800 (PST)
In-Reply-To: <CACRpkdYOQfMV46GCRfKBxeUFwz7FjUGw-r6Gej6SWef0_j03_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Linus

On 11/17/2015 10:14 PM, Linus Walleij wrote:
> On Mon, Nov 16, 2015 at 6:02 AM, Bamvor Jian Zhang
> <bamvor.zhangjian@linaro.org> wrote:
>
>> There are limitations for the current checker:
>> 1.  Could not check the overlap if the new gpiochip is the secondly
>>     gpiochip.
>> 2.  Could not check the overlap if the new gpiochip is overlap
>>     with the left of gpiochip. E.g. if we insert [c, d] between
>>     [a,b] and [e, f], and e >= c + d, it will successful even if
>>     c < a + b.
>> 3.  Allow overlap of base of different gpiochip.
>>
>> This patch fix these issues by checking the overlap of both right and
>> left gpiochip in the same loop statement.
>>
>> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> Patch applied with some tweaks. Had to rebase it because
> I renamed ->dev to ->parent in the GPIO tree, then I found
> it possible to get rid of the ret variable altogether.
Oh, I am sorry. I notice you parent patch but I worked on your "for-next"
branch. I will take care next time.

Thanks your help.

Regards

Bamvor
>
> Yours,
> Linus Walleij
>
