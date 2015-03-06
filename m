From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] RFC: let gpiod_get_optional et all return NULL when
 GPIOLIB is not enabled
Date: Fri, 6 Mar 2015 09:26:26 +0100
Message-ID: <CACRpkdb6KcZx3WfTqUKemhQ0_OsqxBGQb_P5cXXZvgc3riakdA@mail.gmail.com>
References: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34896 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932352AbbCFI01 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2015 03:26:27 -0500
Received: by obbgq1 with SMTP id gq1so19338021obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2015 00:26:26 -0800 (PST)
In-Reply-To: <1423731809-4800-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 12, 2015 at 10:03 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> I wonder if gpiod_get_optional et all should be changed to return NUL=
L
> instead.

This is actually the norm in most subsystems returning cookie
pointers, clk, regulator, pinctrl... a NULL pointer is a functional
noop. But normally then NULL is returned from all stubs, not
just optional.

Alexandre, what do you say?

> The obvious downside is that if the device tree specifies a
> reset-gpio and the kernel just fails to use it because there is some
> code missing, this should better be an error. (The adau1977 code has
> this problem already know, but when changing devm_gpiod_get_optional =
all
> callers are affected.)

Device Tree-specific problems is not something we design
subsystems for, we try to just accomodate them. I'm not
sure I fully understand what you mean here.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
