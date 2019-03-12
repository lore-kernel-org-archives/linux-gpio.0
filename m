From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] drivers: gpio: octeon: use
 devm_platform_ioremap_resource()
Date: Tue, 12 Mar 2019 16:11:33 +0100
Message-ID: <5f55101d-ae12-0908-fff1-934f0e8d0d54@metux.net>
References: <1552330521-4276-23-git-send-email-info@metux.net>
 <1552333701-22712-1-git-send-email-info@metux.net>
 <CAMpxmJWCpfm0E15k0vAcxOKFTGdaFkmqK-VXD+orVE65H1Uk2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJWCpfm0E15k0vAcxOKFTGdaFkmqK-VXD+orVE65H1Uk2g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 12.03.19 14:45, Bartosz Golaszewski wrote:

> Can you make this a part of the bigger series and resend together with
> subject line fixes?

tried to resend it as reply on the prev version. but somehow this
didn't seem to work as intented.

> Also: maybe consider adding a coccinelle script for that. When I added
> that function I noticed there are 1200+ instances in the kernel that
> need fixing. I think we'll be better off automating it.

haven't coped w/ this yet ... I'll first need to have a deeper look
at it. advices welcomed.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
