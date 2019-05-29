From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v4 4/4] gpio: mb86s7x: enable ACPI support
Date: Wed, 29 May 2019 10:39:02 +0100
Message-ID: <75fd4172-8514-ed8b-7554-fa8818fa5fae@arm.com>
References: <20190528133647.3362-1-ard.biesheuvel@linaro.org>
 <20190528133647.3362-5-ard.biesheuvel@linaro.org>
 <20190529073129.GP2781@lahna.fi.intel.com>
 <CAKv+Gu_BJO9AYDicyd4hC7uSWP47ac12wPzi4kgCETwjGZQZOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAKv+Gu_BJO9AYDicyd4hC7uSWP47ac12wPzi4kgCETwjGZQZOA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Graeme Gregory <graeme.gregory@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Masahisa Kojima <masahisa.kojima@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 29/05/2019 08:38, Ard Biesheuvel wrote:
> On Wed, 29 May 2019 at 09:31, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>>
>> On Tue, May 28, 2019 at 03:36:47PM +0200, Ard Biesheuvel wrote:
>>> Make the mb86s7x GPIO block discoverable via ACPI. In addition, add
>>> support for ACPI GPIO interrupts routed via platform interrupts, by
>>> wiring the two together via the to_irq() gpiochip callback.
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>
>> Hmm, I thought I reviewed this already? Well anyway,
>>
>> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Yes, you did. Apologies.
> 
> Marc, can you still incorporate this? Or is it too late?

Not a problem, I'll add it.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
