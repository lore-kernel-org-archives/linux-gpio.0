From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2] gpio: lib-sysfs: Add 'wakeup' attribute
Date: Mon, 27 Oct 2014 10:55:50 -0700
Message-ID: <7f23a896baa04960a1702335b3df0432@BL2FFO11FD060.protection.gbl>
References: <1413244255-3880-1-git-send-email-soren.brinkmann@xilinx.com>
 <CACRpkdYh3bZLodeNYubu_WQ-O=5My0Jt=b3g2GT3Mvy2XZMrLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYh3bZLodeNYubu_WQ-O=5My0Jt=b3g2GT3Mvy2XZMrLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, 2014-10-27 at 05:52PM +0100, Linus Walleij wrote:
> On Tue, Oct 14, 2014 at 1:50 AM, Soren Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
>=20
> > Add an attribute 'wakeup' to the GPIO sysfs interface which allows
> > marking/unmarking a GPIO as wake IRQ.
> > The file 'wakeup' is created in each exported GPIOs directory, if a=
n IRQ
> > is associated with that GPIO and the irqchip implements set_wake().
> > Writing 'enabled' to that file will enable wake for that GPIO, whil=
e
> > writing 'disabled' will disable wake.
> > Reading that file will return either 'disabled' or 'enabled' depeni=
ng on
> > the currently set flag for the GPIO's IRQ.
> >
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> > v2:
> >  - fix error path to unlock mutex before return
>=20
> As you're adding an ABI, you should be patching
> Documentation/ABI/testing/sysfs-gpio and
> Documentation/gpio/sysfs.txt in this patch.
>=20
> While I *HATE* the idea of adding IRQ support to userspace
> for GPIOs, this "just" adds the wakeup capacity, so I guess I'm
> OK with it.
>=20
> Provided you add it to the ABI doc...

Thanks. I will add some documentation and sent a new patch.

	Thanks,
	S=C3=B6ren
