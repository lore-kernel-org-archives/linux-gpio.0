From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v1 2/3] SFI: store GPIO table and export lookup function
Date: Fri, 6 Dec 2013 10:51:37 +0900
Message-ID: <52A12DA9.9020109@nvidia.com>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386261409-13850-3-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5109 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753392Ab3LFBvl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Dec 2013 20:51:41 -0500
In-Reply-To: <1386261409-13850-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On 12/06/2013 01:36 AM, Andy Shevchenko wrote:
> We have to provide a mechanism to retrive GPIO information from SFI. For this
> we store SFI GPIO table and provide the lookup function
> sfi_gpio_get_entry_by_name() that will be used later in GPIO framework.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/sfi/Makefile   |   2 +-
>   drivers/sfi/sfi_core.c |   6 +++
>   drivers/sfi/sfi_core.h |   3 ++
>   drivers/sfi/sfi_gpio.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/sfi.h    |   8 ++++
>   5 files changed, 141 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/sfi/sfi_gpio.c
>
> diff --git a/drivers/sfi/Makefile b/drivers/sfi/Makefile
> index 2343732..dc011db 100644
> --- a/drivers/sfi/Makefile
> +++ b/drivers/sfi/Makefile
> @@ -1,3 +1,3 @@
>   obj-y	+= sfi_acpi.o
>   obj-y	+= sfi_core.o
> -
> +obj-y	+= sfi_gpio.o
> diff --git a/drivers/sfi/sfi_core.c b/drivers/sfi/sfi_core.c
> index 296db7a..e9ff6f0 100644
> --- a/drivers/sfi/sfi_core.c
> +++ b/drivers/sfi/sfi_core.c
> @@ -512,6 +512,12 @@ void __init sfi_init_late(void)
>   	syst_va = sfi_map_memory(syst_pa, length);
>
>   	sfi_acpi_init();
> +
> +	/*
> +	 * Parsing GPIO table first, since the DEVS table will need this table
> +	 * to map the pin name to the actual pin.
> +	 */
> +	sfi_gpio_init();
>   }
>
>   /*
> diff --git a/drivers/sfi/sfi_core.h b/drivers/sfi/sfi_core.h
> index 1d5cfe8..18c663d 100644
> --- a/drivers/sfi/sfi_core.h
> +++ b/drivers/sfi/sfi_core.h
> @@ -79,3 +79,6 @@ struct sfi_table_header *sfi_get_table(struct sfi_table_key *key);
>   extern void sfi_put_table(struct sfi_table_header *table);
>   extern struct sfi_table_attr __init *sfi_sysfs_install_table(u64 pa);
>   extern void __init sfi_acpi_sysfs_init(void);
> +
> +/* sfi_gpio.c */
> +int sfi_gpio_init(void);
> diff --git a/drivers/sfi/sfi_gpio.c b/drivers/sfi/sfi_gpio.c
> new file mode 100644
> index 0000000..677368d
> --- /dev/null
> +++ b/drivers/sfi/sfi_gpio.c
> @@ -0,0 +1,123 @@
> +/* sfi_gpio.c Simple Firmware Interface - GPIO extensions */
> +
> +/*
> +
> +  This file is provided under a dual BSD/GPLv2 license.  When using or
> +  redistributing this file, you may do so under either license.
> +
> +  GPL LICENSE SUMMARY
> +
> +  Copyright(c) 2013 Intel Corporation. All rights reserved.
> +
> +  This program is free software; you can redistribute it and/or modify
> +  it under the terms of version 2 of the GNU General Public License as
> +  published by the Free Software Foundation.
> +
> +  This program is distributed in the hope that it will be useful, but
> +  WITHOUT ANY WARRANTY; without even the implied warranty of
> +  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +  General Public License for more details.
> +
> +  You should have received a copy of the GNU General Public License
> +  along with this program; if not, write to the Free Software
> +  Foundation, Inc., 51 Franklin St - Fifth Floor, Boston, MA 02110-1301 USA.
> +  The full GNU General Public License is included in this distribution
> +  in the file called LICENSE.GPL.

As I've been told many times in the past, this last paragraph should not 
be included unless you are willing to update all your patches that 
include it should the FSF move to another address. ;)

Otherwise I'm not familiar with SFI, but this looks ok to me.
