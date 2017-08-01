From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware bug
Date: Tue, 1 Aug 2017 15:19:09 +0200
Message-ID: <CACRpkdbqHVkksJuu2ibRxOitjdMQyXuNi3njAf4zgamYhr72Qw@mail.gmail.com>
References: <20170712123101.26996-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:38550 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751599AbdHANTL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 09:19:11 -0400
Received: by mail-io0-f180.google.com with SMTP id g13so8003806ioj.5
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 06:19:11 -0700 (PDT)
In-Reply-To: <20170712123101.26996-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jul 12, 2017 at 2:31 PM, Hans de Goede <hdegoede@redhat.com> wrote:

> WARN_ON causes a backtrace to get logged which is only useful for
> kernel bugs. For signalling a firmware bug dev_warn(dev, FW_BUG "...")
> should be used.
>
> This fixes users running userspace software to monitor kernel oopses
> getting a false positive bug-report every boot because of the wrong
> use of WARN_ON.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied with Andy's ACK.

Yours,
Linus Walleij
