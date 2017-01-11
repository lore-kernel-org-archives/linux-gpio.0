From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Wed, 11 Jan 2017 13:22:26 +0200
Message-ID: <7332833.bE664ByKOm@avalon>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <2671694.94z5NEauGX@avalon> <06e9c953-df81-08f1-a817-730301778e06@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <06e9c953-df81-08f1-a817-730301778e06@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Tuesday 10 Jan 2017 23:32:27 jacopo mondi wrote:
> On 10/01/2017 02:28, Laurent Pinchart wrote:
> > On Monday 09 Jan 2017 23:53:39 Chris Brandt wrote:
> >> On Monday, January 09, 2017, Laurent Pinchart wrote:
> >>> Both the existing RZ/A model and the pinctrl model are in my opinion
> >>> improvements over the RZ/G and R-Car models. I don't care much about
> >>> whether pinctrl-single can be used, but we really need hardware
> >>> architectures that don't require those huge data tables.
> >> 
> >> I can definitely agree to that.
> >> 
> >>> It's more complex than that. Both the pin-based and group-based models
> >>> have their pros and cons, and the pinctrl API is some kind of mix that
> >>> allows both options.
> >> 
> >> Here is my general question: Which of these 2 approaches are better?
> >> 
> >> A) In the DT, the user ask "enable Ethernet please" and magic happens in
> >>    the pfc driver.
> >> 
> >> B) In the DT, the user looks up the correct pin/function assignments in
> >>    the SoC Hardware Manual and manually spells out what they need.
> >> 
> >> R-Car looks more like A. I've been using a driver that looks more like B.
> >> 
> >> For most drivers (USB, MMC, SDHI, etc..,), I'm happy when 'magic happens'
> >> and I don't really have to open a HW manual at all.
> >> But, for something like setting up the PFC when someone gets a shiny new
> >> board, making people actually open a HW manual seems acceptable to me.
> > 
> > From a user point of view, option A looks better to me. However, it has
> > two drawbacks:
> > 
> > - Through deciding what pin groups we make available we create a DT ABI
> > that will make it difficult to fix mistakes in case the groups are not
> > fine-grained enough.
> > 
> > - The data tables in C code are large, and we end up compiling many of
> > them in multi-platform kernel, significantly increasing the kernel size.
> > 
> > I would thus favour option B.
> 
> That would be saner, I agree.
> 
> And a much saner way of doing this would be, in my understanding, not
> using the group-based sh-pfc drivers used for R-Car and back it up with
> a pin-based equivalent, where to hook drivers for each specific hardware.

We can't really do that for the existing SoCs as the concept of groups is 
present in the hardware. Not only do we need to select per-pin functions, but 
there are also register bits that perform pin muxing for whole groups. If this 
changes in future generations of the SoCs we then could do away with the data 
tables, but for now we're stuck with them.

> Looks like pinmux-single, yes, but that driver bets on the ability to
> set pin functions and configurations with a write to a single register
> while, at least for RZ/A, the same is scattered among several registers
> (I may be wrong on the single register requirement for pinctrl-single
> though)
> 
> So, I guess what direction to take depends on whether or not we're going
> to see more hardware with a per-pin configuration that would benefit
> from this new rz-pfc driver (it seems so) and if this justify splitting
> sh-pfc in two, a group-based one for R-Car devices (and all devices
> there already) and a new pin-based one.
> 
> Or maybe we can tie pin-based configuration in sh-pfc and it's me not
> seeing how to do that.

-- 
Regards,

Laurent Pinchart
