From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: msm: fix gpio-hog related boot issues
Date: Wed, 2 May 2018 14:14:39 +0200
Message-ID: <CACRpkdaEYFerKQa4QRCFEg2TOrdbnF6SfVZ9chLpmCxSUNcZBw@mail.gmail.com>
References: <20180402121005.10080-1-chunkeey@gmail.com>
 <2820412.JxDUeWI2ec@debian64>
 <CACRpkda6nD_nb7D1s7KHX3CxzmAw3qzdEe6m+V+TbaZ5gaZhaA@mail.gmail.com>
 <3524410.JrO1DEFpQ1@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3524410.JrO1DEFpQ1@debian64>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christian Lamparter <chunkeey@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Andy Gross <andy.gross@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 26, 2018 at 11:47 PM, Christian Lamparter
<chunkeey@gmail.com> wrote:
> On Thu, Apr 26, 2018 11:12:21 CEST Linus Walleij wrote:

>> I think I replied in some other mail that I think we need to
>> be backwards compatible and it's not too hard to do
>> both. (Correct me if I'm wrong.)
>
> I think so too, I looked around and found that the nvidia pinctrl was
> doing something similar with of_find_property():
> <https://elixir.bootlin.com/linux/v4.17-rc2/source/drivers/pinctrl/tegra/pinctrl-tegra.c#L652>
> |       has_prop = of_find_property(np, "gpio-ranges", NULL);
>
> However this looks kinda funny, since "has_prob" is declared as a bool
> and of_find_property() returns a pointer to a "struct property"....
> Tell you what: If nobody beats me to it, I'll sent a patch for this after
> the pinctrl-msm's gpio-hog has been dealt with. :)

Yeah the nVidia driver is one of the oldest and also at the time
DT was kind of new. I haven't heard from Stephen for a while
but I bet he will pop up, else check with Laxman, he's got
a good grip on nVidia pinctrl+GPIO as well.

> And as you can probably guess: The License is sold as a yearly subscription
> starting from $150 for a single device. So, these devices became practically
> e-waste since nobody in their right mind would buy a used device and then
> fork over the ~$150 fee per annum.
>
> The MR24 craze is mostly over by now. You can still find a few. However
> some listings are now selling them with OpenWrt/LEDE for ~$40.
>
> And obviously, this cycle will continue on, but now with the old wave1
> 802.11ac gear that gets replaced. In fact this business has spawned
> companies that are actively working on supporting "old" enterprise gear
> via their own OpenWrt/LEDE derivatives.

Haha that is just awesome :D
I hope they salvage a lot of them.

Yours,
Linus Walleij
