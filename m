From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 0/2] USB: serial: gpio line-name fix and FT232R CBUS gpio
 support
Date: Tue, 13 Nov 2018 10:33:53 +0100
Message-ID: <20181113093353.GK13311@localhost>
References: <20180930122703.7115-1-johan@kernel.org>
 <CACRpkdaG-S-6LfCKgxz4jdbD=kRO7q7k_8FAHqsSNBPdC07iDA@mail.gmail.com>
 <20181005134014.GH3774@localhost>
 <CACRpkdbxShE3XEXNaKoFKWgAUVGUHU8rf0KaYV44coucu4=cRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbxShE3XEXNaKoFKWgAUVGUHU8rf0KaYV44coucu4=cRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, pados@pados.hu, Loic Poulain <loic.poulain@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

Sorry about the late reply, this one got buried in the mailbox during
conference travels.

On Wed, Oct 10, 2018 at 11:36:28AM +0200, Linus Walleij wrote:
> On Fri, Oct 5, 2018 at 3:40 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Oct 01, 2018 at 11:43:55AM +0200, Linus Walleij wrote:
> 
> > > The idea is to make it possible for userspace to look up a GPIO
> > > on a chip by name, so if the gpiochip has a unique name,
> > > and the line name is unique on that chip it should be good
> > > enough.
> >
> > I haven't really had time do dig into this again, but is this also an
> > issue with the chardev interface?
> >
> > I thought this was one of the things
> > you wanted to get right with the new interface, so hopefully that's
> > already taken care of.
> 
> It is always possible to use /dev/gpiochipN and offet M on
> that gpiochip to pick a unique line. That is a unique offset
> on a unique chip. The gpiochip also has a "label" which may
> be something user-readable such as part numer, but the unique
> string is its name such as "gpiochip0".

Right.

> For symbolic look-up though, like a file has to have a unique
> path, the name of the line should be unique.

Sure, but there's no way to guarantee that (consider pluggable devices)
unless you encode the topology in the name.

> It is allowed to have unnamed lines though, so it is only a
> hint. While I would like all drivers to uniquely name their
> lines in DT or ACPI, or using the .names array in the gpio_chip
> struct, it cannot be enforced because of legacy support,
> so many old systems had no names specified, and
> the DT and ACPI properties to name lines were introduced
> after the chardev actually.

Oh, that's right.

> All I enforce is that if names are added, they should be
> unique.

Which effectively means you cannot have a driver provide default line
names, as that would cause conflicts if there are ever more than one
such device in a system (be it i2c or pluggable USB).

> What we *could* do is conjure a unique name per line if
> the hardware description doesn't provice one... like
> "line0", "line1", "line2"... "lineN" on the chip.
> 
> Should we add a patch like that? The only side effect
> I can see if that maybe the footprint increase is not so
> nice.
> 
> I had it in mind but it slipped of my radar. It would make
> all lines always have unique names.

No, I don't think that's needed or desirable.

But take the concrete use case at hand; a gpio controller connected over
USB. These FTDI devices exposes four gpios on a set of pins that differ
from model to model. On some devices these lines are available on a set
of pins named CBUS0..CBUS3, on others a different set of pins such as
ACBUS5, ACBUS6, ACBUS8 and ACBUS9 are used.

Exporting which line is exposed on which pin obviously has some worth,
but this is currently not possible due to the requirement that line
names must be unique.

Having an interface that allows you to look up say ACBUS6 given a
particular gpiochip would also be useful to have (user space knows which
USB device it is interested in so finding the gpiochip is straight
forward).

Perhaps the chardev interface could return a set of matched gpiochips if
a particular line name is found on several chips for user space to
iterate over.

Essentially what I'm going for is to have the line names only be
required to be unique per chip, and let user space deal with any
collisions.

The flat line name space really only works for something like DT, and
then only if you actually have access to the DTS (I'm assuming there's
no uniqueness requirement in the binding docs?).

But you could still run into trouble if an i2c driver provides default
names, or if you use anything pluggable.

> > If the flat name space is only an issue with the legacy interface we
> > might get away with simply not using the line names in sysfs when a new
> > chip flag is set (unless we can resue .can_sleep, but there seems to be
> > some i2c devices already using line names).
> 
> Hm. So you mean it is bad that the exporting GPIOs in the old
> sysfs brings out the line name in sysfs if the line is named.

Right, this specifically prevents using line names with pluggable
devices.

> I just want the sysfs to die, but yeah what you say makes
> sense. I don't know if it's such a big issue, my focus has been
> on making the chardev more appetizing and the sysfs
> uncomfortably oldschool amongst users. This would make it
> even more uncomfortable.
> 
> But I don't know if the old sysfs users actually use the line
> names much?

The problem is that the line names are used in sysfs as device names
(file names) instead of "gpioN" whenever a line name has been specified.
So on systems with line names defined, we would definitely risk
regressions if we simply stopped exporting gpios using those names.

Doing so for a subset of devices (e.g. i2c, or anything connected over a
slow bus) may still be considered though. That would also deal with the
USB case.

But again, I'm not sure if we'd run into other problems with the chardev
interface (e.g. what happens if I lookup "CBUS3" and there are more than
one match?).

Thanks,
Johan
