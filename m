From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Thu, 30 Nov 2017 10:49:28 +0100
Message-ID: <CACRpkdZ1PMOC0WuS4O=B1ieJyBCwLDzQ=UHri43yEYJmuNtwNQ@mail.gmail.com>
References: <20171130092655.25965-1-linus.walleij@linaro.org> <3058528.dbeyJzq7DI@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:46088 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750760AbdK3Jt3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 04:49:29 -0500
Received: by mail-io0-f182.google.com with SMTP id x129so6870828iod.13
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 01:49:29 -0800 (PST)
In-Reply-To: <3058528.dbeyJzq7DI@ws-stein>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Felipe Balbi <felipe.balbi@linux.intel.com>

On Thu, Nov 30, 2017 at 10:46 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:
> On Thursday, November 30, 2017, 10:26:55 AM CET Linus Walleij wrote:

>> +     s64 timestamp;
>     ^^^
> u64? ktime_get_real_ns() returns u64 and struct gpioevent_data
> has __u64 for timestamp.

OK sorry, fixing it. Thanks for noticing!

Yours,
Linus Walleij
