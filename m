From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: imx: add imx8qm driver
Date: Fri, 11 Jan 2019 09:26:21 +0100
Message-ID: <CACRpkdaM1XhZ6Ff3qVKTPxG8E9+y0J2Wo2ms2dnnotGDvt+TkQ@mail.gmail.com>
References: <1545146239-30993-1-git-send-email-aisheng.dong@nxp.com>
 <1545146239-30993-3-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1545146239-30993-3-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, Fabio Estevam <festevam@gmail.com>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 18, 2018 at 4:23 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:

> MX8QM contains a system controller that is responsible for controlling
> the pad setting of the IPs that are present. Communication between the
> host processor running an OS and the system controller happens through
> a SCU protocol. This patch adds the SCU based MX8QM pinctrl driver.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Somehow I managed to apply the DT bindings but not this driver.
I blame it on christmas stress. Patch applied now.

Yours,
Linus Walleij
