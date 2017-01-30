From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/3] pinctrl: baytrail: Debounce register is one per community
Date: Mon, 30 Jan 2017 15:49:11 +0100
Message-ID: <CACRpkda2r-r1CcBJNY=jPHZ-oG2SLe0Kp_zdhW=LtFhi49Zj5A@mail.gmail.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com> <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:36451 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753586AbdA3O6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:58:51 -0500
Received: by mail-io0-f170.google.com with SMTP id j13so108473099iod.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 06:57:41 -0800 (PST)
In-Reply-To: <20170126172409.132136-3-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>, Cristina Ciocan <cristina.ciocan@intel.com>

On Thu, Jan 26, 2017 at 6:24 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Debounce value is set globally per community. Otherwise user will easily
> get a kernel crash when they start using the feature:
>
> BUG: unable to handle kernel paging request at ffffc900003be000
> IP: byt_gpio_dbg_show+0xa9/0x430
>
> Make it clear in byt_gpio_reg().
>
> Note that this fix just prevents kernel to crash, but doesn't make any
> difference to the existing logic. It means the last caller will win the
> trade and debounce value will be configured accordingly. The actual
> logic fix needs to be thought about and it's not as important as crash
> fix. That's why the latter goes separately and right now.
>
> Fixes: 658b476c742f ("pinctrl: baytrail: Add debounce configuration")
> Cc: Cristina Ciocan <cristina.ciocan@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
