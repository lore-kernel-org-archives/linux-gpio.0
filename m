From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] irqdomain: Export irq_domain_free_irqs_common
Date: Thu, 31 Mar 2016 10:21:10 +0200
Message-ID: <CACRpkdaQL2qztQrbnsfWUf-FnUXP=xRTiLCASFqPyRq=0a5Vvw@mail.gmail.com>
References: <1458187231.27037.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35047 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834AbcCaIVL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 04:21:11 -0400
Received: by mail-ob0-f178.google.com with SMTP id fp4so17856504obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 01:21:11 -0700 (PDT)
In-Reply-To: <1458187231.27037.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Y Vo <yvo@apm.com>, Alexandre Courbot <gnurou@gmail.com>, Jiang Liu <jiang.liu@linux.intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 17, 2016 at 5:00 AM, Axel Lin <axel.lin@ingics.com> wrote:

> Export irq_domain_free_irqs_common so it can be used by modules.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Patch applied to the GPIO tree with TGLX's ACK.

Yours,
Linus Walleij
