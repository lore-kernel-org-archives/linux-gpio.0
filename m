From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xlp: Convert to use gpiolib irqchip helpers
Date: Thu, 22 Oct 2015 14:39:56 +0200
Message-ID: <CACRpkdZWmL7ZweZkR-7EnRfmh03xqYYvG0N9ExV9DppboAJ=3w@mail.gmail.com>
References: <1444913612-14291-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:32889 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753405AbbJVMj5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2015 08:39:57 -0400
Received: by obbwb3 with SMTP id wb3so66534756obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2015 05:39:57 -0700 (PDT)
In-Reply-To: <1444913612-14291-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jayachandran C <jchandra@broadcom.com>

On Thu, Oct 15, 2015 at 2:53 PM,  <kamlakant.patel@broadcom.com> wrote:

> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> commit "325f0a (MIPS: Netlogic: Use chip_data for irq_chip methods)"
> Updates "mips/netlogic/common/irq.c" to use chip_data to store interrupt
> controller data pointer. Before this commit handler_data was used to
> store interrupt controller data which caused errors while using
> gpiochip_set_chained_irqchip.
>
> Update XLP GPIO driver to use the gpiolib irqchip helpers.
> And add missing depends on OF_GPIO in Kconfig.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>

Patch applied.

Yours,
Linus Walleij
