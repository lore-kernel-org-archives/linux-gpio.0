From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pch: Optimize pch_gpio_get()
Date: Tue, 5 Jan 2016 15:47:01 +0100
Message-ID: <CACRpkdYruZ2GFcfCgPyGGGOW9exuMz7obAVRic9MJcYbKRXqWA@mail.gmail.com>
References: <20160105142347.72fff8f1@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33902 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751104AbcAEOrC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2016 09:47:02 -0500
Received: by mail-oi0-f43.google.com with SMTP id o124so275011914oia.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2016 06:47:01 -0800 (PST)
In-Reply-To: <20160105142347.72fff8f1@endymion.delvare>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 5, 2016 at 2:23 PM, Jean Delvare <jdelvare@suse.de> wrote:

> The double negation is costly and can be avoided by shifting the
> register value before masking the requested bit.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Patch applied.

Yours,
Linus Walleij
