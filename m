From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [REGRESSION next] gpio-keys broken with commit 2233bf7a92e7 ("gpio: mvebu: switch to regmap for register access")
Date: Fri, 09 Jun 2017 12:12:24 +0200
Message-ID: <87vao5o4fr.fsf@free-electrons.com>
References: <20170609085038.4af4f038@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:35448 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbdFIKM0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 06:12:26 -0400
In-Reply-To: <20170609085038.4af4f038@gmail.com> (Ralph Sennhauser's message
        of "Fri, 9 Jun 2017 08:50:38 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Ralph,
 
 On ven., juin 09 2017, Ralph Sennhauser <ralph.sennhauser@gmail.com> wrote:

> Hi Thomas,
>
> Commit 2233bf7a92e7 ("gpio: mvebu: switch to regmap for register
> access") in next-20170607 breaks gpio-keys on an armada-385 (Linksys
> WRT3200ACM), noticed due to missing /dev/input/event0 and the below
> dmesg output.
>
>   # dmesg -l 0,1,2,3
>   [    2.421130] genirq: Setting trigger mode 3 for irq 49 failed (mvebu_gpio_irq_set_type+0x0/0x168)
>   [    2.429953] gpio-keys gpio-keys: Unable to claim irq 49; error -22
>
>
> After reverting the offending commit all works again.

I found the bug and I've just sent a fix for it (use the v2 as the first
version was wrong).

Thanks for the report,

Gregory


>
> Ralph

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
