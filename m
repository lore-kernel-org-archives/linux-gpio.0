From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Fix pinctrl register irq fail bug.
Date: Tue, 2 Jun 2015 11:08:43 +0200
Message-ID: <CACRpkdbCSBZ9eokjdA+88Yg9A3-Hz1sH93nB1H2qgv7Q+pRS9Q@mail.gmail.com>
References: <1432719835-18939-1-git-send-email-hongzhou.yang@mediatek.com>
	<1432719835-18939-3-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432719835-18939-3-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, huang eddie <eddie.huang@mediatek.com>, dandan.he@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Wed, May 27, 2015 at 11:43 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> Since mt6397 is no need to support interrupt controller,
> I judged "interrupt-controller" property to skip it last patch.
> But the if judgement should on the contrary, this is a bug.
>
> And find of_property_read_bool is better for this case.
> So using of_property_read_bool instead of of_find_property.
>
> Also fix bug of misuse pointer.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied with Axel's review tag.

Yours,
Linus Walleij
