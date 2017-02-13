From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pci-idio-16: Fix PCI BAR index
Date: Mon, 13 Feb 2017 16:19:41 +0100
Message-ID: <CACRpkdYm35SNpdgEkxCszP_as3PA6JpZk_6dYqBvZJ=v0+6r8w@mail.gmail.com>
References: <20170208133246.GA16610@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208133246.GA16610@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 8, 2017 at 2:32 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The PCI BAR0 and BAR1 for the PCI-IDIO-16 hold information for the PLX
> 9052 bridge chip on the device. The PCI BAR2 holds the necessary base
> address for I/O control of the PCI-IDIO-16. This patch corrects the PCI
> BAR index mismatch for the PCI-IDIO-16 GPIO driver.
>
> Fixes: 02e74fc0401a ("gpio: Add GPIO support for the ACCES PCI-IDIO-16")
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
