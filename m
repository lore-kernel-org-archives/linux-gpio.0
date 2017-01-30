From: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC 0/5] Renesas RZ series pinctrl driver
Date: Mon, 30 Jan 2017 07:53:56 -0800
Message-ID: <20170130155356.GD7399@atomide.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [170130 05:53]:
> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> 
> >    after having discussed in great detail the RZ series per-pin PFC hardware
> > peculiarities, this is a proposal for a possible pin-based pin controller
> > driver for SoC devices of Renesas RZ family.
> >
> > This RFC series adds a minimal driver infrastructure which supports pin
> > multiplexing via explicit per-pin settings performed in device tree sources.
> 
> I think this is what Laurent had in mind when he said something about
> that he should have taken the per-pin approach from day 1.
> 
> I would especially like to see Laurent's review and ACK on this series
> for that reason so we don't create something less than what he is
> expecting for the future of Renesas pin control.
> 
> The series as such seems fine and is reusing Tony's work to generalize
> pin controllers putting functions and groups into the device tree in a nice
> way, which makes it relevant for him to have a look as well, if he has
> time.

Well I don't have the series in my inbox, but browsing through
the patchwork seems OK. The things to check would be:

1. Do you guys really need RZ_PIN_DESC? Just let pinctrl
   framework generate the names, then do some simple user
   space tool that decodes the debugfs output. If you really
   need names, allow the consumer to set the name like we do
   for GPIOs and interrupts when requesting the resource.

2. Make sure you're using hardware offsets for any indexing
   to avoid adding artificial mapping tables between the driver
   and the the dts file. Many times new features are enabled
   between SoC revisions and a numbered index gets out of sync
   and needs constant patching just like we have for interrupt
   numbers earlier.. I don't think that's an issue with this
   series, but please check one more time for easy maintenance :)

Regards,

Tony
