From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: intel: Add support for 1k additional pull-down
Date: Mon, 30 Jan 2017 15:05:33 +0100
Message-ID: <CACRpkdZE8gCeK24wu5hRE6tDo2_YbtpA3zuUAipZ=xiWrSOVTw@mail.gmail.com>
References: <20170127100716.194910-1-mika.westerberg@linux.intel.com> <20170127100716.194910-3-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f175.google.com ([209.85.223.175]:36229 "EHLO
        mail-io0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753254AbdA3OHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:07:23 -0500
Received: by mail-io0-f175.google.com with SMTP id j13so107276445iod.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 06:05:35 -0800 (PST)
In-Reply-To: <20170127100716.194910-3-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 27, 2017 at 11:07 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The next generation Intel GPIO hardware supports additional 1k pull-down
> per-pad. Add support for this to the Intel core pinctrl driver.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied.

And if you one day add support for pulls from the GPIO side
all the way to the userspace chardev - I'm not gonna protest.
I bet we already have users that need this for their makerspace
projects.

Yours,
Linus Walleij
