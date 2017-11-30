From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: ath79: add missing MODULE_DESCRIPTION/LICENSE
Date: Thu, 30 Nov 2017 14:44:59 +0100
Message-ID: <CACRpkdZF3_15FTdeM8weieZ7HbrEZpcfzo1zjycAsZEFV0mNDA@mail.gmail.com>
References: <20171120205426.83707-1-jc@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:44186 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbdK3NpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 08:45:00 -0500
Received: by mail-io0-f195.google.com with SMTP id w127so7526535iow.11
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 05:45:00 -0800 (PST)
In-Reply-To: <20171120205426.83707-1-jc@linux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesse Chan <jc@linux.com>
Cc: Alban Bedel <albeu@free.fr>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 20, 2017 at 9:54 PM, Jesse Chan <jc@linux.com> wrote:

> This change resolves a new compile-time warning
> when built as a loadable module:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-ath79.o
> see include/linux/module.h for more information
>
> This adds the license as "GPL v2", which matches the header of the file.
>
> MODULE_DESCRIPTION is also added.
>
> Signed-off-by: Jesse Chan <jc@linux.com>

Patch applied with ACK.

Yours,
Linus Walleij
