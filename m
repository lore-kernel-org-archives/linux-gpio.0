From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: dt-bindings: add brcm,bcm6345-gpio bindings
Date: Thu, 11 Aug 2016 16:16:41 +0200
Message-ID: <CACRpkdZADpW3GbHUwUvnpFArTkHeLFZbq1ochr6D9Q3C3c3OUA@mail.gmail.com>
References: <1470225957-5692-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470225957-5692-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Christian Lamparter <chunkeey@googlemail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 3, 2016 at 2:05 PM, Álvaro Fernández Rojas
<noltari@gmail.com> wrote:

> This patch adds the device tree bindings for the Broadcom's BCM6345
> memory-mapped GPIO controllers.
>
> The gpios will be supported by gpio-mmio code of the
> GPIO generic library.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Turns out my remarks on the bindings and driver were stupid.

Patch applied.

Yours,
Linus Walleij
