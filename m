From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: add PXs2 Audio in/out pin-mux settings
Date: Tue, 27 Mar 2018 13:35:42 +0200
Message-ID: <CACRpkdYY5BdXRxjf1dG7-YOVHRuArFFG-fNnidyHuXc_B7j8NA@mail.gmail.com>
References: <20180314051137.6091-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180314051137.6091-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 14, 2018 at 6:11 AM, Katsuhiro Suzuki
<suzuki.katsuhiro@socionext.com> wrote:

> The UniPhier PXs2 SoC audio core use following 25 pins:
>   ain1    : 2ch I2S input : AI1ADCCK, AI1BCK, AI1D0, AI1LRCK
>   ain2    : 8ch I2S input : AI2ADCCK, AI2BCK, AI2D[0-3], AI2LRCK
>   ainiec1 : S/PDIF input  : XIRQ17 (for AO1IEC)
>   aout2   : 8ch I2S output: AO2BCK, AO2D0, AO2DACCK, AO2LRCK
>                             PORT226, 227, 230 (for AO2D[1-3])
>   aout3   : 2ch I2S output: AO3BCK, AO3DMIX, AO3DACCK, AO3LRCK
>   aoutiec1: S/PDIF output : PORT132(for AO1IEC)
>   aoutiec2: S/PDIF output : AO2IEC
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>

Patch applied with Masahiro's ACK!

Yours,
Linus Walleij
