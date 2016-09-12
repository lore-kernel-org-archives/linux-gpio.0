From: Phidias Chiang <phidias.chiang@canonical.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Mon, 12 Sep 2016 21:04:44 +0800
Message-ID: <20160912130444.GB2411@ktx>
References: <20160818135813.GJ30827@lahna.fi.intel.com>
 <20160908101303.GA22716@ktx>
 <20160908102402.GC15313@lahna.fi.intel.com>
 <20160908162843.GB22716@ktx>
 <20160909061834.GG15313@lahna.fi.intel.com>
 <20160909082358.GA23895@ktx>
 <20160909085832.GK15313@lahna.fi.intel.com>
 <20160911080506.GO15313@lahna.fi.intel.com>
 <20160912065656.GA2411@ktx>
 <20160912090401.GB1811@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160912090401.GB1811@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Anisse Astier <anisse@astier.eu>, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 12, 2016 at 12:04:01PM +0300, Mika Westerberg wrote:
> 
> OK, I see what is going on now. When I changed handle_simple_irq to
> handle_bad_irq, the IRQ core in __irq_do_set_handler() thinks the
> handler is uninstalled and masks the line.
> 
> If you change handle_bad_irq to handle_simple_irq, in call to
> gpiochip_irqchip_add(), does it work then?

Yes it does :), thank you for the support!
