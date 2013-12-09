From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/4] gpiolib: introduce chip_* to print with
 chip->label prefix
Date: Mon, 9 Dec 2013 14:17:55 +0100
Message-ID: <CACRpkdZvJEJHuOpAbJEYVLE1TDKR3V-Qy-txEkZ8_JZOXZVjWA@mail.gmail.com>
References: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
	<1386235586-16713-3-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:42112 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932667Ab3LINR4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Dec 2013 08:17:56 -0500
Received: by mail-ob0-f173.google.com with SMTP id gq1so3660089obb.4
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2013 05:17:55 -0800 (PST)
In-Reply-To: <1386235586-16713-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, Dec 5, 2013 at 10:26 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In several places we are printing messages with prefix based on chip->label.
> Introduced macros help us to do this easier and in uniform way.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
