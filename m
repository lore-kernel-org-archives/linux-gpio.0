From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: lp3943: Remove redundant of_match_ptr helper
Date: Thu, 2 Jan 2014 14:02:37 +0100
Message-ID: <CACRpkdb+NQOZXD2iHco+5UoFAt0abc8teFvZV0TayxXMRUZRNw@mail.gmail.com>
References: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:63127 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaABNCi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 08:02:38 -0500
Received: by mail-oa0-f48.google.com with SMTP id l6so14746286oag.35
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 05:02:38 -0800 (PST)
In-Reply-To: <1387621661-22128-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 21, 2013 at 11:27 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> 'lp3943_gpio_of_match' is always compiled in. Hence the
> helper macro is not needed.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/gpio/gpio-lp3943.c |    2 +-

This driver is merged into the MFD tree, you need Lee or
Sam to apply it.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
