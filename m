From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: ish-pfc: avoid unused variable warning
Date: Wed, 27 Apr 2016 17:13:25 +0300
Message-ID: <c7844423-7adf-95bd-1174-9c4bddaef69b@cogentembedded.com>
References: <1461751049-2751427-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1461751049-2751427-1-git-send-email-arnd@arndb.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello.

    s/ish-/sh-/ in the subject.

On 4/27/2016 12:56 PM, Arnd Bergmann wrote:

> After the conversion to devm_pinctrl_register, we get a warning in
> sh_pfc_remove when CONFIG_PINCTRL_SH_PFC_GPIO is disabled:
>
> drivers/pinctrl/sh-pfc/core.c: In function 'sh_pfc_remove':
> drivers/pinctrl/sh-pfc/core.c:603:17: unused variable 'pfc' [-Werror=unused-variable]
>   struct sh_pfc *pfc = platform_get_drvdata(pdev);
>
> This moves the variable definition inside of the same ifdef
> that has the only user, to get a clean build again.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 67ec8d7b4846 ("pinctrl: ish-pfc: Use devm_pinctrl_register() for pinctrl registration")

    Ah, the broken patch also has this typo. :-)

WBR, Sergei
