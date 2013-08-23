From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: pcf857x: Remove pdata argument to pcf857x_irq_domain_init()
Date: Fri, 23 Aug 2013 19:52:10 +0200
Message-ID: <CACRpkdY4k7quQQpRLy0wRzdLYk4Brr64CQJK2BPgsBMLV2k0Yw@mail.gmail.com>
References: <1376953494-9684-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
	<1376953494-9684-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:48458 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756023Ab3HWRwK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2013 13:52:10 -0400
Received: by mail-oa0-f53.google.com with SMTP id k18so1103181oag.26
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2013 10:52:10 -0700 (PDT)
In-Reply-To: <1376953494-9684-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 1:04 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> The argument is not used, remove it. No board registers a pcf857x device
> with an IRQ without specifying platform data, IRQ domain registration
> behaviour is thus not affected by this change.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Patch applied, unless Kuninori has some objections.

Yours,
Linus Walleij
