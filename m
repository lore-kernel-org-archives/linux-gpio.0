From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/4] gpio: mb86s7x: enable ACPI support
Date: Tue, 28 May 2019 10:34:01 +0200
Message-ID: <CACRpkdZt-AosWLPcwDQqi_2i4adDk-ioT3g3aTicyXiZpQOGGg@mail.gmail.com>
References: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
 <20190527112720.2266-5-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190527112720.2266-5-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Graeme Gregory <graeme.gregory@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Masahisa Kojima <masahisa.kojima@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 1:27 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> Make the mb86s7x GPIO block discoverable via ACPI. In addition, add
> support for ACPI GPIO interrupts routed via platform interrupts, by
> wiring the two together via the to_irq() gpiochip callback.
>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume you want to merge this through the IRQ tree or the ACPI
tree, so go ahead.

If you want me to queue the whole thing in the GPIO tree just tell
me (once we have the ACKs in place).

Yours,
Linus Walleij
