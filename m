From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Tue, 10 Feb 2015 14:24:25 +0800
Message-ID: <CAN1soZxOgHuAiAwwYmrwBnczkwX8WTJBMA6paX+WJePd89yX8w@mail.gmail.com>
References: <1422412229-23640-1-git-send-email-chao.xie@marvell.com>
	<CACRpkdbUqCQZiSDbiD994ecF4h6xHShE8yfdrE2vNVNW+082zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:48597 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891AbbBJGY1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 01:24:27 -0500
In-Reply-To: <CACRpkdbUqCQZiSDbiD994ecF4h6xHShE8yfdrE2vNVNW+082zw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Chao Xie <chao.xie@marvell.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, xiechao_mail@163.com

On Tue, Feb 3, 2015 at 9:21 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jan 28, 2015 at 3:30 AM, Chao Xie <chao.xie@marvell.com> wrote:
>
>> From: Chao Xie <chao.xie@marvell.com>
>>
>> For some old PXA series, they used PXA GPIO driver.
>> The IP of GPIO changes since PXA988 which is Marvell MMP
>> series.
>> It will use new way to control the GPIO level, direction
>> and edge status.
>>
>> Signed-off-by: Chao Xie <chao.xie@marvell.com>
>
> (...)
>

Just a silly question. What's the meaning of (...)? There're a lot of
comments as (...). It's my first time to see this.
