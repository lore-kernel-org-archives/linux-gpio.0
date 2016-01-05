From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: AMD: depend on Seattle or x86
Date: Tue, 5 Jan 2016 15:58:53 +0100
Message-ID: <CACRpkdbpRyXHfOtfqdTwVKxcjobEVaJ+BmFocPZ7AKon0Ah1jw@mail.gmail.com>
References: <1451218972-22156-1-git-send-email-pbrobinson@gmail.com>
	<1451218972-22156-3-git-send-email-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:36356 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846AbcAEO6y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 09:58:54 -0500
Received: by mail-ob0-f178.google.com with SMTP id ba1so275387839obb.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 06:58:53 -0800 (PST)
In-Reply-To: <1451218972-22156-3-git-send-email-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Sun, Dec 27, 2015 at 1:22 PM, Peter Robinson <pbrobinson@gmail.com> wrote:

> Add a dependency on the ARM64 Seatle SoC or generic x86 so we're not
> prompted if we enable pinctrl for another platform.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
(...)
> -       depends on GPIOLIB
> +       depends on GPIOLIB && (ARCH_SEATTLE || X86_GENERIC || COMPILE_TEST)

I suspect this should depend on X86 rather than X86_GENERIC
as Mika pointed out for patch #1 so waiting for a new version
of both patches.

Yours,
Linus Walleij
