From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [RFC PATCH 3/3] gpio: mb86s70: enable ACPI and irqchip support
Date: Thu, 25 Apr 2019 17:27:26 +0300
Message-ID: <20190425142726.GA2583@lahna.fi.intel.com>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-4-ard.biesheuvel@linaro.org>
 <CACRpkdacwYder5e0ik2T32heSBQhKvmbem8XMpUF0iShsw3D3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdacwYder5e0ik2T32heSBQhKvmbem8XMpUF0iShsw3D3w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Graeme Gregory <graeme.gregory@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masahisa Kojima <masahisa.kojima@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 25, 2019 at 03:23:53PM +0200, Linus Walleij wrote:
> > -       return ret;
> > +       if (mb86s70_gpio_have_acpi(pdev))
> > +               acpi_gpiochip_request_interrupts(&gchip->gc);
> > +
> > +       return 0;
> 
> I guess this is right...
> 
> >         struct mb86s70_gpio_chip *gchip = platform_get_drvdata(pdev);
> >
> > +       if (gchip->gc.irq.domain) {
> > +               acpi_gpiochip_free_interrupts(&gchip->gc);
> > +               irq_domain_remove(gchip->gc.irq.domain);
> > +       }
> 
> Mika can possibly comment on the right way to do ACPI bring-up
> and take-down.

Only comment I have is that normally you don't need to call
acpi_gpiochip_request_interrupts() and acpi_gpiochip_free_interrupts()
in GPIO chip drivers itself. The core should take care of this if the
device ACPI description has an _AEI method.
