From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: acpi: normalize use of gpiochip_get_desc()
Date: Fri, 29 Aug 2014 08:57:31 +0200
Message-ID: <CACRpkdb-u_HUmmSnqZxCqcR-E+OG0zFKiE8shEG-7xD0HUcfgg@mail.gmail.com>
References: <1408467969-21226-1-git-send-email-acourbot@nvidia.com>
	<1408467969-21226-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:34274 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbaH2G5c (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 02:57:32 -0400
Received: by mail-oa0-f53.google.com with SMTP id eb12so1468606oac.40
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2014 23:57:31 -0700 (PDT)
In-Reply-To: <1408467969-21226-2-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Aug 19, 2014 at 7:06 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> GPIO descriptors are changing from unique and permanent tokens to
> allocated resources. Therefore gpiochip_get_desc() cannot be used as a
> way to obtain a global GPIO descriptor anymore.
>
> This patch updates the gpiolib ACPI support code to keep and use the
> descriptor returned by a centralized call to gpiochip_get_desc().
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Tested-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
