From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH 2/8] gpio: zynq: Wakeup gpio controller when it is used as
 IRQ controller
Date: Mon, 21 Jan 2019 11:41:07 +0530
Message-ID: <CAKfKVtHrh8r7kp=2br6OCKgWgsNmd5sVG2C96QnhYSFDj7B_+Q@mail.gmail.com>
References: <cover.1502103715.git.michal.simek@xilinx.com>
 <72d3cd83bed792a23ab60cf9b6d51b618f5aa084.1502103715.git.michal.simek@xilinx.com>
 <CACRpkdZE-Edr7fWZY5VQM1_65iw7MYGP-iDa2ExZsPxpM0rurQ@mail.gmail.com>
 <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com>
 <20190107164210.3ecf37e8@windsurf>
 <CACRpkdafBpC14TxBNVN2AemkBz-yKkXkKfNpdgkYKQX3qFemag@mail.gmail.com>
 <20190111135413.73dad0b2@windsurf>
 <CACRpkdZVfH_LYQov5mkMvp6BWjkVsisawWuE1PMp0b8dW5Qc=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZVfH_LYQov5mkMvp6BWjkVsisawWuE1PMp0b8dW5Qc=g@mail.gmail.com>
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
Cc: Josh Cartwright <josh.cartwright@ni.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Nava kishore Manne <navam@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Borsodi Petr <Petr.Borsodi@i.cz>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Shubhrajyoti Datta <shubhraj@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jan 11, 2019 at 8:26 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 11, 2019 at 1:54 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Fri, 11 Jan 2019 10:54:20 +0100, Linus Walleij wrote:
> >
> > > My stance is that the driver is responsible of enabling and managing
> > > runtime PM for its hardware block(s).
> > >
> > > Runtime PM in the core should only be added if the core needs to
> > > be aware about it, such as is the case when e.g. a block device
> > > needs to drain its write buffer before going to runtime sleep.
> > >
> > > I fail so see why the GPIO core need to be aware about this.
> >
> > In this very same thread at
> > https://www.spinics.net/lists/arm-kernel/msg600515.html,  you kind of

I was not abloe to open the link could you please let me  know if I am
missing something?
