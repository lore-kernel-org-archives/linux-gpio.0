From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 04/10] gpio: vf610: add optional clock support
Date: Mon, 5 Nov 2018 14:10:31 +0000
Message-ID: <AM0PR04MB42117A904BCB651591B1075480CA0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1541149669-10857-1-git-send-email-aisheng.dong@nxp.com>
 <1541149669-10857-5-git-send-email-aisheng.dong@nxp.com>
 <CACRpkdaO-cUd7wVksboUU0-qu20aBo370Rio=GkNH11U0CB4Jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaO-cUd7wVksboUU0-qu20aBo370Rio=GkNH11U0CB4Jw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dong Aisheng <dongas86@gmail.com>, Russell King <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Linus Walleij [mailto:linus.walleij@linaro.org]
> Sent: Friday, November 2, 2018 5:37 PM
[...]
> On Fri, Nov 2, 2018 at 10:12 AM A.s. Dong <aisheng.dong@nxp.com> wrote:
> 
> > Some SoCs need the gpio clock to be enabled before accessing HW
> > registers. This patch add the optional clock handling.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: linux-gpio@vger.kernel.org
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > v2->v3:
> >  * error checking updated according to Russell's suggestion:
> >    ptr == ERR_PTR(-EPROBE_DEFER)
> >  * clock independently checking
> 
> Please look at my feedback for v2 as well, sorry for the synchronization
> problems here... Didn't see this version until after replying.
> 

Thanks for the suggestion.
I just sent an updated version in reply to this thread.
Please help check if it's okay to you.

Regards
Dong Aisheng

> Yours,
> Linus Walleij
