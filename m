From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: fix gpio irq level in debugfs
Date: Sun, 29 Jul 2018 22:21:22 +0200
Message-ID: <CACRpkdYi_Zb9T4q5i3-KcFrvZyuhuTw4Ys9zg7mk1VD5S-Myyg@mail.gmail.com>
References: <20180717010742.1847-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717010742.1847-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 17, 2018 at 3:07 AM Daniel Kurtz <djkurtz@chromium.org> wrote:

> According to the AMD BKDG, the GPIO ActiveLevel bits (10:9) map to:
>  00 Active High
>  01 Active Low
>  10 Active on both edges iff LevelTrig (bit 8) == 0
>  11 Reserved
>
> The current code has a bug where it interprets 00 => Active Low, and
> 01 => Active High.
>
> Fix the bug, restrict "Active on both" to just the edge trigger case, and
> refactor a bit to make the logic more readable.
>
> Change-Id: Id7775ae4cb61d193fa7fbb83967a8c5a7cdd0de6

I stripped that off.

> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

Patch applied!

Thanks for your fixing and attention to detail!

Yours,
Linus Walleij
