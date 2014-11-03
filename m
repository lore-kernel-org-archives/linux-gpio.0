From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: remove gpio_descs global array
Date: Mon, 3 Nov 2014 15:11:28 +0100
Message-ID: <CACRpkdaaXxXCm9===0zaKW5QJsHFBznnERdFrcbtKLQhxygzhA@mail.gmail.com>
References: <1414825380-15322-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f170.google.com ([209.85.213.170]:44930 "EHLO
	mail-ig0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751701AbaKCOL3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Nov 2014 09:11:29 -0500
Received: by mail-ig0-f170.google.com with SMTP id h15so4550879igd.5
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2014 06:11:28 -0800 (PST)
In-Reply-To: <1414825380-15322-1-git-send-email-acourbot@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Nov 1, 2014 at 8:03 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> The issue with this patch is its use of kzalloc() in gpiochip_add(), a
> function potentially called during early boot, before kzalloc() becomes
> usable. Hence its [RFC] status until we can find a solution for this or
> agree that this issue is actually never ran into (from which point can
> one use kzalloc()?)

So which driver requires that the gpiochip be statically defined...
I heard about early call but not *that* early.

Yours,
Linus Walleij
