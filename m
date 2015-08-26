From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: Use generic irq_{request,release}_resources()
Date: Wed, 26 Aug 2015 09:32:55 +0200
Message-ID: <CACRpkdbPt4rZF0gvsCkz20qftRCkMeiZ0vP-OOn2SEjFuEFcPg@mail.gmail.com>
References: <1439818336-31230-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36528 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751898AbbHZHc4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:32:56 -0400
Received: by obkg7 with SMTP id g7so163971027obk.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:32:55 -0700 (PDT)
In-Reply-To: <1439818336-31230-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Aug 17, 2015 at 3:32 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The at91-specific irq_{request,release}_resources() callbacks are
> identical to the generic ones, modulo the bug fix in 5b76e79c77264899
> ("gpiolib: irqchip: prevent driver unloading if gpio is used as irq
> only").
>
> Until commit 8b67a1f0ad1f260f ("gpio: don't override irq_*_resources()
> callbacks"), the buggy at91-specific callbacks were never used, though.
>
> Hence drop the at91-specific ones in favor of the generic ones.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.

Right thing to do so patch applied.

Yours,
Linus Walleij
