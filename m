From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: broxton: Rename apl-pinctrl driver
Date: Thu, 26 Jan 2017 15:38:43 +0100
Message-ID: <CACRpkdaKJg4w_dmXwoaKqXmEZwMzoLDjAqZcZPLnabh-T3zx-g@mail.gmail.com>
References: <20170125202934.146544-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:36776 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752804AbdAZOip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 09:38:45 -0500
Received: by mail-io0-f176.google.com with SMTP id j13so37754985iod.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 06:38:45 -0800 (PST)
In-Reply-To: <20170125202934.146544-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Wed, Jan 25, 2017 at 9:29 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> While we have no users yet rename the platform driver to use the same
> pattern as the rest of Intel SoCs, i.e. use full SoC name in
> 'apollolake-pinctrl'.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Better like this anyway,

Patch applied.

Yours,
Linus Walleij
