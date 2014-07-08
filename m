From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 2/3] gpio: move sysfs support to its own file
Date: Tue, 8 Jul 2014 10:21:17 +0200
Message-ID: <CACRpkdaRReCWObTBP-ujiM-R9Js2y+L6RFtAfw6AP1cwx1hrHA@mail.gmail.com>
References: <1404193516-4384-1-git-send-email-acourbot@nvidia.com>
	<1404193516-4384-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:39832 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753137AbaGHIVR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jul 2014 04:21:17 -0400
Received: by mail-oa0-f53.google.com with SMTP id l6so5821467oag.26
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2014 01:21:17 -0700 (PDT)
In-Reply-To: <1404193516-4384-3-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 1, 2014 at 7:45 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> sysfs support is currently entangled within the core GPIO support, while
> it should relly just be a (privileged) user of the integer GPIO API.
> This patch is a first step towards making the gpiolib code more readable
> by splitting it into logical parts.
>
> Move all sysfs support to their own source file, and share static
> members of gpiolib that need to be in the private gpiolib.h file. In
> the future we will want to put some of them back into gpiolib.c, but this
> first patch let us at least identify them.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied. We really need to make refactorings like this
so thanks a lot.

Yours,
Linus Walleij
