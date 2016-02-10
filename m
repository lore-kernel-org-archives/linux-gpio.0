From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tps65086: Add GPO driver for the TPS65086 PMIC
Date: Wed, 10 Feb 2016 15:25:10 +0100
Message-ID: <CACRpkdZqe6gBoPMq0otn13HFx0pHGij0em1KD6BS6bNLFE_Vdg@mail.gmail.com>
References: <1454775130-15995-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454775130-15995-1-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Lee Jones <lee.jones@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Feb 6, 2016 at 5:12 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add support for the TPS65086 PMIC GPOs.
>
> TPS65086 has four configurable GPOs that can be used for several
> purposes. These are output only.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
> This is the last component of the tps65086 series, other parts have
> been taken already, this will probably need to be taken through the
> MFD tree due to header dependencies.

Lee: go ahead.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
