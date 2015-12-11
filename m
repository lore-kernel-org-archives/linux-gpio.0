From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Fri, 11 Dec 2015 19:47:09 -0200
Message-ID: <CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
References: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:38636 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849AbbLKVrK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 16:47:10 -0500
Received: by igbxm8 with SMTP id xm8so48278165igb.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 13:47:09 -0800 (PST)
In-Reply-To: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Hi Linus,

On Fri, Dec 11, 2015 at 7:36 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The bgpio_get_set() call should return a value clamped to [0,1],
> the current code will return a negative value if reading
> bit 31, which turns the value negative as this is a signed value
> and thus gets interpreted as an error by the gpiolib core.
> Found on the gpio-mxc but applies to any MMIO driver.
>
> Fixes: b19e7f51a55f "gpio: gpio-generic: add flag to read out output value from reg_set"

This commit appeared in 4.2, so it would be nice to add a stable tag:

Cc: <stable@vger.kernel.org> # 4.2+

Regards,

Fabio Estevam
