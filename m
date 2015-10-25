From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 4/6] tools/gpio: create GPIO tools
Date: Sun, 25 Oct 2015 17:23:28 +0900
Message-ID: <CAAVeFuJDapVJC249YLPPmw1riG6kJGmKMSajBkZkyPdKso+VBQ@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org> <1445502750-22672-5-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:35942 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751960AbbJYIXs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Oct 2015 04:23:48 -0400
Received: by igdg1 with SMTP id g1so40913915igd.1
        for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2015 01:23:47 -0700 (PDT)
In-Reply-To: <1445502750-22672-5-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Oct 22, 2015 at 5:32 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This creates GPIO tools under tools/gpio/* and adds a single
> example program to list the GPIOs on a system. When proper
> devices are created it provides this minimal output:
>

Output missing in the commit log, unless you wanted to say that it
produces no output. ;)
