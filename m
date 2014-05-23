From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio / ACPI: use *_cansleep version of gpiod_get/set APIs
Date: Fri, 23 May 2014 14:37:06 +0200
Message-ID: <CACRpkdbOUgFrGY9xEcmER_Gvs6ATh=YkV06OObcvj79KCcx84g@mail.gmail.com>
References: <537B15A0.3080406@intel.com>
	<20140520085050.GF1651@lahna.fi.intel.com>
	<537B1940.5060005@intel.com>
	<537B1B5A.1090602@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:40414 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751500AbaEWMhH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 May 2014 08:37:07 -0400
Received: by mail-ob0-f175.google.com with SMTP id wo20so5257813obc.34
        for <linux-gpio@vger.kernel.org>; Fri, 23 May 2014 05:37:06 -0700 (PDT)
In-Reply-To: <537B1B5A.1090602@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Lu <aaron.lu@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 20, 2014 at 11:07 AM, Aaron Lu <aaron.lu@intel.com> wrote:

> The GPIO operation region handler should be called where sleep is
> allowed, so we should use the *_cansleep version of gpiod_get/set APIs
> or we will get a warning message complaining invalid context if the GPIO
> chip has the cansleep flag set.
>
> Signed-off-by: Aaron Lu <aaron.lu@intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> v2: remove the inclusion of linux/gpio.h as pointed out by Mika.

Patch applied with ALex's ACK.

Yours,
Linus Walleij
