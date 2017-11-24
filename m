From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: intel: merrifield: Introduce ACPI device table
Date: Fri, 24 Nov 2017 11:08:35 +0100
Message-ID: <CACRpkdaJ224LiquNoEHTHSZwKyiFmkYcTb3Qabu7NBBFnu3NqQ@mail.gmail.com>
References: <20171110193928.28313-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:41392 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753086AbdKXKIh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Nov 2017 05:08:37 -0500
Received: by mail-it0-f68.google.com with SMTP id x28so12856788ita.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2017 02:08:37 -0800 (PST)
In-Reply-To: <20171110193928.28313-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org

On Fri, Nov 10, 2017 at 8:39 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> On Intel Merrifield the pin control device is a separate IP block
> without any PCI ID assigned.
>
> Though, recently we got an allocated ACPI ID for it, so, let's use fresh
> ID.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with Mika's ACK.

Yours,
Linus Walleij
