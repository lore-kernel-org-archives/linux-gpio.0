From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 3/3] pinctrl: baytrail: Add debounce to debug output
Date: Mon, 30 Jan 2017 15:51:23 +0100
Message-ID: <CACRpkdbevRV9rfJwZo_S2k6WTErNeK17HtHyyORdt6dERE_KGw@mail.gmail.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com> <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:34879 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932136AbdA3Ova (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:51:30 -0500
Received: by mail-it0-f44.google.com with SMTP id 203so195230092ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 06:51:30 -0800 (PST)
In-Reply-To: <20170126172409.132136-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>

On Thu, Jan 26, 2017 at 6:24 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When debug pin configuration is printed out debounce setting is missed.
> Add it here.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I have dropped this patch for now due to Mika's skepticism.

Yours,
Linus Walleij
