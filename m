From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Wed, 31 Aug 2016 09:49:38 +0100
Message-ID: <20160831084938.GQ1041@n2100.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
 <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <87eg57e54l.fsf@belgarion.home>
 <20160830091805.GL1041@n2100.armlinux.org.uk>
 <87k2eycip0.fsf@belgarion.home>
 <20160830184612.GO1041@n2100.armlinux.org.uk>
 <87fupmc59b.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <87fupmc59b.fsf@belgarion.home>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-pcmcia/>
List-Post: <mailto:linux-pcmcia@lists.infradead.org>
List-Help: <mailto:linux-pcmcia-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=subscribe>
Sender: "linux-pcmcia" <linux-pcmcia-bounces@lists.infradead.org>
Errors-To: linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-pcmcia@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>, linux-arm-kernel@lists.infradead.org, Daniel Mack <daniel@zonque.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 30, 2016 at 11:32:16PM +0200, Robert Jarzmik wrote:
> Russell King - ARM Linux <linux@armlinux.org.uk> writes:
> 
> > If you can wait a day or two, I'll push a branch out for everything in
> > all these multiple series.
> Sure, just ping me when you have something.

git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100

should get you something suitable to test.  It's based on 4.7-rc3 plus
my fixes branch.

It would be great to have this tested on Lubbock, and get the PCMCIA
issues fixed.  Maybe we can look at converting mainstone as well?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
