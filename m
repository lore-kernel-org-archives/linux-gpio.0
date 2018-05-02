From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] pinctrl: uniphier: add LD20 MPEG2-TS I/O pin-mux settings
Date: Wed, 2 May 2018 14:16:59 +0200
Message-ID: <CACRpkdZUypgGfgWMOy_Vjcu_djRhX1Ue8ReLUNeJ2BQ4LSfF6w@mail.gmail.com>
References: <20180427014905.19520-1-suzuki.katsuhiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427014905.19520-1-suzuki.katsuhiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 27, 2018 at 3:49 AM, Katsuhiro Suzuki
<suzuki.katsuhiro@socionext.com> wrote:

> The MPEG2-TS input/output core both accepts serial TS and parallel TS.
>
> The serial TS interface uses following pins:
>   hscin0_s : HS0DOUT[0-3]
>   hscin1_s : HS0DOUT[4-7]
>   hscin2_s : HS1BCLKIN, HS1SYNCIN, HS1VALIN, HS1DIN0
>   hscin3_s : HS1DIN[2-5]
>   hscout0_s: HS0DOUT[0-3]
>   hscout1_s: HS0DOUT[4-7]
>
> And the parallel TS interface uses following pins:
>   hscin0_p : HS0BCLKIN, HS0SYNCIN, HS0VALIN, HS0DIN[0-7]
>   hscin1_p : HS1BCLKIN, HS1SYNCIN, HS1VALIN, HS1DIN[0-7]
>   hscout0_p: HS0BCLKOUT, HS0SYNCOUT, HS0VALOUT, HS0DOUT[0-7]
>
> Signed-off-by: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
> Changes in v2:

This v2 version applied with Masahiro's ACK.

Yours,
Linus Walleij
