From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: fix confusing debug message in pinctrl_register_map()
Date: Mon, 8 Jun 2015 15:33:56 +0200
Message-ID: <CACRpkdZrfzvjyEWaTEJ05q0r0q=Nb7X0b435u0UP_SboE9FDiw@mail.gmail.com>
References: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdYFRxizbJmJhzx7sa11EEdXu5s5myz+2amgPC-JQC6Kgg@mail.gmail.com>
	<CAK7LNAR7Y8KRDc_V7Y48cLNuz0cnY8YTQqboTi1TTpMbyYzuUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34769 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbbFHNd5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2015 09:33:57 -0400
Received: by obbir4 with SMTP id ir4so55842295obb.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2015 06:33:57 -0700 (PDT)
In-Reply-To: <CAK7LNAR7Y8KRDc_V7Y48cLNuz0cnY8YTQqboTi1TTpMbyYzuUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 2, 2015 at 2:16 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2015-06-02 20:33 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Thu, May 28, 2015 at 2:52 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>
>>> There are two types for pinctrl maps: pinmux and pinconfig
>>> This debug message shows the number of maps of both types.
>>> The string "pinmux map" is not precise.  Let's say "pinctrl map"
>>> instead.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> Patch applied, also changed %d->%u as suggested by Joe.
>>
>
>
> When you apply a patch, please check if it is the latest version.

If you had seen my mailbox you would know why that is not always
so easy to just add another routine to be applied to every patch that
comes in.

I tend to do it a bit, in an add hoc manner, sometimes I miss stuff,
mea culpa.

Yours,
Linus Walleij
