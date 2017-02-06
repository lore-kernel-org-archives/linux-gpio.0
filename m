From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add GPIO support for the ACCES PCI-IDIO-16
Date: Mon, 6 Feb 2017 11:01:51 +0100
Message-ID: <CACRpkdYFvxaKstXTe0C=1szs5uips7Z9TSDLyrHzN4xQUppyZQ@mail.gmail.com>
References: <20170201203755.GA5856@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34600 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbdBFKBw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 05:01:52 -0500
Received: by mail-io0-f182.google.com with SMTP id l66so61845987ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 02:01:52 -0800 (PST)
In-Reply-To: <20170201203755.GA5856@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 1, 2017 at 9:37 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES PCI-IDIO-16 device provides 32 lines of digital I/O (16 lines
> of optically-isolated digital inputs for AC and DC control signals, and
> 16 lines of solid state switch digital outputs). An interrupt is
> generated when any of the inputs change state (low to high or high to
> low). Input filter control is not supported by this driver, and input
> filters are deactivated by this driver.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
