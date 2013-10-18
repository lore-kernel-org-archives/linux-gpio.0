From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bcm281xx: Don't print addresses of GPIO area in probe()
Date: Fri, 18 Oct 2013 21:45:53 +0200
Message-ID: <CACRpkdYN0L1CYL57W07d0OZYKqs5fMX8JWy1S2cFyRjemsAKWg@mail.gmail.com>
References: <1382122203-16057-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:49945 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013Ab3JRTpy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2013 15:45:54 -0400
Received: by mail-ie0-f180.google.com with SMTP id e14so7061407iej.25
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2013 12:45:54 -0700 (PDT)
In-Reply-To: <1382122203-16057-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>

On Fri, Oct 18, 2013 at 8:50 PM, Markus Mayer <markus.mayer@linaro.org> wrote:

> The physical address of the GPIO memory address is already printed
> implicitly by dev_info() as part of the device name. The virtual
> address doesn't add any value. In addition, printing a resource_size_t
> with %x lead to a compiler warning on some platforms.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>

Patch applied. Thanks for a quick action Markus!

Yours,
Linus Walleij
