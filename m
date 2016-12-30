From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Move freeing of GPIO hogs before numbing of the device
Date: Fri, 30 Dec 2016 09:12:08 +0100
Message-ID: <CACRpkdb+i0nLXQeNWavw7LYch1vVcpnsKFXdKk1c=OiL5OUx_Q@mail.gmail.com>
References: <1482168563-4562-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482168563-4562-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Dec 19, 2016 at 6:29 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> When removing a gpiochip that uses GPIO hogging (e.g. by unloading the
> chip's DT overlay), a warning is printed:
>
>     gpio gpiochip8: REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED
>
> This happens because gpiochip_free_hogs() is called after the gdev->chip
> pointer is reset to NULL. Hence __gpiod_free() cannot determine the
> chip in use, and cannot clear flags nor call the optional chip-specific
> .free() callback.
>
> Move the call to gpiochip_free_hogs() up to fix this.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Patch applied to fixes and tagged for stable.

Yours,
Linus Walleij
