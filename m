From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: baytrail: Rectify debounce support (part 2)
Date: Mon, 30 Jan 2017 15:47:28 +0100
Message-ID: <CACRpkdYrrjnGHy83nYA3KdX6iR_+r_=HK-ScJ=E0CC18HG=9gA@mail.gmail.com>
References: <20170126172409.132136-1-andriy.shevchenko@linux.intel.com> <20170126172409.132136-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:35135 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932136AbdA3Ora (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2017 09:47:30 -0500
Received: by mail-it0-f46.google.com with SMTP id 203so195144470ith.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2017 06:47:29 -0800 (PST)
In-Reply-To: <20170126172409.132136-2-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean Delvare <jdelvare@suse.de>

On Thu, Jan 26, 2017 at 6:24 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The commit 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> almost fixes the logic of debuonce but missed couple of things, i.e.
> typo in mask when disabling debounce and lack of enabling it back.
>
> This patch addresses above issues.
>
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Fixes: 04ff5a095d66 ("pinctrl: baytrail: Rectify debounce support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes, with the ACKs.

Yours,
Linus Walleij
