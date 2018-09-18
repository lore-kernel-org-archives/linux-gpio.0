From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 03/22] pinctrl: mediatek: extend struct
 mtk_pin_field_calc to pinctrl-mtk-common-v2.c
Date: Tue, 18 Sep 2018 12:43:17 -0700
Message-ID: <CACRpkdabZop+9L5Hq9pCrYmHXug_qpm6QZV99HdnBh_ecXLnVw@mail.gmail.com>
References: <cover.1536404280.git.sean.wang@mediatek.com> <d43dc09d7ef45940ee14ecf546e939e39315a28f.1536404280.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d43dc09d7ef45940ee14ecf546e939e39315a28f.1536404280.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@mediatek.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 8, 2018 at 4:08 AM <sean.wang@mediatek.com> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
>
> This patch adds members sz_reg fixed in struct mtk_pin_field_calc
>
> - The 'fixed' is used to represent the consecutive pins share the same
> bits within the same register with the 1st pin so that it can largely
> reduce the entry size a bit.
>
> - The 'sz_reg' is used to indicate the range of bits we use in a register
>   that may vary by SoC
>
> The above changes make the code more generic and this is useful as there
> might be other existing or future chips all use the same logic to access
> their register set and then being a little more abstract could help in the
> long run.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
