From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: initialize clock even without CONFIG_PM
Date: Thu, 2 Jun 2016 14:30:17 +0200
Message-ID: <CACRpkdYeRn7oxOnYv44R8+FMG4CdMrFQ9sjyZC6SDT-OY4Yezg@mail.gmail.com>
References: <20160601110259.GA30501@laureti-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35893 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753125AbcFBMaS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2016 08:30:18 -0400
Received: by mail-oi0-f41.google.com with SMTP id j1so74128316oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2016 05:30:18 -0700 (PDT)
In-Reply-To: <20160601110259.GA30501@laureti-dev>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Grohne <h.grohne@intenta.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>

On Wed, Jun 1, 2016 at 1:03 PM, Helmut Grohne <h.grohne@intenta.de> wrote:

> When the PM initialization was moved in the commit referenced below, the
> code enabling the clock was removed from the probe function. On
> CONFIG_PM=y kernels, this is not a problem as the pm resume hook enables
> the clock, but when power management is disabled, all those pm_*
> functions are noops and the clock is never enabled resulting in a
> dysfunctional gpio controller.
>
> Put the clock initialization back to support CONFIG_PM=n.
>
> Signed-off-by: Helmut Grohne <h.grohne@intenta.de>
> Fixes: 3773c195d387 ("gpio: zynq: Do PM initialization earlier to support gpio hogs")

This does not apply to my kernel tree, can you rebase it on
v4.7-rc1?

Sould it be tagged for stable and sent to fixes?

Yours,
Linus Walleij
