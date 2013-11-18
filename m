From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: fix find_chip_by_name()
Date: Mon, 18 Nov 2013 10:46:19 +0100
Message-ID: <CACRpkdYfdUEvs3D-+enB6sS+O_Ht9W+X=XTCty9ZtAfa+Wvm0Q@mail.gmail.com>
References: <1384605572-9811-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:57066 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751163Ab3KRJqU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2013 04:46:20 -0500
Received: by mail-oa0-f51.google.com with SMTP id i7so1647526oag.38
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2013 01:46:20 -0800 (PST)
In-Reply-To: <1384605572-9811-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Sat, Nov 16, 2013 at 1:39 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> find_chip_by_name() was incorrectly implemented by using
> gpio_lookup_list instead of gpiod_chips to iterate through all the
> registered GPIO controllers. This patch reimplements it by using
> gpiochip_find() with a custom search function, which simplifies the code
> on top of fixing the mistake.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
