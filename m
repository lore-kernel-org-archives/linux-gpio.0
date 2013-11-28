From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpiolib: add missing declarations
Date: Thu, 28 Nov 2013 15:32:37 +0100
Message-ID: <CACRpkdZMjmmUN0LkAZiBU8Dvy74zFZ2fQhRxeUMWbTfXupVzoA@mail.gmail.com>
References: <529317AB.1050600@nvidia.com>
	<1385372064-16221-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:41025 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758720Ab3K1Oci (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2013 09:32:38 -0500
Received: by mail-ob0-f174.google.com with SMTP id wn1so8849885obc.19
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2013 06:32:37 -0800 (PST)
In-Reply-To: <1385372064-16221-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 25, 2013 at 10:34 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Add declaration of 'struct of_phandle_args' to avoid the following
> warning:
>
>   In file included from arch/arm/mach-tegra/board-paz00.c:21:0:
>   include/linux/gpio/driver.h:102:17: warning: 'struct of_phandle_args' declared inside parameter list
>   include/linux/gpio/driver.h:102:17: warning: its scope is only this definition or declaration, which is probably not what you want
>
> Also proactively add other definitions/includes that could be missing
> in other contexts.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reported-by: Stephen Warren <swarren@wwwdotorg.org>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
