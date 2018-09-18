From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 14/22] pinctrl: mediatek: add multiple register bases
 support to pinctrl-mtk-common-v2.c
Date: Tue, 18 Sep 2018 12:56:45 -0700
Message-ID: <CACRpkdZbXDv2um0jbGWu8OY38sdJg_1ApqDQcj1GXJ5P_E-tuQ@mail.gmail.com>
References: <cover.1536404280.git.sean.wang@mediatek.com> <8c4a741e7ed695d85844a1a550b956d767661b44.1536404280.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8c4a741e7ed695d85844a1a550b956d767661b44.1536404280.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 8, 2018 at 4:07 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> Certain SoC own multiple register base for accessing each pin groups,
> it's easy to be done with extend struct mtk_pin_field_calc to support
> the kind of SoC such as MT8183.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
