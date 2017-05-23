From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xlp: update GPIO_XLP dependency
Date: Tue, 23 May 2017 22:57:31 +0200
Message-ID: <CACRpkdbEn7KyD+8kA7PnurrUPfDtC4ccxvCYjimDwtWcvyi0hQ@mail.gmail.com>
References: <1495443511-82849-1-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:34518 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033936AbdEWU5d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 16:57:33 -0400
Received: by mail-io0-f176.google.com with SMTP id k91so105738893ioi.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2017 13:57:33 -0700 (PDT)
In-Reply-To: <1495443511-82849-1-git-send-email-jnair@caviumnetworks.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jayachandran C <jnair@caviumnetworks.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, May 22, 2017 at 10:58 AM, Jayachandran C
<jnair@caviumnetworks.com> wrote:

> Broadcom Vulcan (ARCH_VULCAN) has been discontinued and will be deleted
> soon. So, update the GPIO_XLP Kconfig entry to remove the ARCH_VULCAN
> dependency.
>
> Also update the documentation to note that Cavium ThunderX2 uses this
> driver.
>
> Signed-off-by: Jayachandran C <jnair@caviumnetworks.com>
> ---
>
> Broadcom Vulcan is now Cavium ThunderX2, and the rest of the
> dependencies on ARCH_VULCAN has been moved to ARCH_THUNDER2 already.
> This is the last remaining dependency of ARCH_VULCAN in drivers/
>
> JC.

OK then.

Patch applied.

Yours,
Linus Walleij
