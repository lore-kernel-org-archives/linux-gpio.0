From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3 v2] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Fri, 19 Sep 2014 10:34:32 -0700
Message-ID: <CACRpkdZOZu4aj7aWnkVaQXLND6Cf7k-LNZikQr7DcKkp2cgwRg@mail.gmail.com>
References: <1409928798-31895-1-git-send-email-alvin.chen@intel.com>
	<1409928798-31895-4-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:55907 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756771AbaISRed (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Sep 2014 13:34:33 -0400
Received: by mail-ie0-f181.google.com with SMTP id tr6so3831345ieb.26
        for <linux-gpio@vger.kernel.org>; Fri, 19 Sep 2014 10:34:32 -0700 (PDT)
In-Reply-To: <1409928798-31895-4-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>

On Fri, Sep 5, 2014 at 7:53 AM, Weike Chen <alvin.chen@intel.com> wrote:

> This patch enables suspend and resume mode for the power management, and
> it is based on Josef Ahmad's previous work.
>
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
> Reviewed-by: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> Signed-off-by: Weike Chen <alvin.chen@intel.com>
(...)

> +/* Store GPIO context across system-wide suspend/resume transitions */
> +static struct dwapb_context {
> +       u32 data[DWAPB_MAX_PORTS];
> +       u32 dir[DWAPB_MAX_PORTS];
> +       u32 ext[DWAPB_MAX_PORTS];
> +       u32 int_en;
> +       u32 int_mask;
> +       u32 int_type;
> +       u32 int_pol;
> +       u32 int_deb;
> +} dwapb_context;

NAK, this should STILL be part of the device state container. Not
a local variable.

I've said this before. Please fix this, thanks.

Yours,
Linus Walleij
