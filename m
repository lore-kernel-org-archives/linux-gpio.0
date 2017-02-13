From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pci-idio-16: Fix PCI device ID code
Date: Mon, 13 Feb 2017 15:46:35 +0100
Message-ID: <CACRpkdZ7urbU6FUERN+R=FvOwOt6TTrcghoHTDHkdwDUtKekRg@mail.gmail.com>
References: <20170207165119.GA13838@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170207165119.GA13838@sophia>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 7, 2017 at 5:51 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES PCI-IDIO-16 has a PCI device ID code of 0x0DC8. It is
> incorrect to use the PCI device ID code of the ACCES PCI-IIRO-8
> (0x0F00). This patch fixes the said PCI device ID code mismatch.
>
> Fixes: 02e74fc0401a ("gpio: Add GPIO support for the ACCES PCI-IDIO-16")
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
