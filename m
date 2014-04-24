From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 3/4] gpio: make handler_data configurable while using gpiolib_irqchip
Date: Thu, 24 Apr 2014 23:43:04 +0800
Message-ID: <CAGsJ_4xXLvzRV0k7LK2HCHRqkreRMUsnT3qtUbg0s+y8feD-QA@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-4-git-send-email-21cnbao@gmail.com>
	<CACRpkdb8rmMDXS1kfcq7wgOnG2XsPm_bxb15z9_9d3E+trBfQA@mail.gmail.com>
	<CAGsJ_4wmd-ejfHF+MXbO3JSppUDYcEVKeO1WxRM16FtSFEBxpA@mail.gmail.com>
	<CACRpkdYcbngMDPRnuQjPHwo-USHdtK26T_6VM=PFnkT71Dg8Ng@mail.gmail.com>
	<CAGsJ_4y4H63KxJLF1hKaBwHVYb2b_2wTzjO_kGhKUOzScYpKqA@mail.gmail.com>
	<CACRpkdYgzrVHgkc6xJKUebSDxnf1FbdzWXj-f2w-u+A2QY58Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:59877 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753890AbaDXPnF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Apr 2014 11:43:05 -0400
Received: by mail-pd0-f180.google.com with SMTP id v10so2067743pde.11
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2014 08:43:04 -0700 (PDT)
In-Reply-To: <CACRpkdYgzrVHgkc6xJKUebSDxnf1FbdzWXj-f2w-u+A2QY58Cg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

2014-04-24 21:06 GMT+08:00, Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Apr 24, 2014 at 1:23 AM, Barry Song <21cnbao@gmail.com> wrote:
>
>> my point is that will we make the gpiochip_set_chained_irqchip() more
>> general for this kind of cases too since you have had a good API to
>> wrap things?
>
> As it only wraps two function calls I'm leaning toward deleting it as it
> might create more complexity than it removes. Not sure.

i do agree that we can remove it if it doesn't really support general
gpiochip. i think it is popular that some gpiochip has several irq
parents. so people might get confused by this API as it actually
doesn't really help many.

>
> We don't have a similar handler for registering nested threaded
> irq handlers so it's not really helpful.
>
> Yours,
> Linus Walleij
>

-barry

-barry
