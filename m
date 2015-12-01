From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: single: remove misuse of IRQF_NO_SUSPEND flag
Date: Tue, 1 Dec 2015 15:06:52 +0100
Message-ID: <CACRpkdYy1fPAm5r0GxXxzgZA7RsqJ6ZtPtNzd1bzrfkME_j09g@mail.gmail.com>
References: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
	<1448644860-29323-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:36831 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755852AbbLAOGx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 09:06:53 -0500
Received: by obcse5 with SMTP id se5so1441559obc.3
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 06:06:52 -0800 (PST)
In-Reply-To: <1448644860-29323-2-git-send-email-sudeep.holla@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 27, 2015 at 6:21 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:

> From: Sudeep Holla <Sudeep.Holla@arm.com>
>
> The IRQF_NO_SUSPEND flag is used to identify the interrupts that should
> be left enabled so as to allow them to work as expected during the
> suspend-resume cycle, but doesn't guarantee that it will wake the system
> from a suspended state, enable_irq_wake is recommended to be used for
> the wakeup.
>
> This patch removes the use of IRQF_NO_SUSPEND flags replacing it with
> irq_set_irq_wake instead.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

I need Tony's ACK on this as well.

Yours,
Linus Walleij
