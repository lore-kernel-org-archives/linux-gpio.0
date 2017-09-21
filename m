From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: merrifield: Introduce OF device table
Date: Thu, 21 Sep 2017 13:08:12 +0200
Message-ID: <CACRpkdZgZ-hwCxE+A2r8XrbgrZdTAU91n-6csf1jeLhV-38ECw@mail.gmail.com>
References: <20170828134227.65736-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:47597 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbdIULIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 07:08:13 -0400
Received: by mail-io0-f171.google.com with SMTP id e189so10031984ioa.4
        for <linux-gpio@vger.kernel.org>; Thu, 21 Sep 2017 04:08:13 -0700 (PDT)
In-Reply-To: <20170828134227.65736-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, Aug 28, 2017 at 3:42 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> On Intel Merrifield the pin control device is a separate IP block
> without any PCI or ACPI ID assigned. We need some means to allow the
> device be enumerated in ACPI environment (*).
>
> To achieve this without allocation special ACPI ID, which is really long
> and pretty much unachievable procedure, we just re-use special ACPI ID
> and standard compatible string.

Unfortunately device tree has some bureaucracy too :/

> (*) ACPI is enabled via second bootloader, i.e. U-Boot,
>     firmware is still left untouched and being SFI enabled.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'm fine with this, please just add the following file:
Documentation/devicetree/bindings/pinctrl/intel.txt

And kind of just list the compatible string in it, with
Cc: devicetree@vger.kernel.org

That is the procedure they have asked me to follow.

Then they need some week to have a chance to look at it.

Yours,
Linus Walleij
