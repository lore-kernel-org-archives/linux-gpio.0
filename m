From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: max732x: convert to GPIOLIB_IRQCHIP
Date: Tue, 3 Feb 2015 13:35:13 +0100
Message-ID: <CACRpkdYYdRpx2RfHEnkA9gatCYEt-Qv+i2PkGOaLUNi2+xgxfg@mail.gmail.com>
References: <1422614764-5430-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:53906 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365AbbBCMfO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 07:35:14 -0500
Received: by mail-oi0-f49.google.com with SMTP id a3so48719255oib.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2015 04:35:13 -0800 (PST)
In-Reply-To: <1422614764-5430-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sam Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Mans Rullgard <mans@mansr.com>

On Fri, Jan 30, 2015 at 11:46 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:

> Take a sweep to bring the irq support for the MAX732x expanders
> into the gpiolib core to cut down on duplicated code.
>
> Only compile tested! I need some feedback from people using this
> expander with interrupts to tell me if things go right or
> wrong when I do this.
>
> Cc: Semen Protsenko <semen.protsenko@globallogic.com>
> Cc: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Semen can you test this patch?

Yours,
Linus Walleij
