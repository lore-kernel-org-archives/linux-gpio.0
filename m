From: Anatolij Gustschin <agust@denx.de>
Subject: Re:
Date: Fri, 28 Apr 2017 11:26:26 +0200
Message-ID: <20170428112626.59b42dab@crub>
References: <1493367610-7330-1-git-send-email-agust@denx.de>
        <CACRpkda0PDE1b0nud9OLmLX1VWJtEtXfe2s6ryze5_BawFUHaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:35803 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1165016AbdD1J0f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Apr 2017 05:26:35 -0400
In-Reply-To: <CACRpkda0PDE1b0nud9OLmLX1VWJtEtXfe2s6ryze5_BawFUHaQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 28 Apr 2017 10:43:19 +0200
Linus Walleij linus.walleij@linaro.org wrote:
...
>> --- a/include/linux/gpio/consumer.h
>> +++ b/include/linux/gpio/consumer.h  
>
>So why should the stubs be in <linux/gpio/consumer.h>
>and not in <linux/gpio/machine.h>?

good question. I'll move them to machine.h.

Thanks,
Anatolij
