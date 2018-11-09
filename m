From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 1/1] gpio: vf610: add optional clock support
Date: Fri, 9 Nov 2018 10:53:33 +0100
Message-ID: <CACRpkdYpmfkB82OLG8ksVO9xFz+uW3OAC1uFwEztCS9CNNZeSg@mail.gmail.com>
References: <CACRpkdaO-cUd7wVksboUU0-qu20aBo370Rio=GkNH11U0CB4Jw@mail.gmail.com>
 <1541426614-17299-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1541426614-17299-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Dong Aisheng <dongas86@gmail.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 5, 2018 at 3:08 PM A.s. Dong <aisheng.dong@nxp.com> wrote:

> Some SoCs need the gpio clock to be enabled before accessing
> HW registers. This patch add the optional clock handling.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v4->v5:
>  * refine gpio clk get
>  * add remove

This looks good but doesn't apply to the GPIO "devel" branch
for some reason:

$ git am --signoff dong1.patch
Applying: gpio: vf610: add optional clock support
error: patch failed: drivers/gpio/gpio-vf610.c:16
error: drivers/gpio/gpio-vf610.c: patch does not apply
Patch failed at 0001 gpio: vf610: add optional clock support
Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

$ patch -p1 < dong1.patch
patching file drivers/gpio/gpio-vf610.c
Hunk #1 succeeded at 7 with fuzz 2 (offset -9 lines).
Hunk #2 FAILED at 42.
patch: **** malformed patch at line 136: ev)

Can you check and rebase/resend?

Yours,
Linus Walleij
