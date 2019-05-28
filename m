From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 0/4] synquacer: implement ACPI gpio/interrupt support
Date: Tue, 28 May 2019 14:00:01 +0100
Message-ID: <1960f9d6-726a-b73e-f289-8960011ac048@arm.com>
References: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
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
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Graeme Gregory <graeme.gregory@linaro.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, Masahisa Kojima <masahisa.kojima@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Ard,

On 27/05/2019 12:27, Ard Biesheuvel wrote:
> Wire up the existing GPIO and interrupt controller drivers to the ACPI
> subsystem so they can be used on ACPI systems for ACPI event (power
> button, hardware error notification etc)
> 
> Changes since v2:
> - use helper to create hierarchical IRQ domains under ACPI instead of exposing
>   the GSI domain's irqdomain pointer directly (#1)
> - use has_acpi_companion() instead of ACPI_COMPANION() where possible (#4)
> - add Mika's ack to #4
> 
> Changes since v1:
> - Describe the EXIU controller as a separate device, which is a more accurate
>   depiction of reality, and untangles the code a bit as well. Note that this
>   requires the GPIO AML device to describe the EXIU interrupts explicitly.
> - Add a patch to obtain the ACPI GSI irqdomain. The EXIU driver needs this
>   to obtain the default parent domain, since the GIC is not modeled as an
>   ACPI object in the namespace, and so the parent<->child link cannot be
>   expressed in AML.
> - Drop the Kconfig symbol for the GPIO controller. Just include the ACPI part
>   when CONFIG_ACPI is defined.

I'm quite happy with the way this is looking now. Once v4 is out, and in
the absence of any further objection, I'll queue it for 5.3.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
