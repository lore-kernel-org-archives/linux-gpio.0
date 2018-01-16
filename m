From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: pinmux: Use seq_putc() in pinmux_pins_show()
Date: Tue, 16 Jan 2018 11:07:41 +0100
Message-ID: <CACRpkdZps9XjXE+BP+xi4J1a85BVjmbOfdzDMXYHRjJbZDnegw@mail.gmail.com>
References: <bb070097-4d6a-3986-398d-7276cb18bb37@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb070097-4d6a-3986-398d-7276cb18bb37@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 13, 2018 at 11:49 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 13 Jan 2018 11:33:47 +0100
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
