From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 2/2] pinctrl: pinctrl-pic32: Add PIC32 pin control driver
Date: Fri, 5 Feb 2016 23:57:35 +0100
Message-ID: <CACRpkdYfBNgX8sqOdUfU=qfJkm8MyO88c3PwiOVex=Gpu3s3gg@mail.gmail.com>
References: <1454366916-10925-1-git-send-email-joshua.henderson@microchip.com>
	<1454366916-10925-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34895 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076AbcBEW5g (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2016 17:57:36 -0500
Received: by mail-oi0-f41.google.com with SMTP id s2so50935739oie.2
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2016 14:57:36 -0800 (PST)
In-Reply-To: <1454366916-10925-2-git-send-email-joshua.henderson@microchip.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Feb 1, 2016 at 11:48 PM, Joshua Henderson
<joshua.henderson@microchip.com> wrote:

> Add a driver for the pin controller present on the Microchip PIC32
> including the specific variant PIC32MZDA. This driver provides pinmux
> and pinconfig operations as well as GPIO and IRQ chips for the GPIO
> banks.
>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since v5:

Patch applied.

Yours,
Linus Walleij
