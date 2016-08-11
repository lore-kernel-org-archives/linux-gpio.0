From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] gpio: mmio: add brcm,bcm6345 support
Date: Thu, 11 Aug 2016 16:18:08 +0200
Message-ID: <CACRpkdYj0FzNBzB-FTygGxF7VzWZxuL7+Yvo+kXTTRc_ySNVzw@mail.gmail.com>
References: <1470225957-5692-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470225957-5692-2-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Christian Lamparter <chunkeey@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 3, 2016 at 2:05 PM, Álvaro Fernández Rojas
<noltari@gmail.com> wrote:

> From: Christian Lamparter <chunkeey@googlemail.com>
>
> This patch adds support for the GPIO found in Broadcom's bcm63xx-gpio
> chips.
> This GPIO controller is used in the following Broadcom SoCs: BCM6338, BCM6345.
> It can be used in newer SoCs, without the capability of pin multiplexing.
>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Excellent patch, especially how it does endianness, applied.

Forget my earlier (erroneous) remarks.

Yours,
Linus Walleij
