From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFT: pinctrl: spear: switch plgpio to irqchip helpers
Date: Thu, 12 Jun 2014 09:23:20 +0200
Message-ID: <CACRpkdZhJONmqV8SNLxxo1srcRbdmrDwH4x1UiwE=fp1MY370Q@mail.gmail.com>
References: <1401355531-632-1-git-send-email-linus.walleij@linaro.org>
	<CAOh2x=njLfu5D0=oH6kmdm9hnk3e1RXEsFtwsXJcOJ-JFcm1XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34683 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754411AbaFLHXV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jun 2014 03:23:21 -0400
Received: by mail-ob0-f172.google.com with SMTP id uy5so908536obc.31
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2014 00:23:20 -0700 (PDT)
In-Reply-To: <CAOh2x=njLfu5D0=oH6kmdm9hnk3e1RXEsFtwsXJcOJ-JFcm1XQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "pratyush.anand" <pratyush.anand@st.com>, Mohit Kumar <mohit.kumar@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, spear-devel <spear-devel@list.st.com>

On Tue, Jun 3, 2014 at 6:29 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On Thu, May 29, 2014 at 2:55 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> This switches the SPEAr PLGPIO driver over to using the irqchip
>> helpers.
>>
>> As part of this effort, also get rid of the strange irq_base
>> calculation and failure to use d->hwirq for obtaining a local
>> irqchip offset.
>>
>> Cc: Viresh Kumar <viresh.linux@gmail.com>
>> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
>> Cc: spear-devel@list.st.com
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> SPEAr folks: please make sure to test this, it is part of an
>> important GPIO refactoring round. If it doesn't work: please do
>> an honest attempt at troubleshooting.
>
> Both me and shiraz can't test it anymore, we switched our jobs :)
> And not sure who else can do it..

Hum? If the maintainers can't maintain the thing, then maybe the
machine should just be deleted?

I will just apply this patch then.

Yours,
Linus Walleij
