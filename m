From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 18/33] pcmcia: sa1100: provide generic CF support
Date: Wed, 14 Sep 2016 10:06:02 +0100
Message-ID: <20160914090602.GB1041@n2100.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
 <E1beJl3-0000nS-Nw@rmk-PC.armlinux.org.uk>
 <CACRpkda7qHx4JVdVv+q3=twTup9rDD2ke8K-tSH9CkhZMQqemg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:51993 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755890AbcINJGP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Sep 2016 05:06:15 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkda7qHx4JVdVv+q3=twTup9rDD2ke8K-tSH9CkhZMQqemg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Wed, Sep 14, 2016 at 10:52:39AM +0200, Linus Walleij wrote:
> On Mon, Aug 29, 2016 at 12:25 PM, Russell King
> <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Provide generic non-voltage sensing socket support for StrongARM
> > platforms using the gpiolib and regulator subsystems to obtain the
> > resources to control the socket.
> >
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> (...)
> 
> > +static int sa11x0_drv_pcmcia_probe(struct platform_device *pdev)
> > +{
> > +       struct soc_pcmcia_socket *skt;
> > +       struct device *dev = &pdev->dev;
> > +
> > +       if (dev->id == -1)
> > +               return sa11x0_drv_pcmcia_legacy_probe(pdev);
> 
> There is a typo there, it should be pdev->id rather than dev->id.
> 
> After fixing this, my legacy h3600 PCMCIA started probing again.

Thanks, I've included a change there, should be part of the branch by
the time you get this email - sa1100 head should be 9ad0f8181616.  If
not, it's probably still being pushed out over my slow 'net link.

> (It revealed another bug in fetching GPIOs but it is an orthogobal
> problem altogether, looking into it.)

If you're referring to the generic sa1100 pcmcia code, there's a fix
for that already in my branch.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
