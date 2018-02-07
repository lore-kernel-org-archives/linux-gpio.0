From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: msm: allow the gpio base to be configurable
Date: Wed, 7 Feb 2018 14:19:50 +0100
Message-ID: <CACRpkdaa0Ovb0kbE6J0vy4UJYv5fn6X2289pkX3b+HBze5FRJg@mail.gmail.com>
References: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
 <20180128232310.GA12728@builder> <042b6cea-38f7-a660-0059-5f24fc7db9eb@codeaurora.org>
 <20180129005129.GB12728@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:42588 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753796AbeBGNTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Feb 2018 08:19:51 -0500
Received: by mail-io0-f195.google.com with SMTP id 25so1967532ioj.9
        for <linux-gpio@vger.kernel.org>; Wed, 07 Feb 2018 05:19:51 -0800 (PST)
In-Reply-To: <20180129005129.GB12728@builder>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Timur Tabi <timur@codeaurora.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>

On Mon, Jan 29, 2018 at 1:51 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

>> > My bad, this should have been -1.
>>
>> Perhaps, but it's been 0 for a very long time, so I don't want to break any
>> existing platforms by suddenly relocating all GPIOs across all Qualcomm
>> platforms.
>>
>
> Yeah, I see that I got this wrong when I wrote the driver 4 years ago...
>
> There should be no in-kernel users depending on these numbers being hard
> coded, so anyone depending on these numbers starting at 0 would be user
> space - doing so incorrectly.

There is a good point in what Tmur is saying here. We never break
userspace, if we can avoid it.

If there is a real problem with setting this base to -1 then I suggest

if (tlmm_has_only_one_instance)
   base = 0;
else
   base = -1;

Especially for an upcoming platform we can start with a clean slate,
it certainly does not have any legacy userspace.

If no problems are detected, let's just use -1.

Yours,
Linus Walleij
