From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/9] gpiolib: Add GPIO name support
Date: Tue, 28 Jul 2015 16:16:19 +0200
Message-ID: <20150728141619.GP28535@localhost>
References: <1437125570-28623-1-git-send-email-mpa@pengutronix.de>
 <CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdY=SLGyrcvWT355b3Z+pBwb9gPzVcieD8mOn=zdyJ1mFw@mail.gmail.com>
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
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Grant Likely <grant.likely@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Sascha Hauer <kernel@pengutronix.de>, Markus Pargmann <mpa@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2015 at 10:05:52PM +0200, Linus Walleij wrote:
> On Fri, Jul 17, 2015 at 11:32 AM, Markus Pargmann <mpa@pengutronix.de> wrote:
> 
> > This is a proposal to add GPIO names to the kernel based on devicetree
> > descriptions.
> >
> > This series adds GPIO name support. Until now it is only possible to use names
> > for already requested GPIOs (for example what they are used for). It is not
> > possible to identify GPIOs by a name although most of them have a name for
> > example in the schematics of the board. This makes it difficult to identify
> > a specific GPIO from userspace.
> >
> > As the GPIO name information is a hardware description this series uses the
> > devicetree bindings introduced by the GPIO hogging mechanism, specifically
> > 'line-name', to identify GPIOs. The sysfs 'export' file is changed to accept
> > names as fallback. The gpio numbers still have a higher priority to ensure
> > backwards compatibility.
> >
> > Exported GPIOs are still using their number as directory name (gpio<ID>). But the
> > directories now contain a 'name' file which is '(null)' for non-existent names
> > and the name otherwise.
> >
> > This series can be used to have an easy name mapping for udev with a quite
> > simple rule similar to this:
> >         SUBSYSTEM=="gpio", KERNEL=="gpio*", ATTR{name}!="(null)", ACTION=="add", \
> >         PROGRAM+="/bin/sh -c 'mkdir -p /dev/gpios; rm -f /dev/gpios/$attr{name}; ln -s /sys%p/ /dev/gpios/$attr{name}"
> > With this rule udev adds a link for each exported GPIO with a name into
> > /dev/gpios/. This way it is not necessary to know the number of a GPIO to use
> > it.
> 
> I must say I like this series.
> 
> Because it makes the GPIO sysfs ABI *less* insane. Especially
> I like the patch that makes a distinction between "label" (use)
> and "name" (the name of the actual line). That illustrates clearly
> that this is thought-through.
> 
> However I still have some doubts as it will expand the sysfs ABI,
> and we have discussed a char device for GPIO chips as a better
> alternative, for example since these can do get/set multiple GPIOs
> with a single context switch (ioctl), whereas sysfs is "one value per file"
> and would be able to expose some flags better.

I'm also reluctant to band-aiding the sysfs interface with more ABI that
we need to maintain forever. Making it easier to use also reduces the
incentives to come up with a saner interface.

As I mentioned in a comment to patch 6/9, this series introduces an
incompatibility with current DT since it no longer allows two hogs to
use the same name, while the current hog implementation is documented to
fall back to using the (not necessarily unique) node name when a
line-name property isn't specified.

Even though this looks like it could be worked around, it's an example
of the kind of issues we risk running into if we keep on incrementally
patching this interface.

That said, this is a step along the lines that we have discussed in the
past. Adding pin functions (line names) to generic pin nodes in DT makes
sense, but we need to think through the details first. For example:

 - Should we allow duplicate pin functions (line names)? We need to
   consider not just on-chip controllers, but also hot-pluggable
   controllers and device-tree overlays.

 - Should we allow initial configurations to be specified and still
   allow (some) pins to be requested later ("soft" hogging)?

 - Should we specify pin directionality? I've suggested elsewhere that
   adding such limitations (e.g. as a mask) may make sense in cases were
   changing pin direction is known to cause damage.

 - What would a new gpio interface look like?

Johan 
