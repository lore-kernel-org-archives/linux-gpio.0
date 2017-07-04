From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Tue, 4 Jul 2017 12:54:59 +0300
Message-ID: <20170704095459.GB1250@kuha.fi.intel.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:30333 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751631AbdGDJzD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jul 2017 05:55:03 -0400
Content-Disposition: inline
In-Reply-To: <20170704064947.10792-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Jul 04, 2017 at 07:49:47AM +0100, Peter Robinson wrote:
> The Intel pin control drivers are architecture specific so add an if arch
> to check for X86 or compile test to ensure continued test coverage.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/pinctrl/intel/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
> index 396830a41127..0c7edc321415 100644
> --- a/drivers/pinctrl/intel/Kconfig
> +++ b/drivers/pinctrl/intel/Kconfig
> @@ -1,6 +1,7 @@
>  #
>  # Intel pin control drivers
>  #
> +if (X86 || COMPILE_TEST)
>  
>  config PINCTRL_BAYTRAIL
>  	bool "Intel Baytrail GPIO pin control"
> @@ -72,3 +73,5 @@ config PINCTRL_SUNRISEPOINT
>  	  Sunrisepoint is the PCH of Intel Skylake. This pinctrl driver
>  	  provides an interface that allows configuring of PCH pins and
>  	  using them as GPIOs.
> +
> +endif

OK by me:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Thanks,

-- 
heikki
