From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: mcp23s08: switch to use gpiolib irqchip helpers
Date: Tue, 22 Mar 2016 14:27:48 +0100
Message-ID: <CACRpkdZJYt73EDgZPknWfZ1L00rGwuoAwaZNrQJ+d4sO9kcvrw@mail.gmail.com>
References: <1458288426-39144-1-git-send-email-preid@electromag.com.au>
	<1458288426-39144-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34692 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758558AbcCVN1t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 09:27:49 -0400
Received: by mail-ob0-f176.google.com with SMTP id ts10so200918266obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 06:27:49 -0700 (PDT)
In-Reply-To: <1458288426-39144-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 18, 2016 at 9:07 AM, Phil Reid <preid@electromag.com.au> wrote:

> This switches the mcp23s08 driver to use the gpiolib irqchip
> helpers.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Awesome. Patch applied for v4.7.

I sent a follow-up patch removing reqres/relres as these will
anyways be assigned and handled by the core now.

Yours,
Linus Walleij
