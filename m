From: Brian Masney <masneyb@onstation.org>
Subject: Re: next-20190201 build: 2 failures 19 warnings (next-20190201)
Date: Sun, 3 Feb 2019 07:38:42 -0500
Message-ID: <20190203123842.GA8069@basecamp>
References: <E1gpgTf-0002ZN-NF@optimist> <20190202153954.GK20797@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190202153954.GK20797@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Brown <david.brown@linaro.org>, linux-next@vger.kernel.org, linux-gpio@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Andy Gross <andy.gross@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi Mark,

On Sat, Feb 02, 2019 at 03:39:54PM +0000, Mark Brown wrote:
> On Fri, Feb 01, 2019 at 09:35:59PM +0000, Build bot for Mark Brown wrote:
> 
> Friday's -next fails to build an arm64 allmodconfig due to (among other
> things):
> 
> > 	arm64-allmodconfig
> > ERROR: "irq_chip_set_wake_parent" [drivers/pinctrl/qcom/pinctrl-spmi-gpio.ko] undefined!
> 
> due to ca69e2d165eb3d060cc9 (qcom: spmi-gpio: add support for
> hierarchical IRQ chip) as the driver can be built as a module but the
> above symbol is not exported.  

Thanks for the report. I submitted two patches:

https://lore.kernel.org/lkml/20190203123131.28323-1-masneyb@onstation.org/
https://lore.kernel.org/lkml/20190203123131.28323-2-masneyb@onstation.org/

I just realized that I forgot to CC you to those patches. Sorry!

Brian
