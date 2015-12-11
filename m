From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Fri, 11 Dec 2015 20:23:42 -0200
Message-ID: <CAOMZO5D22UWVOr3J-LgwB41w8XJcvyraeKgfvgUpCr1Uv8kL6A@mail.gmail.com>
References: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
	<CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
	<CACRpkdb2nv99RN1PGwQx7LxSd1_jn0A5MAB7YGTY5TWm_s7z5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:34487 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754351AbbLKWXn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 17:23:43 -0500
Received: by mail-ig0-f179.google.com with SMTP id g19so49410934igv.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 14:23:43 -0800 (PST)
In-Reply-To: <CACRpkdb2nv99RN1PGwQx7LxSd1_jn0A5MAB7YGTY5TWm_s7z5A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Fri, Dec 11, 2015 at 8:10 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

>>> Fixes: b19e7f51a55f "gpio: gpio-generic: add flag to read out output value from reg_set"
>>
>> This commit appeared in 4.2, so it would be nice to add a stable tag:
>>
>> Cc: <stable@vger.kernel.org> # 4.2+
>
> IIUC Fixes: has exactly this effect: it will be applied to any kernel where
> that commit is present. The beauty of git commit hashes.

Not sure if this has the same effect as it is not mentioned at
Documentation/stable_kernel_rules.txt

Regards,

Fabio Estevam
