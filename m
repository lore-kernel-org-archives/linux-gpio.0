From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: xlp: Fix vulcan IRQ descriptor allocation
Date: Wed, 8 Jun 2016 10:53:25 +0200
Message-ID: <CACRpkdZWjFZ0+WnAeSJH3UHQYbrMenjQ-Lu+NYeu5TY0m=bGcA@mail.gmail.com>
References: <1465115444-25068-1-git-send-email-kamlakant.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35679 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422827AbcFHIx0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jun 2016 04:53:26 -0400
Received: by mail-oi0-f53.google.com with SMTP id s139so2427729oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jun 2016 01:53:26 -0700 (PDT)
In-Reply-To: <1465115444-25068-1-git-send-email-kamlakant.patel@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kamlakant Patel <kamlakant.patel@broadcom.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jayachandran C <jchandra@broadcom.com>

On Sun, Jun 5, 2016 at 10:30 AM,  <kamlakant.patel@broadcom.com> wrote:

> From: Kamlakant Patel <kamlakant.patel@broadcom.com>
>
> irq_alloc_descs need not be called in case of Vulcan, where we use
> a dynamic IRQ range for GPIO interrupt numbers.
>
> Update code not to call irq_alloc_descs and pass 0 as irq_base in
> case of Vulcan.
>
> Signed-off-by: Kamlakant Patel <kamlakant.patel@broadcom.com>

Patch applied.

Yours,
Linus Walleij
