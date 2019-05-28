From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/4] acpi/irq: implement helper to create hierachical
 domains
Date: Tue, 28 May 2019 13:07:28 +0300
Message-ID: <20190528100728.GV2781@lahna.fi.intel.com>
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Graeme Gregory <graeme.gregory@linaro.org>, linux-gpio@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, Masahisa Kojima <masahisa.kojima@linaro.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 27, 2019 at 01:27:17PM +0200, Ard Biesheuvel wrote:
> +
> +/**
> + * acpi_irq_create_hierarchy - Create a hierarchical IRQ domain with the default
> + *                             GSI domain as its parent.

Please document the arguments as well.

> + */
> +struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
> +					     unsigned int size,
> +					     struct fwnode_handle *fwnode,
> +					     const struct irq_domain_ops *ops,
> +					     void *host_data)

Otherwise looks good to me.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
