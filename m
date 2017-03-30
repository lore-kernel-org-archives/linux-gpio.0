From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we get
 a deferral
Date: Thu, 30 Mar 2017 11:08:11 +0200
Message-ID: <CACRpkdZ2VVT_SSyn4H-6AbeuigvzXqhas5qn03wYbF4ef5O52g@mail.gmail.com>
References: <20170323202138.GA11912@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38338 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932715AbdC3JIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Mar 2017 05:08:13 -0400
Received: by mail-it0-f52.google.com with SMTP id y18so72733901itc.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Mar 2017 02:08:12 -0700 (PDT)
In-Reply-To: <20170323202138.GA11912@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 23, 2017 at 9:21 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> If, while locating GPIOs by name, we get probe deferral, we should
> immediately report it to caller rather than trying to fall back to parsing
> unnamed GPIOs from _CRS block.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Patch applied and tagged for stable with all ACKs and Tested-by's.

Yours,
Linus Walleij
