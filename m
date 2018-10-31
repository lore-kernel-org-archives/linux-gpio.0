From: Kun Yi <kunyi@google.com>
Subject: Re: [PATCH 2/2] pinctrl: pinctrl-npcm7xx: Set BGPIOF_VOLATILE_REG
Date: Tue, 30 Oct 2018 22:06:52 -0700
Message-ID: <CAGMNF6VMLqRwVb=+-qU=nC9hW-idV-fLrnHFL9_xv7Ajha17og@mail.gmail.com>
References: <20181017213012.233957-1-kunyi@google.com> <20181017213012.233957-3-kunyi@google.com>
 <CACRpkdbS_aOpFORVnK3QJUsF1p-mVxtMas-q6fOp7emTx281Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbS_aOpFORVnK3QJUsF1p-mVxtMas-q6fOp7emTx281Lg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, broonie@kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 30, 2018 at 5:08 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Oct 17, 2018 at 11:30 PM Kun Yi <kunyi@google.com> wrote:
>
> > Indicate that the pins are both controlled by the pinctrl driver and the
> > generic GPIO driver, thus GPIO driver should read the register value
> > before updating, instead of using the stored shadow register values.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> This is quite a rough measure, if we instead use regmap-mmio
> we can exercise fine control over what register are volatile and
> not instead of saying that all of them or some of them are.

Thanks for your review Linus! I don't have time to rewrite using
regmap-mmio at the moment though. I have discussed with the driver
author and we will first patch the pinctrl driver by making the
pinctrl functions use the gpio-mmio accessors instead of directly reg
read/writes. When I have time I will look into your suggestion to
improve the driver.

>
> Yours,
> Linus Walleij

-- 
Regards,
Kun
