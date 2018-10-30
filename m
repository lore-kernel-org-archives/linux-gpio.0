From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: mediatek: Add initial pinctrl driver for
 MT6797 SoC
Date: Tue, 30 Oct 2018 13:51:11 +0100
Message-ID: <CACRpkdb-Er8z6JdvYWE8UXUa3dfVSu4S-VbnqvcV+vf9erJuNw@mail.gmail.com>
References: <20181008191411.32555-1-manivannan.sadhasivam@linaro.org>
 <20181008191411.32555-6-manivannan.sadhasivam@linaro.org> <c8d65395-c60c-5d06-92ad-c389642c22ba@gmail.com>
 <20181011164429.GA18174@Mani-XPS-13-9360> <e7abee72-23a3-4716-baf0-484514bbb019@gmail.com>
 <CAGp9LzoP2zkryhJCQNGpe9X0+7yUd31ffV7vM4j6KvTdfPpCrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGp9LzoP2zkryhJCQNGpe9X0+7yUd31ffV7vM4j6KvTdfPpCrA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Sean Wang <sean.wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Cheng Mars <mars.cheng@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 18, 2018 at 5:06 PM Sean Wang <sean.wang@kernel.org> wrote:

> the driver currently only supports the basic operation, not including
> driving operation, so
> what value for the driving mode for a certain pin seems not really
> matter in the early patch. I think these advanced operations can be
> added with another patch.

Sean can you provide an Acked-by for the pinctrl part so I can merge
it once Manivannan resends it for v4.21?

Yours,
Linus Walleij
