From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC PATCH 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Wed, 15 Mar 2017 18:12:53 +0100
Message-ID: <5561804.yNijhH7yqI@phil>
References: <20170313183813.3582-1-john@metanate.com>
 <2549921.4Nq1JGygY8@phil> <20170315165900.63f32371.john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170315165900.63f32371.john@metanate.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Keeping <john@metanate.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Am Mittwoch, 15. M=E4rz 2017, 16:59:00 CET schrieb John Keeping:
> On Wed, 15 Mar 2017 17:41:21 +0100, Heiko Stuebner wrote:
> > Am Mittwoch, 15. M=E4rz 2017, 17:28:56 CET schrieb Heiko Stuebner:
> > > Am Montag, 13. M=E4rz 2017, 18:38:11 CET schrieb John Keeping:
> > > > This lock is used from rockchip_irq_set_type() which is part of the
> > > > irq_chip implementation and thus must use raw_spinlock_t as documen=
ted
> > > > in Documentation/gpio/driver.txt.
> > > > =

> > > > Signed-off-by: John Keeping <john@metanate.com>
> > > =

> > > Looks good
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > =

> > I have to take that back.
> > This leaves the spin_lock in the schmitt trigger unconverted and produc=
es
> > compile issues.
> > =

> > So it either needs to be converted or removed - I guess it should be
> > removed.
> Yes, it looks like it should be removed - the patches adding that hadn't
> been applied when I sent this out!
> =

> I'll rebase and add the schmitt trigger change to patch 1 in a day or
> two, after giving a bit more time for reviews.

I don't think you need to wait overly long. Linus seems happy, I'm happy an=
d =

the schmitt issue in the open might prevent people from taking a closer loo=
k.


Heiko
