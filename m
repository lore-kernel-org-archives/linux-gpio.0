From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: make handler_data configurable while using gpiolib_irqchip
Date: Wed, 23 Apr 2014 22:13:28 +0200
Message-ID: <CACRpkdb8rmMDXS1kfcq7wgOnG2XsPm_bxb15z9_9d3E+trBfQA@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
	<1397544229-20545-4-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:36535 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753156AbaDWUN3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 16:13:29 -0400
Received: by mail-oa0-f54.google.com with SMTP id i7so1600774oag.13
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 13:13:29 -0700 (PDT)
In-Reply-To: <1397544229-20545-4-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Barry Song <Baohua.Song@csr.com>
>
> since it is called handler_data, drivers should have the ability to
> set handler_data based on real hardware.
> GPIOLIB_IRQCHIP doesn't use handler_data by itself, so it will not
> break GPIO core.
>
> Signed-off-by: Barry Song <Baohua.Song@csr.com>

NAK, the whole idea with the function gpiochip_set_chained_irqchip()
is that its sets things up so that the gpiochip is passed as handler
data on the parent IRQ, akin to how the gpiochip is passed as
chip data on the cascaded IRQs.

Yours,
Linus Walleij
