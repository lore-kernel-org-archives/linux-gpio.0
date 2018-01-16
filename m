From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/nomadik/abx500: Use seq_putc() in abx500_gpio_dbg_show()
Date: Tue, 16 Jan 2018 11:06:42 +0100
Message-ID: <CACRpkdZcJaCQZ8e5GazOoOW_t8sforOSby7_svay0_AVsD1-0A@mail.gmail.com>
References: <88354751-0a61-4893-35ad-9a7c7337ebce@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <88354751-0a61-4893-35ad-9a7c7337ebce@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 13, 2018 at 11:09 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jan 2018 11:04:29 +0100
>
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
