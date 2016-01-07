From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH 1/3] gpio: brcmstb: have driver register during subsys_initcall()
Date: Wed, 6 Jan 2016 22:05:10 -0800
Message-ID: <CADtm3G7_pGdgM8EJgRzRf8j1JAJKivxzd85ie5haWP8ivZvwSg@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com> <1452106523-11556-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:33173 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756AbcAGGFl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 01:05:41 -0500
Received: by mail-ig0-f178.google.com with SMTP id z14so44783471igp.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jan 2016 22:05:40 -0800 (PST)
In-Reply-To: <1452106523-11556-2-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-gpio@vger.kernel.org, "open list:MIPS" <linux-mips@linux-mips.org>, jaedon.shin@gmail.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>

Hello Florian and Jim,

On Wed, Jan 6, 2016 at 10:55 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> From: Jim Quinlan <jim2101024@gmail.com>
>
> Because regulators are started with subsys_initcall(), and gpio references may
> be contained in the regulators, it makes sense to start the brcmstb-gpio's with
> a subsys_initcall(). The order within the drivers/Makefile ensures that the
> gpio initialization happens prior to the regulator's initialization.
>
> We need to unroll module_platform_driver() now to allow this and have custom
> exit and init module functions to control the initialization level.

If gpio pins are needed for a regulator to come up, wouldn't it be
better to handle this using deferred probe instead of initcall-based
initialization?  Deferred probe has its problems, but I was under the
impression that it's the encouraged way to resolve these sort of
initialization order issues.

Best regards,
Gregory
