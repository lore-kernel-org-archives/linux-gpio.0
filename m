From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: bcm281xx: Centralize register locking
Date: Thu, 23 Jan 2014 09:22:25 +0100
Message-ID: <CACRpkdYSh+h4za6tMR1WuPXRo6jPA7TM2XkCYPc-f6vwuaFwcg@mail.gmail.com>
References: <1390349441-23853-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36053 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752980AbaAWIW0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2014 03:22:26 -0500
Received: by mail-ob0-f180.google.com with SMTP id wp4so1659842obc.25
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2014 00:22:26 -0800 (PST)
In-Reply-To: <1390349441-23853-1-git-send-email-markus.mayer@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tim Kryger <tim.kryger@linaro.org>

On Wed, Jan 22, 2014 at 1:10 AM, Markus Mayer <markus.mayer@linaro.org> wrote:

> Rather than unlock/re-lock for every write access, unlock a GPIO when
> it is requested and re-lock it when it is freed. As a result, the GPIO
> helper functions no longer have to deal with unlocking and re-locking
> the register.
>
> In addition, only unlock a specific GPIO rather than unlocking the
> entire GPIO bank as before.
>
> Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>

Patch applied (for v3.15)

Yours,
Linus Walleij
