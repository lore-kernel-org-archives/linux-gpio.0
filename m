From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpiolib: make GPIO_DEVRES depend on GPIOLIB
Date: Wed, 23 Oct 2013 10:13:23 +0200
Message-ID: <CACRpkdaXtE7TEGd0cV7Frw4MReppowRJPQTTXUM3K4B-62YCnw@mail.gmail.com>
References: <1382307299-22587-1-git-send-email-acourbot@nvidia.com>
	<1382307299-22587-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:49905 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751937Ab3JWINY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2013 04:13:24 -0400
Received: by mail-ob0-f181.google.com with SMTP id va2so523557obc.40
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2013 01:13:23 -0700 (PDT)
In-Reply-To: <1382307299-22587-4-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Oct 21, 2013 at 12:14 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Current Kconfig allows GPIO_DEVRES to be selected and compiled without
> GPIOLIB. This does not make sense anymore since GPIOLIB has become the
> exclusive way to deal with GPIOs. This patch makes GPIO_DEVRES available
> only if GPIOLIB is selected.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Hm, I wonder about this. Are, or where there ever consumers of generic
GPIO using devres without gpiolib?

Yours,
Linus Walleij
