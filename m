From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: dln2: fix issue when an IRQ is unmasked then enabled
Date: Wed, 31 Dec 2014 21:55:08 +0100
Message-ID: <CACRpkdYM_Bg_jH_sDuSsdJ1LWKYyj2LURAKRZ8FYODG5Soqa6Q@mail.gmail.com>
References: <1418302951-9309-1-git-send-email-octavian.purdila@intel.com>
	<1418302951-9309-2-git-send-email-octavian.purdila@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:47472 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbaLaUzJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Dec 2014 15:55:09 -0500
Received: by mail-ie0-f180.google.com with SMTP id rp18so14781129iec.25
        for <linux-gpio@vger.kernel.org>; Wed, 31 Dec 2014 12:55:09 -0800 (PST)
In-Reply-To: <1418302951-9309-2-git-send-email-octavian.purdila@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Octavian Purdila <octavian.purdila@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Johan Hovold <johan@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Dec 11, 2014 at 2:02 PM, Octavian Purdila
<octavian.purdila@intel.com> wrote:

> As noticed during suspend/resume operations, the IRQ can be unmasked
> then disabled in suspend and eventually enabled in resume, but without
> being unmasked.
>
> The current implementation does not take into account interactions
> between mask/unmask and enable/disable interrupts, and thus in the
> above scenarios the IRQs remain unactive.
>
> To fix this we removed the enable/disable operations as they fallback
> to mask/unmask anyway.
>
> We also remove the pending bitmaks as it is already done in irq_data
> (i.e. IRQS_PENDING).
>
> Signed-off-by: Octavian Purdila <octavian.purdila@intel.com>

Patch applied for fixes.

Yours,
Linus Walleij
