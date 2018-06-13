From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: devicetree: Fix pctldev pointer overwrite
Date: Wed, 13 Jun 2018 13:00:32 +0200
Message-ID: <CACRpkdbOr=CRnDGBDp_x0vXWSLTX21bNsw1LhZRvKNbG5BPyqA@mail.gmail.com>
References: <1528390293-8022-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1528390293-8022-1-git-send-email-festevam@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Mika_Penttil=C3=A4?= <mika.penttila@nextfour.com>, Fabio Estevam <fabio.estevam@nxp.com>, stable <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 7, 2018 at 6:51 PM, Fabio Estevam <festevam@gmail.com> wrote:

> From: Fabio Estevam <fabio.estevam@nxp.com>
>
> Commit b89405b6102f ("pinctrl: devicetree: Fix dt_to_map_one_config
> handling of hogs") causes the pinctrl hog pins to not get initialized
> on i.MX platforms leaving them with the IOMUX settings untouched.
>
> This causes several regressions on i.MX such as:
>
> - OV5640 camera driver can not be probed anymore on imx6qdl-sabresd
> because the camera clock pin is in a pinctrl_hog group and since
> its pinctrl initialization is skipped, the camera clock is kept
> in GPIO functionality instead of CLK_CKO function.
>
> - Audio stopped working on imx6qdl-wandboard and imx53-qsb for
> the same reason.
>
> Richard Fitzgerald explains the problem:
>
> "I see the bug. If the hog node isn't a 1st level child of the pinctrl
> parent node it will go around the for(;;) loop again but on the first
> pass I overwrite pctldev with the result of
> get_pinctrl_dev_from_of_node() so it doesn't point to the pinctrl driver
> any more."
>
> Fix the issue by stashing the original pctldev so it doesn't
> get overwritten.
>
> Fixes:  b89405b6102f ("pinctrl: devicetree: Fix dt_to_map_one_config hand=
ling of hogs")
> Cc: <stable@vger.kernel.org>
> Reported-by: Mika Penttil=C3=A4 <mika.penttila@nextfour.com>
> Reported-by: Steve Longerbeam <slongerbeam@gmail.com>
> Suggested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>

Patch applied for fixes with the ACKs!

Thanks for digging into this and fixing it up!

Yours,
Linus Walleij
