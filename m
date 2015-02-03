From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: pxa: remove mach IRQ includes
Date: Tue, 3 Feb 2015 13:38:39 +0100
Message-ID: <CACRpkdYnm+EpgfNKayZSwOXR_F8FTYk=fLirf61kUtbH2QEhWQ@mail.gmail.com>
References: <1422333966-18338-1-git-send-email-robh@kernel.org>
	<1422333966-18338-2-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:44106 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932250AbbBCMij (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Feb 2015 07:38:39 -0500
Received: by mail-ob0-f182.google.com with SMTP id nt9so18170360obb.13
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2015 04:38:39 -0800 (PST)
In-Reply-To: <1422333966-18338-2-git-send-email-robh@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 27, 2015 at 5:46 AM, Rob Herring <robh@kernel.org> wrote:

> In preparation to enable ARCH_MMP on ARM64, the include of mach/irqs.h
> must be eliminated. mach/irqs.h was being included for IRQ_GPIO{0,1},
> but these IRQs are always passed in as resources now. We can use irq0
> and irq1 and get rid of IRQ_GPIOx. Get rid of the ifdef in the process
> as it is no longer needed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Nice cleanup, patch applied.

Yours,
Linus Walleij
