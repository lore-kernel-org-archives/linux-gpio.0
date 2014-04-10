From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ge: Convert to platform driver
Date: Thu, 10 Apr 2014 18:30:16 +0200
Message-ID: <CACRpkdZMabAQuribdmt=bK_1RF1_oSOeiEquXAuxyq3adtE8-g@mail.gmail.com>
References: <1396156455-4225-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:62473 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484AbaDJQaR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Apr 2014 12:30:17 -0400
Received: by mail-oa0-f49.google.com with SMTP id o6so4710853oag.22
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 09:30:17 -0700 (PDT)
In-Reply-To: <1396156455-4225-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, Alexandre Courbot <gnurou@gmail.com>

On Sun, Mar 30, 2014 at 7:14 AM, Alexander Shiyan <shc_work@mail.ru> wrote:

> This patch converts GE I/O FPGA GPIO driver to platform driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
> Only compile tested.

Isn't it necessary to also patch affected platforms to add this
device either as platform device or in their device trees?

Yours,
Linus Walleij
