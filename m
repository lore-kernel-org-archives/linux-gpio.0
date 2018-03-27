From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: divide I2S and S/PDIF audio out
 pin-mux group
Date: Tue, 27 Mar 2018 13:37:08 +0200
Message-ID: <CACRpkdYDJkk8eJuGPAXO7fpvGZ4KbjSf43difeEGTV9KzJcmvg@mail.gmail.com>
References: <20180314063535.13303-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314063535.13303-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 14, 2018 at 7:35 AM, Katsuhiro Suzuki
<suzuki.katsuhiro@socionext.com> wrote:

> This patch divides large pin-mux group 'aio' of UniPhier LD11/LD20
> to 2 groups as following:
>   aout1   : 8ch I2S output: AO1DACCK, AO1BCK, AO1LRCK, AO1D[0-2]
>   aoutiec1: S/PDIF output : AO1IEC, AO1ARC
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>

Patch applied with Masahiro's ACK!

Yours,
Linus Walleij
