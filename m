From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: cherryview: Add Setzer models to the
 Chromebook DMI quirk
Date: Thu, 3 Aug 2017 10:19:21 +0200
Message-ID: <CACRpkdbu5twyTc3VMKu0zUGf5uN2iB++oxDFAEZfn31YA9Qwtw@mail.gmail.com>
References: <20170704125839.16093-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:35698 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdHCITX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 04:19:23 -0400
Received: by mail-it0-f47.google.com with SMTP id h199so5522521ith.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2017 01:19:23 -0700 (PDT)
In-Reply-To: <20170704125839.16093-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mail@abhishek.geek.nz

On Tue, Jul 4, 2017 at 2:58 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Add one more model to the Chromebook DMI quirk to make it working again.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Fixes: 2a8209fa6823 ("pinctrl: cherryview: Extend the Chromebook DMI quirk to Intel_Strago systems")
> Reported-by: mail@abhishek.geek.nz
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied for fixes with Mika's ACK.

Yours,
Linus Walleij
