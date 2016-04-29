From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC v5 1/4] gpio: generic: fix GPIO_GENERIC_PLATFORM is set to
 module case
Date: Fri, 29 Apr 2016 16:13:36 +0200
Message-ID: <CACRpkda0By+G-K-SvyaMAfqt-2SLpP0JtmMhoBf3nt-3+YPWtQ@mail.gmail.com>
References: <cover.1461888822.git.chunkeey@googlemail.com>
	<e365a17a9080ad6d16fe934121d78adb0402d0d5.1461888822.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34833 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753283AbcD2ONh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2016 10:13:37 -0400
Received: by mail-ob0-f172.google.com with SMTP id n10so48900011obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2016 07:13:36 -0700 (PDT)
In-Reply-To: <e365a17a9080ad6d16fe934121d78adb0402d0d5.1461888822.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Apr 29, 2016 at 2:53 AM, Christian Lamparter
<chunkeey@googlemail.com> wrote:

> GPIO_GENERIC_PLATFORM is a tristate. If the module option is
> selected the resulting gpio-generic.ko will lack most of the
> module initialzation and probe code.
>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>

Obviously correct, patch applied.

Yours,
Linus Walleij
