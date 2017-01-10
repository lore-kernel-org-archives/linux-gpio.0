From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Tue, 10 Jan 2017 03:28:20 +0200
Message-ID: <2671694.94z5NEauGX@avalon>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <1923903.Gi7z59W6W3@avalon> <SG2PR06MB1165EBCB06C5D473CBAC2F218A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165EBCB06C5D473CBAC2F218A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Chris,

On Monday 09 Jan 2017 23:53:39 Chris Brandt wrote:
> On Monday, January 09, 2017, Laurent Pinchart wrote:
> > Both the existing RZ/A model and the pinctrl model are in my opinion
> > improvements over the RZ/G and R-Car models. I don't care much about
> > whether pinctrl-single can be used, but we really need hardware
> > architectures that don't require those huge data tables.
> 
> I can definitely agree to that.
> 
> > It's more complex than that. Both the pin-based and group-based models
> > have their pros and cons, and the pinctrl API is some kind of mix that
> > allows both options.
> 
> Here is my general question: Which of these 2 approaches are better?
> 
> A) In the DT, the user ask "enable Ethernet please" and magic happens in
>    the pfc driver.
> 
> B) In the DT, the user looks up the correct pin/function assignments in
>    the SoC Hardware Manual and manually spells out what they need.
> 
> R-Car looks more like A. I've been using a driver that looks more like B.
> 
> For most drivers (USB, MMC, SDHI, etc..,), I'm happy when 'magic happens'
> and I don't really have to open a HW manual at all.
> But, for something like setting up the PFC when someone gets a shiny new
> board, making people actually open a HW manual seems acceptable to me.

>From a user point of view, option A looks better to me. However, it has two 
drawbacks:

- Through deciding what pin groups we make available we create a DT ABI that 
will make it difficult to fix mistakes in case the groups are not fine-grained 
enough.

- The data tables in C code are large, and we end up compiling many of them in 
multi-platform kernel, significantly increasing the kernel size.

I would thus favour option B.

-- 
Regards,

Laurent Pinchart
