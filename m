From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: bcm281xx: Fix return value of bcm_kona_gpio_get()
Date: Wed, 27 Nov 2013 15:01:58 +0100
Message-ID: <CACRpkdb86fd63=ytO6VKXJ+CVM0qyHYXL6C1BL0nZo+JAbnCsg@mail.gmail.com>
References: <1385075566-23989-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34755 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751131Ab3K0OB6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2013 09:01:58 -0500
Received: by mail-ob0-f177.google.com with SMTP id va2so7358957obc.36
        for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2013 06:01:58 -0800 (PST)
In-Reply-To: <1385075566-23989-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Tim Kryger <tim.kryger@linaro.org>

On Fri, Nov 22, 2013 at 12:12 AM, Markus Mayer <markus.mayer@linaro.org> wrote:

> We need to return the corresponding bit for a particular GPIO. This bit
> contains shift not mask.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>
> Reviewed-by: Matt Porter <matt.porter@linaro.org>

Patch applied for fixes, thanks!

Yours,
Linus Walleij
