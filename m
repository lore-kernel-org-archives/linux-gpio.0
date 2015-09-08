From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mxc: need to check return value of irq_alloc_generic_chip
Date: Tue, 8 Sep 2015 10:32:01 +0200
Message-ID: <CACRpkdZV-8XOn-NyF+z8KQfaYjrZGq3Rqa7smekciBEhypFDzg@mail.gmail.com>
References: <1440335513-14703-1-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35184 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752866AbbIHIcC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 04:32:02 -0400
Received: by obuk4 with SMTP id k4so77690724obu.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 01:32:01 -0700 (PDT)
In-Reply-To: <1440335513-14703-1-git-send-email-van.freenix@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peng Fan <van.freenix@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 23, 2015 at 3:11 PM, Peng Fan <van.freenix@gmail.com> wrote:

> Need to check return value of irq_alloc_generic_chip, because
> it may return NULL.
> 1. Change mxc_gpio_init_gc return type from void to int.
> 2. Add a new lable out_irqdomain_remove to remove the irq domain
>    when mxc_gpio_init_gc fail.
>
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

I manually rebased this and applied to fixes.

Yours,
Linus Walleij
