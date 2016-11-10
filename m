From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 1/6] drivers/platform/x86/p2sb: New Primary to
 Sideband bridge support driver for Intel SOC's
Date: Thu, 10 Nov 2016 18:07:16 +0200
Message-ID: <1478794036.5295.130.camel@linux.intel.com>
References: <1478768430-13422-1-git-send-email-jui.nee.tan@intel.com>
         <1478768430-13422-2-git-send-email-jui.nee.tan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:58815 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933663AbcKJQHZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Nov 2016 11:07:25 -0500
In-Reply-To: <1478768430-13422-2-git-send-email-jui.nee.tan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, dvhart@infradead.org, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, lee.jones@linaro.org, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com, yunying.sun@intel.com

On Thu, 2016-11-10 at 17:00 +0800, Tan Jui Nee wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> There is already one and at least one more user coming which
> require an access to Primary to Sideband bridge (P2SB) in order
> to get IO or MMIO bar hidden by BIOS.
> Create a driver to access P2SB for x86 devices.
> 
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


> +int p2sb_bar(struct pci_dev *pdev, unsigned int devfn,
> +	struct resource *res)
> +{
> +	u32 base_addr;
> +	u64 base64_addr;
> +	unsigned long flags;
> +
> 

> +	if (!res)
> +		return -EINVAL;

I don't remember the details, one version was quite changed, so, I think
these lines are not needed anymore.

> +	/* Get IO or MMIO BAR */
> +	pci_bus_read_config_dword(pdev->bus, devfn, SBREG_BAR,
> &base_addr);
> +	if ((base_addr & PCI_BASE_ADDRESS_SPACE) ==
> PCI_BASE_ADDRESS_SPACE_IO) {
> +		flags = IORESOURCE_IO;
> +		base64_addr = base_addr & PCI_BASE_ADDRESS_IO_MASK;
> +	} else {
> +		flags = IORESOURCE_MEM;
> +		base64_addr = base_addr & PCI_BASE_ADDRESS_MEM_MASK;
> +		if (base_addr & PCI_BASE_ADDRESS_MEM_TYPE_64) {
> +			flags |= IORESOURCE_MEM_64;
> 

> +			pci_bus_read_config_dword(pdev->bus, devfn,
> +				SBREG_BAR + 4, &base_addr);

Fix indentation.

> +			base64_addr |= (u64)base_addr << 32;
> +		}
> +	}
> +
> +	/* Hide the P2SB device */
> +	pci_bus_write_config_byte(pdev->bus, devfn, SBREG_HIDE,
> 0x01);
> +
> +	spin_unlock(&p2sb_spinlock);
> +

> +	/* User provides prefilled resources */

Not anymore as far I as I can see. You just return here the result.

> +	res->start = (resource_size_t)base64_addr;
> +	res->flags = flags;

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
