From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Sat, 03 Sep 2016 13:31:21 +0200
Message-ID: <87pooljk3a.fsf@belgarion.home>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
 <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <87eg57e54l.fsf@belgarion.home>
 <20160830091805.GL1041@n2100.armlinux.org.uk>
 <87k2eycip0.fsf@belgarion.home>
 <20160830184612.GO1041@n2100.armlinux.org.uk>
 <87fupmc59b.fsf@belgarion.home>
 <20160831084938.GQ1041@n2100.armlinux.org.uk>
 <20160903102549.GK1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160903102549.GK1041@n2100.armlinux.org.uk> (Russell King's
 message of "Sat, 3 Sep 2016 11:25:49 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-pcmcia/>
List-Post: <mailto:linux-pcmcia@lists.infradead.org>
List-Help: <mailto:linux-pcmcia-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=subscribe>
Sender: "linux-pcmcia" <linux-pcmcia-bounces@lists.infradead.org>
Errors-To: linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-pcmcia@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Russell King - ARM Linux <linux@armlinux.org.uk> writes:

> On Wed, Aug 31, 2016 at 09:49:38AM +0100, Russell King - ARM Linux wrote:
>> On Tue, Aug 30, 2016 at 11:32:16PM +0200, Robert Jarzmik wrote:
>> > Russell King - ARM Linux <linux@armlinux.org.uk> writes:
>> > 
>> > > If you can wait a day or two, I'll push a branch out for everything in
>> > > all these multiple series.
>> > Sure, just ping me when you have something.
>> 
>> git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100
>> 
>> should get you something suitable to test.  It's based on 4.7-rc3 plus
>> my fixes branch.
>
> Branch updated, hopefully with everything that we've agreed on so far,
> all the bug fixes, plus a few extra bits...
Good, I'll retest within the weekend.

>> It would be great to have this tested on Lubbock, and get the PCMCIA
>> issues fixed.  Maybe we can look at converting mainstone as well?
>
> ... like converting mainstone and pxaficp_ir on mainstone.
>
> I'm not going to be around for most of the rest of this weekend.
Okay.

I'll repost on Monday for the latest branch test results and your idea about the
irq_get_chip() workaround.

Good week-end.

-- 
Robert
