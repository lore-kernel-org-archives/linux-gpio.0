From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tb10x: GPIO_TB10X needs to select GENERIC_IRQ_CHIP
Date: Wed, 5 Feb 2014 12:38:11 +0100
Message-ID: <CACRpkdZk28XAFmonJ9hbKXL1GRHSJMFSKuCs6MLSDLpZ5bmE+w@mail.gmail.com>
References: <1391511581.4664.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:38342 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbaBELiM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 06:38:12 -0500
Received: by mail-ob0-f175.google.com with SMTP id wn1so259144obc.6
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 03:38:11 -0800 (PST)
In-Reply-To: <1391511581.4664.1.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Sascha Leuenberger <sascha.leuenberger@abilis.com>, Christian Ruppert <christian.ruppert@abilis.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Feb 4, 2014 at 11:59 AM, Axel Lin <axel.lin@ingics.com> wrote:

> gpio-tb10x driver uses generic irq chip APIs (irq_alloc_domain_generic_chips,
> irq_remove_generic_chip), so it needs to select GENERIC_IRQ_CHIP to avoid build
> error.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied for fixes, thanks!

Yours,
Linus Walleij
