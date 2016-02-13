From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/7] Use devm_request_region
Date: Sat, 13 Feb 2016 23:46:20 +0100
Message-ID: <CACRpkdbwQVburoYWcdMibM-KK4sBtT=K5OJ_50r7Htg=XMGv3w@mail.gmail.com>
References: <cover.1454530144.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:35366 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751293AbcBMWqU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Feb 2016 17:46:20 -0500
Received: by mail-ob0-f176.google.com with SMTP id xk3so167442162obc.2
        for <linux-gpio@vger.kernel.org>; Sat, 13 Feb 2016 14:46:20 -0800 (PST)
In-Reply-To: <cover.1454530144.git.vilhelm.gray@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Feb 3, 2016 at 9:15 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> By the time request_region is called in several GPIO drivers, a
> corresponding device structure has already been allocated. The
> devm_request_region function should be used to help simplify the cleanup
> code and reduce the possible points of failure.
>
> Changes in v2:
>   - Remove unused extent member from 104-dio-48e, 104-idi-48,
>     104-idio-16, and ws16c48 respective private data structures
>   - Remove unused pdata pointer from sch311x_gpio_remove function

All 7 patches applied.

Yours,
Linus Walleij
