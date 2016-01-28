From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add GPIO support for the ACCES 104-DIO-48E
Date: Thu, 28 Jan 2016 09:52:16 +0100
Message-ID: <CACRpkdbENNDsLgt_2-MSn+tTV7cCeiwwPxK2NZ+pfPxyfdo2wQ@mail.gmail.com>
References: <20160120185011.GA25935@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160120185011.GA25935@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2016 at 7:50 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-DIO-48E device provides 48 lines digital I/O via two
> Programmable Peripheral Interface (PPI) chips of type 82C55. Bit C3 at
> each 24-bit Group can be used as an external interrupt, triggered by a
> rising edge.
>
> This driver provides GPIO and IRQ support for these 48 channels of
> digital I/O. The base port address for the device may be configured via
> the dio_48e_base module parameter. The interrupt line number for the
> device may be configured via the dio_48e_irq module parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v2:
>   - Remove irq_mask member check since device cannot share IRQ

This v2 version applied.

Good work as usual.

Yours,
Linus Walleij
