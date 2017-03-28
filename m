From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ACPI / gpio: do not fall back to parsing _CRS when we get
 a deferral
Date: Tue, 28 Mar 2017 15:25:56 +0200
Message-ID: <CACRpkdZJxvLF2T4akRVSNa9SjS30_q_A-vd2OaLE4eMSye1EMA@mail.gmail.com>
References: <20170323202138.GA11912@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:37617 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932436AbdC1N02 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 09:26:28 -0400
Received: by mail-it0-f54.google.com with SMTP id 190so18224541itm.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 06:26:08 -0700 (PDT)
In-Reply-To: <20170323202138.GA11912@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 23, 2017 at 9:21 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> If, while locating GPIOs by name, we get probe deferral, we should
> immediately report it to caller rather than trying to fall back to parsing
> unnamed GPIOs from _CRS block.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Can I get some indication from Mika/Rafael/Andy whether this is correct?

Yours,
Linus Walleij
