From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] pinctrl: intel: Turn Baytrail support to tristate
Date: Thu, 26 Jan 2017 09:55:36 +0100
Message-ID: <CACRpkdb9npDaMe07+v-ZzntD1Z_U2Swstk6bv=7uhHLmpM5LVA@mail.gmail.com>
References: <20170125162608.58bfbfb1@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:38766 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752863AbdAZIzi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 03:55:38 -0500
Received: by mail-it0-f52.google.com with SMTP id c7so30227784itd.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2017 00:55:37 -0800 (PST)
In-Reply-To: <20170125162608.58bfbfb1@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Takashi Iwai <tiwai@suse.de>

On Wed, Jan 25, 2017 at 4:26 PM, Jean Delvare <jdelvare@suse.de> wrote:

> The pinctrl-baytrail driver builds just fine as a module so give
> users this option.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
> This was discussed almost one year ago, with no clear conclusion, but
> also no evidence that the driver can't be built as a module. Is there
> any way to push this forward?

I see ACKs for this patch, but in my git I also have:

commit 360943a8d26265825025b88da32961bd9ad4f7c6
pinctrl: baytrail: make it explicitly non-modular

Acked by Mika.

So which one is it going to be?

If this should be applied, the previous patch from Paul Gortmaker
should be reverted first. Especially the runtime PM parts seem
important to get back.

Then I want a patch reverting that and adding this tristate in one.

Yours,
Linus Walleij
