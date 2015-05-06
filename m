From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: single: Constify irq_domain_ops
Date: Wed, 6 May 2015 15:33:15 +0200
Message-ID: <CACRpkdZYYxRzy3hUsKUxdGE4MekoCv=rycD6McsPJyVHGrbWAA@mail.gmail.com>
References: <1430139247-4198-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34512 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876AbbEFNdQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 May 2015 09:33:16 -0400
Received: by oiko83 with SMTP id o83so7319638oik.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2015 06:33:16 -0700 (PDT)
In-Reply-To: <1430139247-4198-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Apr 27, 2015 at 2:54 PM, Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:

> The irq_domain_ops are not modified by the driver and the irqdomain core
> code accepts pointer to a const data.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Patch applied.

Yours,
Linus Walleij
