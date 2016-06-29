From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/1] pinctrl: intel: Add Intel Merrifield pin
 controller support
Date: Wed, 29 Jun 2016 10:01:07 +0200
Message-ID: <CACRpkdb=U+mWFT-GKpWUJH1sR2cQKBjBnF0Hf5mwRxz+qe985w@mail.gmail.com>
References: <1466678976-52598-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34704 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751047AbcF2IBf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 04:01:35 -0400
Received: by mail-ob0-f172.google.com with SMTP id ru5so14854374obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 01:01:08 -0700 (PDT)
In-Reply-To: <1466678976-52598-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jun 23, 2016 at 12:49 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This driver adds pinctrl support for Intel Merrifield. The IP block which is
> called Family-Level Interface Shim is a separate entity in SoC. The GPIO driver
> (gpio-intel-mid.c) will be updated accordingly to support pinctrl interface.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

That's a nice driver.

Patch applied!

Yours,
Linus Walleij
