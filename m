From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Mon, 9 Jan 2017 23:53:39 +0000
Message-ID: <SG2PR06MB1165EBCB06C5D473CBAC2F218A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <11976735.hueksWqZOA@avalon>
 <SG2PR06MB1165EE67EA2969815758A3038A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <1923903.Gi7z59W6W3@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1923903.Gi7z59W6W3@avalon>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Laurent,

On Monday, January 09, 2017, Laurent Pinchart wrote:
> Both the existing RZ/A model and the pinctrl model are in my opinion
> improvements over the RZ/G and R-Car models. I don't care much about
> whether pinctrl-single can be used, but we really need hardware
> architectures that don't require those huge data tables.

I can definitely agree to that.


> It's more complex than that. Both the pin-based and group-based models
> have their pros and cons, and the pinctrl API is some kind of mix that
> allows both options.

Here is my general question: Which of these 2 approaches are better?

A) In the DT, the user ask "enable Ethernet please" and magic happens in
   the pfc driver.

B) In the DT, the user looks up the correct pin/function assignments in
   the SoC Hardware Manual and manually spells out what they need.

R-Car looks more like A. I've been using a driver that looks more like B.

For most drivers (USB, MMC, SDHI, etc..,), I'm happy when 'magic happens'
and I don't really have to open a HW manual at all.
But, for something like setting up the PFC when someone gets a shiny new
board, making people actually open a HW manual seems acceptable to me.



Chris
