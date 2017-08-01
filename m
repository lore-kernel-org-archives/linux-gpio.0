From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH RESEND 2/2] gpio: gpio-vf610: add imx7ulp support
Date: Tue, 1 Aug 2017 13:48:34 +0000
Message-ID: <AM3PR04MB306474118389D928F28360E80B30@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1500990438-3894-1-git-send-email-aisheng.dong@nxp.com>
 <1500990438-3894-3-git-send-email-aisheng.dong@nxp.com>
 <CACRpkdYjkaEzuqvtryCwfAWPHhsP3wD8_U3M7kaO7cbCmj5rZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdYjkaEzuqvtryCwfAWPHhsP3wD8_U3M7kaO7cbCmj5rZg@mail.gmail.com>
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
Cc: Peter Chen <peter.chen@nxp.com>, Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dong Aisheng <dongas86@gmail.com>
List-Id: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Linus Walleij [mailto:linus.walleij@linaro.org]
> Sent: Tuesday, August 01, 2017 8:04 PM
> To: A.s. Dong
> Cc: linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> Shawn Guo; Stefan Agner; Jacky Bai; Andy Duan; Peter Chen; Dong Aisheng;
> Sascha Hauer; Alexandre Courbot
> Subject: Re: [PATCH RESEND 2/2] gpio: gpio-vf610: add imx7ulp support
> 
> On Tue, Jul 25, 2017 at 3:47 PM, Dong Aisheng <aisheng.dong@nxp.com> wrote:
> 
> > The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P) on
> > MX7ULP is similar to GPIO on Vibrid. But unlike Vibrid, the RGPIO2P
> > has an extra Port Data Direction Register (PDDR) used to configure the
> > individual port pins for input or output.
> >
> > We introduce a FSL_GPIO_HAVE_PDDR with fsl_gpio_soc_data data to
> > distinguish this differences. And we support getting the output status
> > by checking the GPIO direction in PDDR.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Fugang Duan <fugang.duan@nxp.com>
> > Cc: Peter Chen <peter.chen@nxp.com>
> > Acked-by: Stefan Agner <stefan@agner.ch>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> This is mostly OK but I want a change.
> 
> > +struct fsl_gpio_soc_data {
> > +       u32 flags;
> > +};
> 
> Why introduce complex things like bitwise flags. That looks like premature
> optimization and trying to outsmart the compiler, don't do that.
> 

It's for conveniently adding new flags in the future.
But it's true that it may be premature optimization.

> Add a bool have_paddr;
> 
> simply, and use that in the code.
> 

Will do it.
Thanks for the advice.

Regards
Dong Aisheng

> Apart from that it is fine.
> 
> Yours,
> Linus Walleij
