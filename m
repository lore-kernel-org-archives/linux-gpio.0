From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/4] gpiolib: unify pr_* messages format
Date: Mon, 9 Dec 2013 14:15:21 +0100
Message-ID: <CACRpkdYn7qenu-RP7BDEFaXS+avSE0mTQTG1t3BKjjtsZnJgjg@mail.gmail.com>
References: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<1386235586-16713-2-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:58768 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932631Ab3LINPV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 08:15:21 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so3651880obc.6
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2013 05:15:21 -0800 (PST)
In-Reply-To: <1386235586-16713-2-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, Dec 5, 2013 at 10:26 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This patch includes the following amendments:
>  1) use "?" as a label when the last one is not defined in gpiod_*;
>  2) whenever it's possible gpiod_* are used;
>  3) print a function name, if it's already used in other messages.
>
> Additionally it fixes an indentation in few places.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This is a good day for cleanup. Patch applied.

Yours,
Linus Walleij
