From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG
Date: Tue, 30 Oct 2018 13:08:14 +0100
Message-ID: <CACRpkdbS_aOpFORVnK3QJUsF1p-mVxtMas-q6fOp7emTx281Lg@mail.gmail.com>
References: <20181017213012.233957-1-kunyi@google.com> <20181017213012.233957-3-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017213012.233957-3-kunyi@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kunyi@google.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, avifishman70@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Mark Brown <broonie@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Oct 17, 2018 at 11:30 PM Kun Yi <kunyi@google.com> wrote:

> Indicate that the pins are both controlled by the pinctrl driver and the
> generic GPIO driver, thus GPIO driver should read the register value
> before updating, instead of using the stored shadow register values.
>
> Signed-off-by: Kun Yi <kunyi@google.com>

This is quite a rough measure, if we instead use regmap-mmio
we can exercise fine control over what register are volatile and
not instead of saying that all of them or some of them are.

Yours,
Linus Walleij
