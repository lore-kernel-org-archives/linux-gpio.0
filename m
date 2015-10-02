From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: add PM stuff
Date: Fri, 2 Oct 2015 05:03:38 -0700
Message-ID: <CACRpkdav_3NCJR9_UO854P7gEqc6N0qiKWAZm9ypqXd4t8a9vA@mail.gmail.com>
References: <1443172449-19915-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36728 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751494AbbJBMDi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 08:03:38 -0400
Received: by oibi136 with SMTP id i136so56615347oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 05:03:38 -0700 (PDT)
In-Reply-To: <1443172449-19915-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>

On Fri, Sep 25, 2015 at 2:14 AM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:

> Allow GPIOs to be configured as wakeup sources. When going to suspend,
> disable all GPIO irqs excepting the one configured as wakeup sources.
>
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Patch applied.

Yours,
Linus Walleij
