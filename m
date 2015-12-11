From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: generic: clamp values from bgpio_get_set()
Date: Fri, 11 Dec 2015 23:10:48 +0100
Message-ID: <CACRpkdb2nv99RN1PGwQx7LxSd1_jn0A5MAB7YGTY5TWm_s7z5A@mail.gmail.com>
References: <1449869778-6974-1-git-send-email-linus.walleij@linaro.org>
	<CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34375 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753451AbbLKWKs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 17:10:48 -0500
Received: by oihr132 with SMTP id r132so10825706oih.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 14:10:48 -0800 (PST)
In-Reply-To: <CAOMZO5DVNm9JK080RQ+OnhtBVyt+VYc5PmdYDUzRnJDBZ+3CEg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

On Fri, Dec 11, 2015 at 10:47 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 7:36 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> The bgpio_get_set() call should return a value clamped to [0,1],
>> the current code will return a negative value if reading
>> bit 31, which turns the value negative as this is a signed value
>> and thus gets interpreted as an error by the gpiolib core.
>> Found on the gpio-mxc but applies to any MMIO driver.
>>
>> Fixes: b19e7f51a55f "gpio: gpio-generic: add flag to read out output value from reg_set"
>
> This commit appeared in 4.2, so it would be nice to add a stable tag:
>
> Cc: <stable@vger.kernel.org> # 4.2+

IIUC Fixes: has exactly this effect: it will be applied to any kernel where
that commit is present. The beauty of git commit hashes.

Yours,
Linus Walleij
