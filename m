From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/1] gpio-f7188x: Add F81866 GPIO supports
Date: Thu, 28 Jan 2016 10:07:25 +0100
Message-ID: <CACRpkdYB3_X++4+ARRPh5yAE_7tdQ3XmuSzaGUQTaZshqR+NUg@mail.gmail.com>
References: <1453447413-25290-1-git-send-email-hpeter+linux_kernel@gmail.com>
	<1453447413-25290-2-git-send-email-hpeter+linux_kernel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453447413-25290-2-git-send-email-hpeter+linux_kernel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hung <hpeter@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2016 at 8:23 AM, Peter Hung <hpeter@gmail.com> wrote:

> Add F81866 GPIO supports
>
> Fintek F81866 is a SuperIO. It contains HWMON/GPIO/Serial Ports.
> and it has totally 72(9x8 sets) gpio pins.
>
> Here is the PDF spec:
> http://www.alldatasheet.com/datasheet-pdf/pdf/459085/FINTEK/F81866AD-I.html
>
> The control method is the same with F7188x, but we should care the address
> of GPIO8x.
>
> GPIO address is below:
>     GPIO0x based: 0xf0
>     GPIO1x based: 0xe0
>     GPIO2x based: 0xd0
>     GPIO3x based: 0xc0
>     GPIO4x based: 0xb0
>     GPIO5x based: 0xa0
>     GPIO6x based: 0x90
>     GPIO7x based: 0x80
>     GPIO8x based: 0x88 <-- not 0x70.
>
> Signed-off-by: Peter Hung <hpeter+linux_kernel@gmail.com>

This v2 patch applied with Simon's ACK.

Yours,
Linus Walleij
