From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Thu, 5 Mar 2015 10:11:30 +0100
Message-ID: <CACRpkdaoDgNpLxk_GR=9XaZ7=AzBmSOrScQzMpGYdtO8g2yckw@mail.gmail.com>
References: <1422412229-23640-1-git-send-email-chao.xie@marvell.com>
	<CACRpkdbUqCQZiSDbiD994ecF4h6xHShE8yfdrE2vNVNW+082zw@mail.gmail.com>
	<CAN1soZxOgHuAiAwwYmrwBnczkwX8WTJBMA6paX+WJePd89yX8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:38394 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754378AbbCEJLb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2015 04:11:31 -0500
Received: by obcwo20 with SMTP id wo20so12603488obc.5
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2015 01:11:31 -0800 (PST)
In-Reply-To: <CAN1soZxOgHuAiAwwYmrwBnczkwX8WTJBMA6paX+WJePd89yX8w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Chao Xie <chao.xie@marvell.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chao Xie <xiechao_mail@163.com>

On Tue, Feb 10, 2015 at 7:24 AM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> On Tue, Feb 3, 2015 at 9:21 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Jan 28, 2015 at 3:30 AM, Chao Xie <chao.xie@marvell.com> wrote:
>>
>>> From: Chao Xie <chao.xie@marvell.com>
>>>
>>> For some old PXA series, they used PXA GPIO driver.
>>> The IP of GPIO changes since PXA988 which is Marvell MMP
>>> series.
>>> It will use new way to control the GPIO level, direction
>>> and edge status.
>>>
>>> Signed-off-by: Chao Xie <chao.xie@marvell.com>
>>
>> (...)
>>
>
> Just a silly question. What's the meaning of (...)? There're a lot of
> comments as (...). It's my first time to see this.

It just means I deleted and skipped over a few lines in the patch
that was looking OK or irrelevant to comment on, so as to keep
the mail to just the relevant parts.

Yours,
Linus Walleij
