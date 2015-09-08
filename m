From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mxs: need to check return value of irq_alloc_generic_chip
Date: Tue, 8 Sep 2015 10:34:51 +0200
Message-ID: <CACRpkdb5tTCc81qdsMnk-GOw79EYfny7bGmygd-u0FKn3EOhHA@mail.gmail.com>
References: <1440335513-14703-1-git-send-email-van.freenix@gmail.com>
	<1440335513-14703-2-git-send-email-van.freenix@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33649 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752129AbbIHIew (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2015 04:34:52 -0400
Received: by oixx17 with SMTP id x17so54748451oix.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2015 01:34:51 -0700 (PDT)
In-Reply-To: <1440335513-14703-2-git-send-email-van.freenix@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peng Fan <van.freenix@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 23, 2015 at 3:11 PM, Peng Fan <van.freenix@gmail.com> wrote:

> Need to check return value of irq_alloc_generic_chip, because
> it may return NULL.
> 1. Change mxs_gpio_init_gc return type from void to int.
> 2. Add a new lable out_irqdomain_remove to remove the irq domain
>    when mxc_gpio_init_gc fail.
>
> Signed-off-by: Peng Fan <van.freenix@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Rebased and applied for fixes.

Yours,
Linus Walleij
