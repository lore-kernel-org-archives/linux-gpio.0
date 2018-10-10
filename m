From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] USB: serial: gpio line-name fix and FT232R CBUS gpio support
Date: Wed, 10 Oct 2018 11:36:28 +0200
Message-ID: <CACRpkdbxShE3XEXNaKoFKWgAUVGUHU8rf0KaYV44coucu4=cRA@mail.gmail.com>
References: <20180930122703.7115-1-johan@kernel.org> <CACRpkdaG-S-6LfCKgxz4jdbD=kRO7q7k_8FAHqsSNBPdC07iDA@mail.gmail.com>
 <20181005134014.GH3774@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005134014.GH3774@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, pados@pados.hu, Loic Poulain <loic.poulain@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 5, 2018 at 3:40 PM Johan Hovold <johan@kernel.org> wrote:
> On Mon, Oct 01, 2018 at 11:43:55AM +0200, Linus Walleij wrote:

> > The idea is to make it possible for userspace to look up a GPIO
> > on a chip by name, so if the gpiochip has a unique name,
> > and the line name is unique on that chip it should be good
> > enough.
>
> I haven't really had time do dig into this again, but is this also an
> issue with the chardev interface?
>
> I thought this was one of the things
> you wanted to get right with the new interface, so hopefully that's
> already taken care of.

It is always possible to use /dev/gpiochipN and offet M on
that gpiochip to pick a unique line. That is a unique offset
on a unique chip. The gpiochip also has a "label" which may
be something user-readable such as part numer, but the unique
string is its name such as "gpiochip0".

For symbolic look-up though, like a file has to have a unique
path, the name of the line should be unique.

It is allowed to have unnamed lines though, so it is only a
hint. While I would like all drivers to uniquely name their
lines in DT or ACPI, or using the .names array in the gpio_chip
struct, it cannot be enforced because of legacy support,
so many old systems had no names specified, and
the DT and ACPI properties to name lines were introduced
after the chardev actually.

All I enforce is that if names are added, they should be
unique.

What we *could* do is conjure a unique name per line if
the hardware description doesn't provice one... like
"line0", "line1", "line2"... "lineN" on the chip.

Should we add a patch like that? The only side effect
I can see if that maybe the footprint increase is not so
nice.

I had it in mind but it slipped of my radar. It would make
all lines always have unique names.

> If the flat name space is only an issue with the legacy interface we
> might get away with simply not using the line names in sysfs when a new
> chip flag is set (unless we can resue .can_sleep, but there seems to be
> some i2c devices already using line names).

Hm. So you mean it is bad that the exporting GPIOs in the old
sysfs brings out the line name in sysfs if the line is named.

I just want the sysfs to die, but yeah what you say makes
sense. I don't know if it's such a big issue, my focus has been
on making the chardev more appetizing and the sysfs
uncomfortably oldschool amongst users. This would make it
even more uncomfortable.

But I don't know if the old sysfs users actually use the line
names much?

Yours,
Linus Walleij
