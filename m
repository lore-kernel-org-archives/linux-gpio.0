From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 15/22] pinctrl: mediatek: adjust error code and message
 when some register not supported is found
Date: Tue, 18 Sep 2018 12:57:46 -0700
Message-ID: <CACRpkdb6_bbNu-3mipymAbNMs8Wt-HGMegkj3vTt1cW6mmNV2Q@mail.gmail.com>
References: <cover.1536404280.git.sean.wang@mediatek.com> <2873ce93abf93d31a160c7dcbf5b3ff42c5e3886.1536404280.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2873ce93abf93d31a160c7dcbf5b3ff42c5e3886.1536404280.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 8, 2018 at 4:07 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> It's usual and not an error for there's some register not supported by a
> certain SoC or a pin so that in the case we have to adjust the message to
> print and the error code to get rid of unnecessary false alarm.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
