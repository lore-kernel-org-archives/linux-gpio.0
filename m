From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] pinctrl: imx: make sure that maps are fully initialized
Date: Sat, 10 Nov 2018 15:49:00 -0200
Message-ID: <CAOMZO5CF0KoAckvJ++FuQcaj2d1bNBCvZMzThuezUCQ95+od_g@mail.gmail.com>
References: <1541871439-4882-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541871439-4882-1-git-send-email-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>, Sascha Hauer <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Martin,

On Sat, Nov 10, 2018 at 3:39 PM Martin Kaiser <martin@kaiser.cx> wrote:
>
> The commit that added scu based pinctrl support introduced a regression
> for the mmio case. In the for-loop where the maps are initialized, we
> end up creating a partially initialized map in some cases. This causes a
> kernel panic when such a map is used at a later stage.
>
> When scu is not used and and a pin uses the default pad configuration,
> the current code sets the map's type and data.configs.group_or_pin but
> no configs or num_configs are set. The previous code without scu
> support did not create a new map at all in this case and did not
> increment the counter.
>
> Fix this by setting the map type and data.configs.group_or_pin only when
> a configuration was set before, either by scu or by mmio using a
> non-default pad config. Increment the counter only if a new map was
> created.
>
> Fixes: b96eea718bf6 ("pinctrl: fsl: add scu based pinctrl support")
> Cc: A.s. Dong <aisheng.dong@nxp.com>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
