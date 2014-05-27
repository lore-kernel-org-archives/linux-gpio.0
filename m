From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add run-time dependencies to R-Car driver
Date: Tue, 27 May 2014 15:45:57 +0200
Message-ID: <CACRpkdYoh0o7X1_T6fdQjbvdw9w-TdXCLachEvFcW4SGAFQd-A@mail.gmail.com>
References: <20140523134214.0f29c9e0@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:59521 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141AbaE0Np7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 09:45:59 -0400
Received: by mail-ob0-f170.google.com with SMTP id uy5so9220141obc.15
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 06:45:58 -0700 (PDT)
In-Reply-To: <20140523134214.0f29c9e0@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Magnus Damm <damm@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, Alexandre Courbot <gnurou@gmail.com>

On Fri, May 23, 2014 at 1:42 PM, Jean Delvare <jdelvare@suse.de> wrote:

> The Renesas R-Car GPIO driver is only useful on shmobile unless build
> testing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Magnus Damm <damm@opensource.se>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Patch applied with Simon's ACK.

> Simon, is it correct? I couldn't remove the dependency on ARM because
> the driver uses set_irq_flags which is arm-specific.

We usually #ifdef CONFIG_ARM around that function call actually.

But now, we also do that in the core gpiolib irqchip helpers, so just
switch this driver to use the irqchip helpers and you can drop the ARM
dependency.

Yours,
Linus Walleij
