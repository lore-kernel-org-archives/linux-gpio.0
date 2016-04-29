From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v4 2/8] gpio: rename gpio-generic.c into gpio-mmio.c
Date: Fri, 29 Apr 2016 16:14:57 +0200
Message-ID: <CACRpkdbZjFz7hmLqzMfhunrj8UHtRremfMTNOQULno83_qWZSw@mail.gmail.com>
References: <cover.1461806071.git.chunkeey@googlemail.com>
	<5d6d06726e8ed05aea6cae0aaa9166b10c408dd0.1461806071.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34942 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752625AbcD2OO6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2016 10:14:58 -0400
Received: by mail-oi0-f46.google.com with SMTP id x19so119525239oix.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2016 07:14:58 -0700 (PDT)
In-Reply-To: <5d6d06726e8ed05aea6cae0aaa9166b10c408dd0.1461806071.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Apr 28, 2016 at 11:05 AM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> This patch renames the gpio-generic.c into gpio-mmio.c.
> This is because currently the file only contains code
> for a memory-mapped GPIO driver. There isn't any support
> for ioports or other resource type.
>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Makes perfect sense.

Patch applied.

Yours,
Linus Walleij
