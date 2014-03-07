From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-tz1090: Replace commas with semi-colons
Date: Fri, 7 Mar 2014 11:39:44 +0800
Message-ID: <CACRpkdapHW6OiF5x6Ufp+n2NqM_C0UMoWhBwHsTEvO26M=R4Vw@mail.gmail.com>
References: <1393932528-25207-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:60608 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751130AbaCGDjo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Mar 2014 22:39:44 -0500
Received: by mail-oa0-f45.google.com with SMTP id o6so3602627oag.32
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2014 19:39:44 -0800 (PST)
In-Reply-To: <1393932528-25207-1-git-send-email-james.hogan@imgtec.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-metag@vger.kernel.org

On Tue, Mar 4, 2014 at 7:28 PM, James Hogan <james.hogan@imgtec.com> wrote:

> Replace commas with semicolons between irqchip callback initialisation
> statements in tz1090_gpio_bank_probe. The commas appear to be a subtle
> remnant of when the irqchips were statically initialised.
>
> Thanks to Thomas Gleixner for spotting it while whipping up a coccinelle
> script.
>
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-metag@vger.kernel.org

Patch applied!

Yours,
Linus Walleij
