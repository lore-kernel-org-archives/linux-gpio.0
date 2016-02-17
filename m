From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [patch] pinctrl: mediatek: signedness bug in mtk_pmx_gpio_request_enable()
Date: Wed, 17 Feb 2016 09:44:43 +0800
Message-ID: <CAFRkauCMTv3DqeKBSx6z4ZJKUVmO38Bm+5bwc0pBbHnr-LQJZg@mail.gmail.com>
References: <20160216200658.GA9223@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20160216200658.GA9223@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Biao Huang <biao.huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Jonas Gorski <jogo@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

2016-02-17 4:06 GMT+08:00 Dan Carpenter <dan.carpenter@oracle.com>:
> "muxval" stores a value from 0-255 or a negative error code.  It has to
> be signed for the error handling to work.
>
> Fixes: 59ee9c96dd5d ('pinctrl: mediatek: Add gpio_request_enable support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Axel Lin <axel.lin@ingics.com>
