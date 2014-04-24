From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: make handler_data configurable while using gpiolib_irqchip
Date: Thu, 24 Apr 2014 15:06:21 +0200
Message-ID: <CACRpkdYgzrVHgkc6xJKUebSDxnf1FbdzWXj-f2w-u+A2QY58Cg@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-4-git-send-email-21cnbao@gmail.com>
	<CACRpkdb8rmMDXS1kfcq7wgOnG2XsPm_bxb15z9_9d3E+trBfQA@mail.gmail.com>
	<CAGsJ_4wmd-ejfHF+MXbO3JSppUDYcEVKeO1WxRM16FtSFEBxpA@mail.gmail.com>
	<CACRpkdYcbngMDPRnuQjPHwo-USHdtK26T_6VM=PFnkT71Dg8Ng@mail.gmail.com>
	<CAGsJ_4y4H63KxJLF1hKaBwHVYb2b_2wTzjO_kGhKUOzScYpKqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f43.google.com ([209.85.219.43]:62508 "EHLO
	mail-oa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753805AbaDXNGW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Apr 2014 09:06:22 -0400
Received: by mail-oa0-f43.google.com with SMTP id eb12so2592779oac.16
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2014 06:06:21 -0700 (PDT)
In-Reply-To: <CAGsJ_4y4H63KxJLF1hKaBwHVYb2b_2wTzjO_kGhKUOzScYpKqA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Thu, Apr 24, 2014 at 1:23 AM, Barry Song <21cnbao@gmail.com> wrote:

> my point is that will we make the gpiochip_set_chained_irqchip() more
> general for this kind of cases too since you have had a good API to
> wrap things?

As it only wraps two function calls I'm leaning toward deleting it as it
might create more complexity than it removes. Not sure.

We don't have a similar handler for registering nested threaded
irq handlers so it's not really helpful.

Yours,
Linus Walleij
