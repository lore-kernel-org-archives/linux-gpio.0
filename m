From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpio: mvebu: make mvchip->irqbase signed for error handling
Date: Mon, 18 Nov 2013 11:40:04 +0100
Message-ID: <CACRpkdb4jw1GuhHs6OHZ=fNRYTdSZR_E3b=Luh=CkAn7M5+iSg@mail.gmail.com>
References: <20131107075019.GH21844@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:43914 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057Ab3KRKkF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 05:40:05 -0500
Received: by mail-oa0-f41.google.com with SMTP id g12so6968348oah.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 02:40:04 -0800 (PST)
In-Reply-To: <20131107075019.GH21844@elgon.mountain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Nov 7, 2013 at 8:50 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a bug in mvebu_gpio_probe() where we do:
>
>         mvchip->irqbase = irq_alloc_descs(-1, 0, ngpios, -1);
>         if (mvchip->irqbase < 0) {
>
> The problem is that mvchip->irqbase is unsigned so the error handling
> doesn't work.  I have changed it to be a regular int.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to fixes.

I'm tagging this for stable as well.

Yours,
Linus Walleij
