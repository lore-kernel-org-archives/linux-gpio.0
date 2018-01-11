From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: mt7622: fix potential
 uninitialized value being returned
Date: Thu, 11 Jan 2018 10:42:53 +0100
Message-ID: <CACRpkdY8V7J+vfztrqL5N8eCMLg-85KTfWKDwdiTNeWDtt8yMA@mail.gmail.com>
References: <a26c40a8ad2af3cf81b31ae34bc82c1ef80d9279.1515514758.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a26c40a8ad2af3cf81b31ae34bc82c1ef80d9279.1515514758.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 9, 2018 at 5:28 PM,  <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> commit d6ed93551320 ("pinctrl: mediatek: add pinctrl driver for MT7622
> SoC") leads to the following static checker warning:

Patch applied.

Yours,
Linus Walleij
