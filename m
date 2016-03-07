From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/63] of: Empty of_read_number when !OF
Date: Mon, 7 Mar 2016 11:55:22 +0700
Message-ID: <CACRpkdanZ_FU4RPsmV7VO=0Y-QSZYFWM1fBLj4u+BW3Gg9h87g@mail.gmail.com>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
	<1456492692-21592-2-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34505 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbcCGEzX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 23:55:23 -0500
Received: by mail-oi0-f41.google.com with SMTP id m82so72476448oif.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 20:55:23 -0800 (PST)
In-Reply-To: <1456492692-21592-2-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 8:17 PM, Alexander Stein <alexanders83@web.de> wrote:

> Introduce empty of_read_number when CONFIG_OF is not defined. This allows
> us to compile test gpio drivers.
>
> Signed-off-by: Alexander Stein <alexanders83@web.de>

I need to wait for the OF maintainer to merge this or provide an ACK before
I proceed with this patch series. It's pretty late so let's consider this v4.7
material at this point.

Yours,
Linus Walleij
