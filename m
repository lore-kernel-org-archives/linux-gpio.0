From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] gpio: omap: remove wrong irq_domain_remove usage in probe
Date: Wed, 26 Aug 2015 09:45:43 +0200
Message-ID: <CACRpkdaCf5hyruKDtUst2Hme2JJv5AF0CwTSX7tGmvZ9rVp=Lw@mail.gmail.com>
References: <1439896258-26449-1-git-send-email-grygorii.strashko@ti.com>
	<1439896258-26449-2-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35854 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756188AbbHZHpo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:45:44 -0400
Received: by obkg7 with SMTP id g7so164191195obk.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:45:44 -0700 (PDT)
In-Reply-To: <1439896258-26449-2-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 1:10 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> The bank->chip.irqdomain is uninitialized at the moment when
> irq_domain_remove() is called, so remove this call.
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Obviously correct, patch applied.

Yours,
Linus Walleij
