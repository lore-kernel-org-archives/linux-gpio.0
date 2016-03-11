From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: single: Use a separate lockdep class
Date: Fri, 11 Mar 2016 23:04:10 +0700
Message-ID: <CACRpkdbwYx2uA4k1XzW861ig+S0uP0D1K3Mv5G6dcG-rNPn6wQ@mail.gmail.com>
References: <1454351299-27440-1-git-send-email-sudeep.holla@arm.com>
	<1454351299-27440-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36326 "EHLO
	mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932371AbcCKQEL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2016 11:04:11 -0500
Received: by mail-oi0-f49.google.com with SMTP id r187so88893576oih.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2016 08:04:11 -0800 (PST)
In-Reply-To: <1454351299-27440-2-git-send-email-sudeep.holla@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 2, 2016 at 1:28 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> The single pinmux controller can be cascaded to the other interrupt
> controllers. Hence when propagating wake-up settings to its parent
> interrupt controller, there's possiblity of detecting possible recursive
> locking and getting lockdep warning.
>
> This patch avoids this false positive by using a separate lockdep class
> for this single pinctrl interrupts.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Patch applied with Grygorii's review tag.

Yours,
Linus Walleij
