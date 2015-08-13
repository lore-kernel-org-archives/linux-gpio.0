From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: Implement wake handler and suspend resume
Date: Thu, 13 Aug 2015 14:58:59 +0200
Message-ID: <CACRpkdYKsUd4OSLJTPYZPmnLZfKQhj_UXmKtrBjKj5N4E8od2Q@mail.gmail.com>
References: <1439453936-8315-1-git-send-email-maoguang.meng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439453936-8315-1-git-send-email-maoguang.meng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maoguang meng <maoguang.meng@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 13, 2015 at 10:18 AM,  <maoguang.meng@mediatek.com> wrote:

> From: Maoguang Meng <maoguang.meng@mediatek.com>
>
> This patch implement irq_set_wake to get who is wakeup source and
> setup on suspend resume.
>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
>
> ---
> changes since v2:
> -modify irq_wake to handle irq wakeup source.
> -allocate two buffers separately.
> -fix some codestyle.
>
> Changes since v1:
> -implement irq_wake handler.

Waiting for Hongzhu's ACK on this patch.

Yours,
Linus Walleij
