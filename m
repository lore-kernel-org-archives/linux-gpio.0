From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] sh-pfc: handle pin array holes in sh_pfc_map_pins()
Date: Fri, 06 Mar 2015 15:42:05 +0300
Message-ID: <54F9A09D.7040909@cogentembedded.com>
References: <1528110.Mb5xiNU0rc@wasted.cogentembedded.com> <CACRpkdbMzGXeK6fX-h09-3F+jzxNLNsJwzLSeQrLT0MmJDRnWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:40024 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755575AbbCFMmJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 07:42:09 -0500
Received: by lbiw7 with SMTP id w7so17937242lbi.7
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 04:42:07 -0800 (PST)
In-Reply-To: <CACRpkdbMzGXeK6fX-h09-3F+jzxNLNsJwzLSeQrLT0MmJDRnWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 3/6/2015 1:43 PM, Linus Walleij wrote:

>> The  pin array handled by sh_pfc_map_pins() may contain holes representing non-
>> existing pins. We have to first count the valid pins in order to calculate the
>> size  of the memory to be allocated, then to skip over the non-existing pins
>> when  initializing the allocated arrays, and then to return the number of valid
>> pins  from sh_pfc_map_pins() instead of 0 on success.

>> As we have to touch devm_kzalloc() calls anyway, use more fitting devm_kcalloc()
>> instead which additionally checks the array size. And since PINMUX_TYPE_NONE is
>> #define'd as 0, stop re-initializing already zeroed out 'pmx->configs' array.

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

>> ---
>> The patch is against the 'devel' branch of Linus W.'s 'linux-pinctrl.git' repo.
>> This patch should be applied before my R8A7794 PFC support patch and before
>> Laurent's patches removing non-existent GPIOs for R8A779[01], otherwise they
>> would cause the kernel  to hang while booting!

> OK not applying this until ACKed by Laurent,
> and in the meantime I'm taking the three applied R8A7794 patches
> out of my tree again.

    Thanks!

> Can you please send these depending patches as a series with this
> patch as 1/4 and the three R8A7794 patches as 2,3,4/4? Thanks.

    OK, will try to remember. But what about Lauren't 2 patches also dependent 
on this one?

> Yours,
> Linus Walleij

WBR, Sergei

