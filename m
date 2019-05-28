From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v3 1/4] acpi/irq: implement helper to create hierachical
 domains
Date: Tue, 28 May 2019 14:02:47 +0100
Message-ID: <20190528130247.GA25151@redmoon>
References: <20190527112720.2266-1-ard.biesheuvel@linaro.org>
 <20190527112720.2266-2-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190527112720.2266-2-ard.biesheuvel@linaro.org>
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
Cc: Graeme Gregory <graeme.gregory@linaro.org>, linux-gpio@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, Masahisa Kojima <masahisa.kojima@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 01:27:17PM +0200, Ard Biesheuvel wrote:
> ACPI permits arbitrary producer->consumer interrupt links to be
> described in AML, which means a topology such as the following
> is perfectly legal:
> 
>   Device (EXIU) {
>     Name (_HID, "SCX0008")
>     Name (_UID, Zero)
>     Name (_CRS, ResourceTemplate () {
>       ...
>     })
>   }
> 
>   Device (GPIO) {
>     Name (_HID, "SCX0007")
>     Name (_UID, Zero)
>     Name (_CRS, ResourceTemplate () {
>       Memory32Fixed (ReadWrite, SYNQUACER_GPIO_BASE, SYNQUACER_GPIO_SIZE)
>       Interrupt (ResourceConsumer, Edge, ActiveHigh, ExclusiveAndWake, 0, "\\_SB.EXIU") {
>         7,
>       }
>     })
>     ...
>   }
> 
> The EXIU in this example is the external interrupt unit as can be found
> on Socionext SynQuacer based platforms, which converts a block of 32 SPIs
> from arbitrary polarity/trigger into level-high, with a separate set
> of config/mask/unmask/clear controls.
> 
> The existing DT based driver in drivers/irqchip/irq-sni-exiu.c models
> this as a hierarchical domain stacked on top of the GIC's irqdomain.
> Since the GIC is modeled as a DT node as well, obtaining a reference
> to this irqdomain is easily done by going through the parent link.
> 
> On ACPI systems, however, the GIC is not modeled as an object in the
> namespace, and so device objects cannot refer to it directly. So in
> order to obtain the irqdomain reference when driving the EXIU in ACPI
> mode, we need a helper that implicitly grabs the default domain for
> unqualified interrupts as the parent of the hierarchy.

Nit: I do not think they are "unqualified".

ACPI 6.3, table 6-237, Extended Interrupt Descriptor Definition:

"Resource Source: (Optional) If present, the device that uses this
descriptor consumes its resources from the resources produces by the
named device object. If not present, the device consumes its resources
out of a global pool."

Where the global pool I _assume_ is the GSI domain, so it is the default
expected behaviour (for once :))

> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  drivers/acpi/irq.c   | 20 ++++++++++++++++++++
>  include/linux/acpi.h |  7 +++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
> index c3b2222e2129..39824a6bbcd5 100644
> --- a/drivers/acpi/irq.c
> +++ b/drivers/acpi/irq.c
> @@ -295,3 +295,23 @@ void __init acpi_set_irq_model(enum acpi_irq_model_id model,
>  	acpi_irq_model = model;
>  	acpi_gsi_domain_id = fwnode;
>  }
> +
> +/**
> + * acpi_irq_create_hierarchy - Create a hierarchical IRQ domain with the default
> + *                             GSI domain as its parent.

Yes please comment parameters even if it is just a wrapper around
the IRQ domain API.

> +struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
> +					     unsigned int size,
> +					     struct fwnode_handle *fwnode,
> +					     const struct irq_domain_ops *ops,
> +					     void *host_data)
> +{
> +	struct irq_domain *d = irq_find_matching_fwnode(acpi_gsi_domain_id,
> +							DOMAIN_BUS_ANY);
> +
> +	if (!d)
> +		return NULL;
> +
> +	return irq_domain_create_hierarchy(d, flags, size, fwnode, ops,
> +					   host_data);
> +}
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 98440df7fe42..70de4bc30cea 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -23,6 +23,7 @@
>  
>  #include <linux/errno.h>
>  #include <linux/ioport.h>	/* for struct resource */
> +#include <linux/irqdomain.h>
>  #include <linux/resource_ext.h>
>  #include <linux/device.h>
>  #include <linux/property.h>
> @@ -327,6 +328,12 @@ int acpi_isa_irq_to_gsi (unsigned isa_irq, u32 *gsi);
>  void acpi_set_irq_model(enum acpi_irq_model_id model,
>  			struct fwnode_handle *fwnode);
>  
> +struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
> +					     unsigned int size,
> +					     struct fwnode_handle *fwnode,
> +					     const struct irq_domain_ops *ops,
> +					     void *host_data);
> +
>  #ifdef CONFIG_X86_IO_APIC
>  extern int acpi_get_override_irq(u32 gsi, int *trigger, int *polarity);
>  #else

Reviewed-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
