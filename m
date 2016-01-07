From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: brcmstb: have driver register during subsys_initcall()
Date: Thu, 7 Jan 2016 16:28:34 +0100
Message-ID: <CACRpkda7xndoR5M7Jfhys4m_ggPModW=gEhzRZUnG2vn_WYDMg@mail.gmail.com>
References: <1452106523-11556-1-git-send-email-f.fainelli@gmail.com>
	<1452106523-11556-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:34531 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752812AbcAGP2f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 10:28:35 -0500
Received: by mail-oi0-f52.google.com with SMTP id o124so315298869oia.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 07:28:34 -0800 (PST)
In-Reply-To: <1452106523-11556-2-git-send-email-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Gregory Fong <gregory.0xf0@gmail.com>, jaedon.shin@gmail.com, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>

On Wed, Jan 6, 2016 at 7:55 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:

> From: Jim Quinlan <jim2101024@gmail.com>
>
> Because regulators are started with subsys_initcall(), and gpio references may
> be contained in the regulators, it makes sense to start the brcmstb-gpio's with
> a subsys_initcall(). The order within the drivers/Makefile ensures that the
> gpio initialization happens prior to the regulator's initialization.
>
> We need to unroll module_platform_driver() now to allow this and have custom
> exit and init module functions to control the initialization level.
>
> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

I'm holding this back until the initcall ordering discussion is
resolved, the other two patches are applied.

Yours,
Linus Walleij
