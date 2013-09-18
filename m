From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: PCF857x and 16-bit GPIO expanders
Date: Wed, 18 Sep 2013 13:16:27 +0200
Message-ID: <CACRpkdYn8yaTyFJMaC3vK4kGrQsaZpAX=pyn5y33ers7QhQ_pg@mail.gmail.com>
References: <20130917190732.GD15645@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <20130917190732.GD15645@radagast>
Sender: linux-omap-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, George Cherian <george.cherian@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 17, 2013 at 9:07 PM, Felipe Balbi <balbi@ti.com> wrote:

> has anyone ever successfully using gpio-pcf857x.c driver with 16-bit
> gpio expanders ? We're having some issues here where toggling the last
> gpio pin (gpio 15) on a PCF8575 device causes platform to hang and I
> can't come up with any explanation of why would it hang...

Bouncing the question to George, Laurent and Kuninori...

Yours,
Linus Walleij
