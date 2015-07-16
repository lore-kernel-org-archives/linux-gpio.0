From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] MIPS: ath79: Remove the unused GPIO function API
Date: Thu, 16 Jul 2015 14:43:00 +0200
Message-ID: <CACRpkdaQZpH=rXBxmOmYzcp88YkZYf2dCnS-UuN3zz8L2zFg5g@mail.gmail.com>
References: <1435914709-15092-1-git-send-email-albeu@free.fr>
	<1435914709-15092-2-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33965 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754019AbbGPMnA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 08:43:00 -0400
Received: by oigd21 with SMTP id d21so6911208oig.1
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 05:43:00 -0700 (PDT)
In-Reply-To: <1435914709-15092-2-git-send-email-albeu@free.fr>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 3, 2015 at 11:11 AM, Alban Bedel <albeu@free.fr> wrote:

> To prepare moving the GPIO driver to drivers/gpio remove the
> platform specific pinmux API. As it is not used by any board,
> and such functionality should better be implemented using the
> pinmux subsystem just removing it seems to be the best option.
>
> Signed-off-by: Alban Bedel <albeu@free.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
