From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] pinctrl: sirf: switch to one gpiolib and
 gpiolib_irqchip helpers
Date: Tue, 22 Apr 2014 23:47:52 +0200
Message-ID: <CACRpkdY6N3vh2-a5NwU0ZkXKsf8ArmxLBCL3dMrPTFwvN+x5JQ@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:50577 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752658AbaDVVrx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 17:47:53 -0400
Received: by mail-ob0-f173.google.com with SMTP id wn1so100984obc.4
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 14:47:53 -0700 (PDT)
In-Reply-To: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

On Tue, Apr 15, 2014 at 8:43 AM, Barry Song <21cnbao@gmail.com> wrote:

> From: Barry Song <Baohua.Song@csr.com>
>
> This patchset depends on Linus Walleij's "pinctrl: sirf: rename inlined accessor".
> and "pinctrl: sirf: switch driver to use gpiolib irqchip helpers" is rebased
> from Linus Walleij's patch too.
>
> Barry Song (3):
>   pinctrl: sirf: wrap all gpio banks into one gpio_chip
>   gpio: make handler_data configurable while using gpiolib_irqchip
>   pinctrl: sirf: move to use irq_get_handler_data
> Linus Walleij (1):
>   pinctrl: sirf: switch driver to use gpiolib irqchip helpers

As mentioned I can't get this series to apply so please rebase,
resend and take this opportunity to also add relevant ACKs.

Yours,
Linus Walleij
