From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: single: Use a separate lockdep class
Date: Tue, 1 Dec 2015 15:06:13 +0100
Message-ID: <CACRpkda3g7FXV4vLtj0LnV5H3vhumDrngHeJ6F7yc8y1k_dABg@mail.gmail.com>
References: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33358 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755364AbbLAOGN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 09:06:13 -0500
Received: by obbww6 with SMTP id ww6so5457441obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 06:06:13 -0800 (PST)
In-Reply-To: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 27, 2015 at 6:20 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:

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

I need Tony's ACK on this patch before applying.

Is it a regression that needs to go into fixes?

Yours,
Linus Walleij
