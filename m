From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: intel: Make it possible to specify mode
 per pin in a group
Date: Fri, 9 Jun 2017 13:03:21 +0200
Message-ID: <CACRpkdbnCtJMbwy-YVvp88LeTyuiOsNLcSgKQgT8yiQjwhhC1A@mail.gmail.com>
References: <20170606131819.39845-1-mika.westerberg@linux.intel.com> <20170606131819.39845-3-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:35216 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751610AbdFILDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2017 07:03:23 -0400
Received: by mail-io0-f182.google.com with SMTP id k93so31566490ioi.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jun 2017 04:03:23 -0700 (PDT)
In-Reply-To: <20170606131819.39845-3-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 6, 2017 at 3:18 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> On some SoCs not all pins in a group use the same mode when a certain
> function is muxed out of them. This makes it possible to specify mode per
> pin as an array instead in addition to single integer.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied.

Yours,
Linus Walleij
