From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: unexpected side effect of "gpiolib: override irq_enable/disable"
Date: Thu, 13 Sep 2018 11:27:14 +0200
Message-ID: <CACRpkdaDgWckvtwik4S8WRBOA-DvOobjAPBM2_6SN4U5gw+Omg@mail.gmail.com>
References: <20180912145829.hzklqndjasac2ap4@M43218.corp.atmel.com>
 <f64fcb6a-172f-45e8-af8f-f1e7bae3b4d8@xs4all.nl>
 <20180913074742.7cdvfiosb3nyc4ui@M43218.corp.atmel.com>
 <a6ab8cfd-f245-5607-f720-8e5b607e7136@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a6ab8cfd-f245-5607-f720-8e5b607e7136@xs4all.nl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Hans Verkuil <hans.verkuil@cisco.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 13, 2018 at 11:07 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> > I am not sure which solution is the best. Of course I prefer this one as
> > I don't have to modify the pinctrl-at91 driver but if I have to modify
> > it to not share the same irq_chip structure, I'll handle it. Just let me
> > know.
(...)
> One concern I have with the approach taken in this driver is that while placing
> the hooks works fine (with this patch), but when the gpiochip that contains
> the old callbacks for this irqchip is removed, the hooks are also removed for
> all gpiochips using this irqchip. I don't think there is anything I can do
> about that without hacking struct irq_chip.
>
> So from that perspective it's better to have separate irq_chip structs. But
> if there are (a lot?) more drivers doing this, than I need to look for a
> better solution.

I think it's something like that before it was an OK practice to have
the same irqchip for multiple GPIO chips, but after this patch it
becomes a bad practice.

I do not think it is a big problem. Very few systems would even
consider randomly unloading their gpiochips, they are mostly
vital infrastructure, and we don't go building complex solutions
around theoretical problems.

I think what we should do is apply this fix, then annotate the
drivers that use the same irqchip with multiple gpiochips with
some
FIXME: this is bad practice
comments.

Yours,
Linus Walleij
