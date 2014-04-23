From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpiolib: of: remove gpio_to_desc() usage
Date: Wed, 23 Apr 2014 10:54:32 +0900
Message-ID: <CAAVeFuL9quAgYfzc=0Rvvxtmu0wNJvR8J-ePbFUSiZtg8cyiMg@mail.gmail.com>
References: <1398170621-2685-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:44046 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859AbaDWByx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Apr 2014 21:54:53 -0400
Received: by mail-vc0-f171.google.com with SMTP id lg15so347666vcb.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2014 18:54:52 -0700 (PDT)
In-Reply-To: <1398170621-2685-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Tue, Apr 22, 2014 at 9:43 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> As demonstrated by commit
> 390d82e312c56b75407a3606cbcde8c4bc7f10ae
> "gpiolib: ACPI: remove gpio_to_desc() usage"
>
> gpio_to_desc() must die. Replace one of its usage by the
> newly-introduced gpiochip_get_desc() function.

Yay, let that thing die.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
