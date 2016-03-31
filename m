From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio / ACPI: ignore GpioInt() GPIOs when requesting GPIO_OUT_*
Date: Thu, 31 Mar 2016 11:49:13 +0200
Message-ID: <CACRpkdYxpP=tKhuWyCQT4FdkEeruPS-0DWbJmXmPMFkVye=9tA@mail.gmail.com>
References: <20160324175025.GA4149@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:36854 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036AbcCaJtN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 05:49:13 -0400
Received: by mail-oi0-f43.google.com with SMTP id r187so53045896oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 02:49:13 -0700 (PDT)
In-Reply-To: <20160324175025.GA4149@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 24, 2016 at 6:50 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> From: Dmitry Torokhov <dtor@chromium.org>
>
> When firmware does not use _DSD properties that allow properly name GPIO
> resources, the kernel falls back on parsing _CRS resources, and will
> return entries described as GpioInt() as general purpose GPIOs even
> though they are meant to be used simply as interrupt sources for the
> device:

Patch applied for fixes. Is this a regression so that I should
also tag it for stable?

Yours,
Linus Walleij
