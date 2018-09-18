From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 04/22] pinctrl: mediatek: extend struct mtk_pin_desc to pinctrl-mtk-common-v2.c
Date: Tue, 18 Sep 2018 12:44:29 -0700
Message-ID: <CACRpkdaLx_gxGMqumbRKVQA5asB0w+WA5nPgETiq6xQ=QzYJig@mail.gmail.com>
References: <cover.1536404280.git.sean.wang@mediatek.com> <8afc61bff2a4146731e5696f440c0eeaaf0ea341.1536404280.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8afc61bff2a4146731e5696f440c0eeaaf0ea341.1536404280.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 8, 2018 at 4:07 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> This patch introduces a data structure mtk_pin_desc, which is used to
> provide information per pin characteristic such as driving current,
> eint number and a driving index, that is used to lookup table describing
> the details about the groups of driving current by which the pin is able
> to adjust the driving strength so that the driver could get the
> appropriate driving group when calls .pin_config_get()/set().
>
> Signed-off-by: Ryder.Lee <ryder.lee@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
