From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix a memleak when do dt maps.
Date: Sun, 29 Nov 2015 22:35:39 +0100
Message-ID: <CACRpkdZLA-qu8uzO-7HRnwR6h6y8Gkhw0rs8St8BXjfduUFykA@mail.gmail.com>
References: <1447799622-3340-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447799622-3340-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 17, 2015 at 11:33 PM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> configs will kmemdup to dup_configs in pictrl util function.
> So configs need to be freed.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  Fix a memleak issue.
>  According to Yingjoe's comment, add return checek for pinconf_generic_parse_dt_config.

Patch applied with Yingjoe's review tag.

Yours,
Linus Walleij
