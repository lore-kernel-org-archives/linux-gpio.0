From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH v2] drivers: gpio: sprd: use
 devm_platform_ioremap_resource()
Date: Tue, 12 Mar 2019 10:30:24 +0100
Message-ID: <6c7f2f6c-abda-e552-79e7-fa36951bb670@metux.net>
References: <AMz4kuKC5haGbhyVJ4gQ6nMRzdaxJnd3SmeCSM-096p7TAp8cA@mail.gmail.com>
 <1552378134-3678-1-git-send-email-info@metux.net>
 <CAMz4kuJaFtsmk1sWw_cSc+b0tdNabt_1jZB8hjrJrOgdQkqzmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuJaFtsmk1sWw_cSc+b0tdNabt_1jZB8hjrJrOgdQkqzmA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12.03.19 09:49, Baolin Wang wrote:

> I still do not think the new API is suitable for this case. Since we
> can have optional multiple IO resources, so the original code will not
> return errors if we did not get the IO resources, but we must cast
> errors if we failed to do ioremap. But you ignore the errors of
> ioremap, which is not good.

hmm, maybe we can differenciate on the error code ?

patch up devm_platform_ioremap_resource() so it returns -ENOENT if
there's no such resource defined. I suppose, ioremap() doesn't have
a valid case for -ENOENT (but haven't checked yet).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
