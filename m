From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mpc8xxx: remove __initdata annotation for mpc8xxx_gpio_ids[]
Date: Thu, 5 Mar 2015 10:52:01 +0100
Message-ID: <CACRpkdb_49zpdnHLHnpYcqBaXTtVP4eeDkqAvM1=9rfDNdN4cQ@mail.gmail.com>
References: <1423723969-26931-1-git-send-email-haokexin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:35138 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932070AbbCEJwC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Mar 2015 04:52:02 -0500
Received: by obbgq1 with SMTP id gq1so12783826obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Mar 2015 01:52:01 -0800 (PST)
In-Reply-To: <1423723969-26931-1-git-send-email-haokexin@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kevin Hao <haokexin@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 12, 2015 at 7:52 AM, Kevin Hao <haokexin@gmail.com> wrote:

> Since commit 98686d9a52ee ("gpio: mpc8xxx: Convert to platform device
> interface"), we get the following section mismatch warning. Remove the
> __initdata annotation to fix it.
>   WARNING: vmlinux.o(.data+0xbc28): Section mismatch in reference from the variable mpc8xxx_plat_driver to the variable .init.data:mpc8xxx_gpio_ids
>   The variable mpc8xxx_plat_driver references
>   the variable __initdata mpc8xxx_gpio_ids
>   If the reference is valid then annotate the
>   variable with __init* or __refdata (see linux/init.h) or name the variable:
>   *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>
> Signed-off-by: Kevin Hao <haokexin@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij
