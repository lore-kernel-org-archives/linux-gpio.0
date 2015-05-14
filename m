From: Feng Kan <fkan@apm.com>
Subject: Re: [PATCH v4 2/3] irqchip: GIC: Add support for irq_{get,set}_irqchip_state
Date: Thu, 14 May 2015 13:14:57 -0700
Message-ID: <CAL85gmD=12u87vDAc601T=ZOgcS-jDo_=LaC5gRAZUHgp_iTbA@mail.gmail.com>
References: <1426676484-21812-1-git-send-email-marc.zyngier@arm.com>
	<1426676484-21812-3-git-send-email-marc.zyngier@arm.com>
	<CAL85gmBrkonMcKdUVGmYx6zT3wSe-e2jPhnL_+Tkf3s4jsAiWg@mail.gmail.com>
	<CACRpkdYffHJEzksc5mg7JZdwTzShGaQofAmbmn65=_V3ot04Rg@mail.gmail.com>
	<CAL85gmC4ovR99wQQYoKs=oo24So80jZ_guxDDFhi-1MXXj0uSw@mail.gmail.com>
	<CACRpkdZkBLrhFpZiYk4fiM3ND+UwnVJhNKs=+rL5iZY4fS7zCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZkBLrhFpZiYk4fiM3ND+UwnVJhNKs=+rL5iZY4fS7zCg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Phong Vo <pvo@apm.com>, Tin Huynh <tnhuynh@apm.com>, Y Vo <yvo@apm.com>, Thomas Gleixner <tglx@linutronix.de>, Toan Le <toanle@apm.com>, Bjorn Andersson <bjorn@kryo.se>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 14, 2015 at 3:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, May 13, 2015 at 5:44 PM, Feng Kan <fkan@apm.com> wrote:
>
>> We are using the gpio driver with gpio_key for power button. The gpio
>> status can only be retrieved from the GIC register when the gpio is
>> acting as a interrupt.
>
> OK I understand so much. SPISR is a status register of the state
> of the IRQ lines of shared peripherals.
>
> But surely the GPIO block has its own status register, so are
> you saying that this register is unreliable?

When the GPIO is used as interrupt, the gpio block does not report the
status anymore. Which leaves us stuck with SPISR.
>
> I can think of a few reasons, like transient IRQs etc but
> what is actually causing this?

I won't say the obvious.
>
> Techically the GIC would normally be higher up the food
> chain, i.e. one IRQ on the GIC is cascaded to sub-IRQs on
> the GPIO chip by virtue of its own struct irq_chip and
> irqdomain. The exception is typically only systems where
> the GPIO block is fused with the IRQ controller so that each
> GPIO line has its own unique IRQ line on the primary,
> top-level interrupt controller.
>
> Which GPIO driver is this? Is it upstream?
Yes, it is upstream. It is the xgene slimpro gpio driver. I am starting to
think that we ought to switch to use some gpio poll driver rather than
using gpio-key.
>
> Yours,
> Linus Walleij
