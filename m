From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: improve overlap check of range of gpio
Date: Sat, 14 Nov 2015 12:30:39 +0100
Message-ID: <CACRpkdbhR--oY0ygdVFfaTkNxOie8UiitFnZj2pMtp_eLMKsyQ@mail.gmail.com>
References: <1447490336-10209-1-git-send-email-bamvor.zhangjian@linaro.org>
	<1447490336-10209-2-git-send-email-bamvor.zhangjian@linaro.org>
	<CACRpkdbnua=3Wsu9TLkh3naKH=DjWixEuTSUZfz4mxk+mprudQ@mail.gmail.com>
	<CAFy1USQBpAhqmaHbky+BS3Eru-XHxnshcYnDEvwBux6T9MrP5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35420 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbbKNLal (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Nov 2015 06:30:41 -0500
Received: by oige206 with SMTP id e206so62829652oig.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2015 03:30:39 -0800 (PST)
In-Reply-To: <CAFy1USQBpAhqmaHbky+BS3Eru-XHxnshcYnDEvwBux6T9MrP5w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>

On Sat, Nov 14, 2015 at 12:20 PM, Bamvor Zhang Jian
<bamvor.zhangjian@linaro.org> wrote:

>> Here we are also below the previous chip, so above the current
>> iterator and below the previous one so we found a "hole".
>> Insert a comment that "we found a hole in the GPIO chip bases".
>
> Yes, we found a valid range between _chip_prev and chip. Is it more clear
> if we use ranges(means [base,base+ngpio]) instead of bases?

Maybe, maybe both. Suggest something that makes sense to you
in your updated patch.

>> And here we are above the last chip in the list.
>> Insert a comment about that too.
>> "We are beyond the last chip in the list".
>
> Yeap. I am sorry for the variable naming and comments. I will update them
> in the next patch.

The naming is not your fault, there was a bad precedent.

> Except for the above comment, any comments or suggestions
> for the logic?

No it makes sense.

Yours,
Linus Walleij
