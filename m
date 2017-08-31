From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: Read back TX buffer state
Date: Thu, 31 Aug 2017 15:28:25 +0200
Message-ID: <CACRpkdZ8uYKfGJ5-9km3yzQvF09h53Au5R6chDKmWiZVc-Fx0g@mail.gmail.com>
References: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33261 "EHLO
        mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750908AbdHaN20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 09:28:26 -0400
Received: by mail-oi0-f48.google.com with SMTP id r203so5465975oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 06:28:26 -0700 (PDT)
In-Reply-To: <20170824081934.85859-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Bourque, Francis" <francis.bourque@intel.com>

On Thu, Aug 24, 2017 at 10:19 AM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> In the same way as it's done in pinctrl-cherryview.c we would provide
> a readback TX buffer state.
>
> Fixes: 17fab473693 ("pinctrl: intel: Set pin direction properly")
> Reported-by: "Bourque, Francis" <francis.bourque@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
