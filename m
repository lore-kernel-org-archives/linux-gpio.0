From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] gpio: amd-fch: Fix bogus SPDX identifier
Date: Wed, 20 Mar 2019 17:04:41 +0100
Message-ID: <4dcdcd9c-e599-5b8a-b628-4b02b7a092a1@metux.net>
References: <alpine.DEB.2.21.1903191513170.2537@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1903191513170.2537@nanos.tec.linutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Enrico Weigelt <info@metux.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
List-Id: linux-gpio@vger.kernel.org

On 19.03.19 15:28, Thomas Gleixner wrote:
> spdxcheck.py complains:
> 
>  include/linux/platform_data/gpio/gpio-amd-fch.h: 1:28 Invalid License ID: GPL+
> 
> which is correct because GPL+ is not a valid identifier. Of course this
> could have been caught by checkpatch.pl _before_ submitting or merging the
> patch.
> 
>  WARNING: 'SPDX-License-Identifier: GPL+ */' is not supported in LICENSES/...
>  #271: FILE: include/linux/platform_data/gpio/gpio-amd-fch.h:1:
>  +/* SPDX-License-Identifier: GPL+ */
> 
> Fix it under the assumption that the author meant GPL-2.0+, which makes
> sense as the corresponding C file is using that identifier.

Your assumption is correct.

Acked-By: Enrico Weigelt <info@metux.net>

I just wonder, why checkpatch.pl didn't bleat me.

Thanks for the fix.


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
