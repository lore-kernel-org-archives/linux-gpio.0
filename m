From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4 v5] GPIO: gpio-dwapb: Change readl&writel to dwapb_read&dwapb_write
Date: Tue, 23 Sep 2014 14:10:48 +0200
Message-ID: <CACRpkdYuDux776OtQGMtN7HvW-LNahV42Ltwa6PzgA1oApig3g@mail.gmail.com>
References: <1410970722-8579-1-git-send-email-alvin.chen@intel.com>
	<1410970722-8579-3-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:39667 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754973AbaIWMKt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Sep 2014 08:10:49 -0400
Received: by mail-ie0-f175.google.com with SMTP id rl12so2989347iec.34
        for <linux-gpio@vger.kernel.org>; Tue, 23 Sep 2014 05:10:48 -0700 (PDT)
In-Reply-To: <1410970722-8579-3-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Boon Leong Ong <boon.leong.ong@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, Mika Westerberg <mika.westerberg@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Wed, Sep 17, 2014 at 6:18 PM, Weike Chen <alvin.chen@intel.com> wrote:

> This patch replaces 'readl&writel' with 'dwapb_read&dwapb_write'.
>
> Reviewed-by: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> Signed-off-by: Weike Chen <alvin.chen@intel.com>

Patch applied.

Yours,
Linus Walleij
