From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] pinctrl/lantiq: Implement gpio_chip.to_irq
Date: Fri, 11 Dec 2015 00:06:28 +0100
Message-ID: <CACRpkdbpWAcMsxWdfEZO_Y-5hOwOGK7=uEjGcenmXm9u79mbUA@mail.gmail.com>
References: <1449223544-3527-1-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36374 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753908AbbLJXG2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 18:06:28 -0500
Received: by obcse5 with SMTP id se5so70945101obc.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 15:06:28 -0800 (PST)
In-Reply-To: <1449223544-3527-1-git-send-email-mschiller@tdt.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Crispin <blogic@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>, Jonas Gorski <jogo@openwrt.org>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

On Fri, Dec 4, 2015 at 11:05 AM, Martin Schiller <mschiller@tdt.de> wrote:

> From: John Crispin <blogic@openwrt.org>
>
> Some drivers require a way to translate GPIO pins to their IRQ numbers.
>
> This patch adds the .to_irq() gpiolib callback to the pinctrl-xway
> driver, which returns an IRQ mapping for a given GPIO pin.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Signed-off-by: Martin Schiller <mschiller@tdt.de>
> ---
> Changes in v4:
> - Added commit message + comment

Patch applied. I had to apply this to the GPIO tree as I am working
with some GPIO refactorings.

Yours,
Linus Walleij
