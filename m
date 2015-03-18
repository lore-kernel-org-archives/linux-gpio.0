From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: sh-pfc: Store register/field widths in u8
 instead of unsigned long
Date: Wed, 18 Mar 2015 02:10:15 +0100
Message-ID: <CACRpkdbSNeHcf5H-0ovLYkpoQyPRO2ys_eksKHJhs10x-QVJKQ@mail.gmail.com>
References: <1425985583-26279-1-git-send-email-geert+renesas@glider.be>
	<1425985583-26279-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1425985583-26279-2-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Mar 10, 2015 at 12:06 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Register and field widths are in the range 1..32. Storing them in the
> pinctrl data in (arrays of) unsigned long wastes space.
>
> This decreases the size of a (32-bit) shmobile_defconfig kernel
> supporting 7 SoCs by 26460 bytes.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2:
>   - Add Acked-by.

Patch applied.

Yours,
Linus Walleij
