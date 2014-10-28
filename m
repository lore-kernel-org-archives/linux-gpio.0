From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: grgpio: remove irq_domain resources on failure
Date: Tue, 28 Oct 2014 16:13:50 +0100
Message-ID: <CACRpkdaX2OmTbUw3ZWV8q6P0vqMa60cOJjPCmK2H0czrty_fXQ@mail.gmail.com>
References: <1412188684-20820-1-git-send-email-pramod.gurav@smartplayin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:60319 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752111AbaJ1PNv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 11:13:51 -0400
Received: by mail-ie0-f173.google.com with SMTP id tr6so867363ieb.4
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 08:13:50 -0700 (PDT)
In-Reply-To: <1412188684-20820-1-git-send-email-pramod.gurav@smartplayin.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Oct 1, 2014 at 8:38 PM, Pramod Gurav
<pramod.gurav@smartplayin.com> wrote:

> Call irq_domain_remove when gpiochip_add fails to release irq_domain
> resources.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Pramod Gurav <pramod.gurav@smartplayin.com>

Patch applied.

This driver is doing really weird stuff in it's IRQ remapping business...

Yours,
Linus Walleij
