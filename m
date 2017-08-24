From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gliolib: request the gpio before querying its direction
Date: Thu, 24 Aug 2017 23:28:25 +0200
Message-ID: <CACRpkdZ-=uyFntmwL3Z8dg32ovRwRuz0XRXr833TEjokvg+5=A@mail.gmail.com>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
 <1501179565-26466-2-git-send-email-timur@codeaurora.org> <CACRpkdYPBd4ZvuXo__LRQezTQD3u=3r2WO+2dTzBanLL1zX72w@mail.gmail.com>
 <103341c8-6cc5-3d3f-eef7-28b9f31cdc71@codeaurora.org> <CACRpkdZv0NjXfwm_-TSoY=QFeP64V-ZoKvmLXk3qkV49fq1UtQ@mail.gmail.com>
 <e1eae89c-f007-2e0b-cbb8-1aba71dae0e1@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35739 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753932AbdHXV20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2017 17:28:26 -0400
Received: by mail-oi0-f46.google.com with SMTP id k77so6524521oib.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Aug 2017 14:28:26 -0700 (PDT)
In-Reply-To: <e1eae89c-f007-2e0b-cbb8-1aba71dae0e1@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Aug 24, 2017 at 1:28 AM, Timur Tabi <timur@codeaurora.org> wrote:
> On 08/23/2017 03:32 AM, Linus Walleij wrote:
>>
>> It's right there on the "devel" branch from the GPIO git tree.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel
>
>
> The devel branch is missing this commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=83cf5faeba37fede8a6274d07f646d1cd1b25d35

Yes I have separate git trees for GPIO and pin control even.

> which I need to avoid a merge conflict.  I'm going to submit a new version
> of my patches, but they won't apply on top of 'devel' unless you pull in
> that commit from linux-pinctrl.  Or you could copy that my gpiolib commit to
> linux-pinctrl.

I don't see how you can have a merge conflict between this
patch that only affects gpiolib.c and something in the pin
control tree?

The merge window is imminent, so if it is not extremely urgent
I would opt to wait until after.

Yours,
Linus Walleij
