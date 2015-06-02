From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio/crystalcove: set IRQCHIP_SKIP_SET_WAKE for the irqchip
Date: Tue, 2 Jun 2015 11:23:03 +0200
Message-ID: <CACRpkdbpJAG=T6RrV8qAos4NGX6NMDG-1GNvRo1Pk-YL69HnvA@mail.gmail.com>
References: <20150528025848.GA11051@aaronlu.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36605 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753893AbbFBJXD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2015 05:23:03 -0400
Received: by oihb142 with SMTP id b142so121003601oih.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2015 02:23:03 -0700 (PDT)
In-Reply-To: <20150528025848.GA11051@aaronlu.sh.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Lu <aaron.lu@intel.com>, Shobhit Kumar <shobhit.kumar@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhu, Lejun" <lejun.zhu@linux.intel.com>, "Yang, Bin" <bin.yang@intel.com>

On Thu, May 28, 2015 at 4:58 AM, Aaron Lu <aaron.lu@intel.com> wrote:

> The CrystalCove GPIO irqchip doesn't have irq_set_wake callback defined
> so we should set IRQCHIP_SKIP_SET_WAKE for it or it would cause an irq
> desc's wake_depth unbalanced warning during system resume phase from the
> gpio_keys driver, which is the driver for the power button of the ASUS
> T100 laptop.
>
> Signed-off-by: Aaron Lu <aaron.lu@intel.com>
> Cc: <stable@vger.kernel.org>

Patch applied.

Yours,
Linus Walleij
