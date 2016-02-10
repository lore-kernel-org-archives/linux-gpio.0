From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Wed, 10 Feb 2016 15:22:56 +0100
Message-ID: <CACRpkda5stw2e00-XQTDvM2NkyQuviShv_-HvdzcZmoNhUT7CA@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453738452-23633-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jan 25, 2016 at 5:14 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add driver for TI TPIC2810 8-Bit LED Driver with I2C Interface.
>
> The TPIC2810 has 8 open-drain outputs that can but used to drive
> LEDs and other low-side switched resistive loads.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
> Changes from v1:
>  - Added OF match table at Javier Martinez Canillas request

Patch applied.

Yours,
Linus Walleij
