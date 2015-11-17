From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: tighten up ACPI legacy gpio lookups
Date: Tue, 17 Nov 2015 11:57:10 +0100
Message-ID: <CACRpkdaE0KpKCbMbR6KV5h-0d5D=FnHWej9AM-jLa_uNsCMyPQ@mail.gmail.com>
References: <20151105193838.GA33410@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36717 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbbKQK5L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 05:57:11 -0500
Received: by obdgf3 with SMTP id gf3so3522887obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 02:57:11 -0800 (PST)
In-Reply-To: <20151105193838.GA33410@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Tirdea, Irina" <irina.tirdea@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Nov 5, 2015 at 8:38 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> We should not fall back to the legacy unnamed gpio lookup style if the
> driver requests gpios with different names, because we'll give out the same
> gpio twice. Let's keep track of the names that were used for the device and
> only do the fallback for the first name used.
>
> Also disable fallback to _CRS gpios if ACPI device has DT-like
> properties or driver-supplied gpio mappings.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Looking for a newer version of this I think, also would like
Mika's and/or Rafael's ACKs.

Yours,
Linus Walleij
