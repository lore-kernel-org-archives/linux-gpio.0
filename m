From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC RESEND] GPIO: gpio-generic: Add DT support
Date: Fri, 16 Aug 2013 14:29:32 +0200
Message-ID: <CACRpkday8gXwQkYCB3dj0FXskhtFZHE7g9yWkk9E+p2DhzUa9Q@mail.gmail.com>
References: <1375183115-30237-1-git-send-email-shc_work@mail.ru>
	<20130730162241.GA13634@quad.lixom.net>
	<51F7FEE5.1010608@wwwdotorg.org>
	<20130731155608.GR29859@e106331-lin.cambridge.arm.com>
	<1375786850.12043.22.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:41466 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149Ab3HPM3c convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 08:29:32 -0400
Received: by mail-oa0-f53.google.com with SMTP id k18so2196043oag.12
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 05:29:32 -0700 (PDT)
In-Reply-To: <1375786850.12043.22.camel@hornet>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>

Here are my =800.01 for this discussion...

On Tue, Aug 6, 2013 at 1:00 PM, Pawel Moll <pawel.moll@arm.com> wrote:
> On Wed, 2013-07-31 at 16:56 +0100, Mark Rutland wrote:
>> > Ah, I guess the question more: Do we want generic bindings that de=
scribe
>> > the low-level details of the HW in a completely generic fashion so=
 that
>> > new HW can be supported with zero kernel changes, or do we want a =
simple
>> > driver with a lookup table that maps from compatible value to the =
HW
>> > configuration? One of the potential benefits of DT is to be able t=
o
>> > support new HW without code changes, although perhaps that's more
>> > typically considered in the context of new boards rather than new =
IP
>> > blocks or SoCs.
>
> ... or FPGAs that can be synthesized with random collection of standa=
rd
> IP blocks. With Xilinx's Zynq and Altera's SOCFPGA this is getting
> simpler and simpler...

I think the stance should be similar as with pinctrl-single:
we can have such a driver if and only if the hardware:

- Does not really have a fixes, etched in stone, datasheet.

- Flixes and flexes and reconfigures at the wave of a HW
  engineering wand

- Instead of datasheets the HW engineers provide some
  magic markup that you need to process to figure out how
  to hit the bits correctly.

> This is one of the important decisions we may have to make going
> forward... Do we only accept bindings for "real" blocks of IP? (and h=
ow
> we define "real"?) If so, why does the "simple-bus"?

Yeah how do you define "real" ... I think we all hearda movie quote
righ there. With the advent of virtual prototyping
in fast models of SoCs and FPGAs, we're not really dealing with real
silicon.

Plato in ~400 BC regarded our ideas as the highest form of reality
as illustrated in the famous allegory of the cave:
http://en.wikipedia.org/wiki/Allegory_of_the_Cave
(This is called platonism and found in Gnosticism and popular
culture references all over the place.)

With a simple DT representation we represent the idea of
a certain simple GPIO controller, whereas in reality it will have
flaws, and those will be discovered when adding ever more
usecases and power management and other things that hit
the deep silicon structures of the projection of this idea into
silicon reality.

So I think this thing should be implemented, but the next step
is to be guarded - when people want to add "quirks" to this
driver it cannot be called "simple" anymore, and a real driver
with full knowledge of the hardware need to be created in its
place at this point, so we should require that any DTS(I)
using this "simple" driver *also* define a unique compatible
string for the platform, such that a newer kernel may instantiate
a more HW-specific driver for this one GPIO and disregard any
older properties for the "simple" controller.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
