From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: add bindings for Technologic I2C-FPGA gpio controller
Date: Thu, 11 Aug 2016 15:14:50 +0200
Message-ID: <CACRpkdYfHhrVgaTcFdptq0NHnGUEwvG4Nqqhn_zMt8MLnfPAYA@mail.gmail.com>
References: <1470408106-8078-1-git-send-email-lucile.quirion@savoirfairelinux.com>
 <1470408106-8078-2-git-send-email-lucile.quirion@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34854 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751258AbcHKNOw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 09:14:52 -0400
Received: by mail-oi0-f43.google.com with SMTP id 4so4219192oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 06:14:51 -0700 (PDT)
In-Reply-To: <1470408106-8078-2-git-send-email-lucile.quirion@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, kernel <kernel@savoirfairelinux.com>

On Fri, Aug 5, 2016 at 4:41 PM, Lucile Quirion
<lucile.quirion@savoirfairelinux.com> wrote:

> Device tree binding documentation for Technologic's I2C-FPGA GPIO
> controller.
>
> Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
(...)

> +Optional property:
> +- ngpios: see "gpio.txt".

gpio.txt gives examples of what this is used for. Detail why it is used
for this specific hardware.

Yours,
Linus Walleij
