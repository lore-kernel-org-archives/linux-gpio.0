From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: imx: fix scu link errors
Date: Fri, 8 Mar 2019 13:17:46 +0100
Message-ID: <CACRpkdYSd82Pm76OpSQ2ic4HRVxOdwy5KmtwfsGOpb44vwzJVA@mail.gmail.com>
References: <1551927501-14527-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1551927501-14527-1-git-send-email-aisheng.dong@nxp.com>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, "dongas86@gmail.com" <dongas86@gmail.com>, "arnd@arndb.de" <arnd@arndb.de>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 7, 2019 at 4:05 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:

> From: Anders Roxell <anders.roxell@linaro.org>
>
> Currently PINCTRL_IMX8QM and PINCTRL_IMX8QXP will select PINCTRL_IMX_SCU.
> However, PINCTRL_IMX_SCU may not be valid due to it depends on IMX_MBOX.
> Then we may meet the following link errors:
> ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinctrl_sc_ipc_init':
> pinctrl-scu.c:(.text+0x10): undefined reference to `imx_scu_get_handle'
> ld: pinctrl-scu.c:(.text+0x10): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_scu_get_handle'
> ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinconf_get_scu':
> pinctrl-scu.c:(.text+0xa0): undefined reference to `imx_scu_call_rpc'
> ld: pinctrl-scu.c:(.text+0xa0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_scu_call_rpc'
> ld: drivers/pinctrl/freescale/pinctrl-scu.o: in function `imx_pinconf_set_scu':
> pinctrl-scu.c:(.text+0x1b4): undefined reference to `imx_scu_call_rpc'
> ld: pinctrl-scu.c:(.text+0x1b4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_scu_call_rpc'
> ld: drivers/pinctrl/freescale/pinctrl-imx8qxp.o: in function `imx8qxp_pinctrl_probe':
> pinctrl-imx8qxp.c:(.text+0x28): undefined reference to `imx_pinctrl_probe'
> ld: pinctrl-imx8qxp.c:(.text+0x28): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `imx_pinctrl_probe'
>
> Rework so that PINCTRL_IMX8QM and PINCTRL_IMX8QXP depends on IMX_SCU
> as well in case they're wrongly enabled.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Patch applied.

Yours,
Linus Walleij
