Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A80D493D5B;
	Thu,  1 Oct 2026 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856512; cv=none; b=ivDx+u0iL/MVxuIKukH4YG5bxfi/Dpf8I3GcexEh033GrHjl2UlNqLje1uXVlNV7RI1bU0YGSzzQDTlgpfXqYatV+jVnjv3oqQB4+wtNL8UvDnkGxPRARkwp1KReJBptsYc0CHiQiC3Hoj2D2chXsYnY8LG82CtZf2VG4oGKGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856512; c=relaxed/simple;
	bh=g0t4+K78ZEdT18l1xLV+GQmkNOeC+S/m5BHu8L/YhhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pq398sWFfvvMsrK1PLM4kBawKBl5wNBK9VpRI25aSRzvA+Ra7wXPbYNiMku8hz67AiZOFnV3tNZDjvXpajEZgJEo8q7HL/cMK8m/Zq6Oo57AmwGXfm1wKDTIXBhLrZ7kbmIxDGE6WTZ8m4aS5cCH/xFLICx6UbrFBIm37Gow2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ll0MRCxA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ll0MRCxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415121F00898;
	Thu,  1 Oct 2026 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790856494;
	bh=IfGJk2g1AM2yk48MEqRiOjhzzN/4mxTpadwn65LrGEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ll0MRCxA/oRylFORdjku80cMK7mv2SbEqwbAWQDAmuZldLJCoyT5tkBq4xx3q3OjO
	 +Z90bJRozPGO8FoeD6jpXnmMGp1lZJxjALhjpE0GSgPrFUP0sdI0RYHS+3qvYk6qYX
	 DVdQDYp69rGwtIcw8ZzzGMYugfqf+LAOfMdg0+Cg=
Date: Thu, 1 Oct 2026 13:57:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dhanushkalyan G <dhanushkalyan.g@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
	vaibhaavram.tl@microchip.com, kumaravel.thiagarajan@microchip.com,
	tharunkumar.pasumarthi@microchip.com, Thangaraj.S@microchip.com
Subject: Re: [PATCH v4] misc: microchip: pci1xxxx: Acquire system lock per
 byte for OTP/EEPROM
Message-ID: <2026100144-life-daylight-09e2@gregkh>
References: <20260806105053.8801-1-dhanushkalyan.g@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806105053.8801-1-dhanushkalyan.g@microchip.com>

On Thu, Aug 06, 2026 at 04:20:53PM +0530, Dhanushkalyan G wrote:
> Access to the OTP and EEPROM is guarded by a hardware system lock
> (CFG_SYS_LOCK register) that has a hardware timeout and is released once
> the timeout elapses.
> 
> The read and write helpers acquire the lock once before the per-byte
> loop and release it only after the whole buffer is transferred. As each
> byte access polls the hardware for completion, a multi-byte transfer
> takes longer than the lock timeout, so the lock is released mid-transfer
> and the remaining bytes are not written.
> 
> Acquire and release the system lock around each byte access instead, so
> every access stays within the lock timeout. Move set_sys_lock()/
> release_sys_lock() inside the loop and release the lock on the error path
> before bailing out, in all four helpers: OTP read/write and EEPROM
> read/write.
> 
> After each access, confirm the lock is still owned before trusting the
> result: under heavy load even a single byte access can exceed the lock
> timeout, in which case the hardware releases the lock early. Return
> -ETIMEDOUT in that case instead of silently reporting bad data.
> 
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
> Signed-off-by: Dhanushkalyan G <dhanushkalyan.g@microchip.com>
> ---
>  .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 83 +++++++++++++++----
>  1 file changed, 65 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> index a2ed477e0370..1e99bf59fdd3 100644
> --- a/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> +++ b/drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c
> @@ -94,6 +94,23 @@ static void release_sys_lock(struct pci1xxxx_otp_eeprom_device *priv)
>  	writel(0, sys_lock);
>  }
>  
> +/*
> + * The system lock has a hardware timeout: if it is held for longer than the
> + * configured timeout, the hardware releases it automatically. Under heavy
> + * load this can happen in the middle of an OTP/EEPROM byte access, leaving
> + * the access only partially completed while the code still assumes the lock
> + * is held. Re-read the lock and confirm this function (PF3) still owns it; a
> + * cleared ownership bit means the access raced with a lock timeout and its
> + * result cannot be trusted.
> + */
> +static bool is_sys_lock_owned(struct pci1xxxx_otp_eeprom_device *priv)
> +{
> +	void __iomem *sys_lock = priv->reg_base +
> +				 MMAP_CFG_OFFSET(CFG_SYS_LOCK_OFFSET);
> +
> +	return readl(sys_lock) & CFG_SYS_LOCK_PF3;
> +}
> +
>  static bool is_eeprom_responsive(struct pci1xxxx_otp_eeprom_device *priv)
>  {
>  	void __iomem *rb = priv->reg_base;
> @@ -133,11 +150,11 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
>  	if ((off + count) > priv->nvmem_config_eeprom.size)
>  		count = priv->nvmem_config_eeprom.size - off;
>  
> -	ret = set_sys_lock(priv);
> -	if (ret)
> -		return ret;
> -
>  	for (byte = 0; byte < count; byte++) {
> +		ret = set_sys_lock(priv);
> +		if (ret)
> +			return ret;
> +
>  		writel(EEPROM_CMD_EPC_BUSY_BIT | (off + byte), rb +
>  		       MMAP_EEPROM_OFFSET(EEPROM_CMD_REG));
>  
> @@ -148,13 +165,20 @@ static int pci1xxxx_eeprom_read(void *priv_t, unsigned int off,
>  					rb + MMAP_EEPROM_OFFSET(EEPROM_CMD_REG));
>  		if (ret < 0 || (!ret && (regval & EEPROM_CMD_EPC_TIMEOUT_BIT))) {
>  			ret = -EIO;
> +			release_sys_lock(priv);
>  			goto error;
>  		}
>  
>  		buf[byte] = readl(rb + MMAP_EEPROM_OFFSET(EEPROM_DATA_REG));
> +
> +		if (!is_sys_lock_owned(priv)) {
> +			ret = -ETIMEDOUT;
> +			goto error;
> +		}
> +
> +		release_sys_lock(priv);
>  	}
>  error:
> -	release_sys_lock(priv);
>  	return ret;
>  }
>  
> @@ -174,11 +198,12 @@ static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
>  	if ((off + count) > priv->nvmem_config_eeprom.size)
>  		count = priv->nvmem_config_eeprom.size - off;
>  
> -	ret = set_sys_lock(priv);
> -	if (ret)
> -		return ret;
>  
>  	for (byte = 0; byte < count; byte++) {
> +		ret = set_sys_lock(priv);
> +		if (ret)
> +			return ret;
> +
>  		writel(*(value + byte), rb + MMAP_EEPROM_OFFSET(EEPROM_DATA_REG));
>  		regval = EEPROM_CMD_EPC_TIMEOUT_BIT | EEPROM_CMD_EPC_WRITE |
>  			 (off + byte);
> @@ -193,11 +218,18 @@ static int pci1xxxx_eeprom_write(void *priv_t, unsigned int off,
>  					rb + MMAP_EEPROM_OFFSET(EEPROM_CMD_REG));
>  		if (ret < 0 || (!ret && (regval & EEPROM_CMD_EPC_TIMEOUT_BIT))) {
>  			ret = -EIO;
> +			release_sys_lock(priv);
> +			goto error;
> +		}
> +
> +		if (!is_sys_lock_owned(priv)) {
> +			ret = -ETIMEDOUT;
>  			goto error;
>  		}
> +
> +		release_sys_lock(priv);
>  	}
>  error:
> -	release_sys_lock(priv);
>  	return ret;
>  }
>  
> @@ -229,11 +261,11 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
>  	if ((off + count) > priv->nvmem_config_otp.size)
>  		count = priv->nvmem_config_otp.size - off;
>  
> -	ret = set_sys_lock(priv);
> -	if (ret)
> -		return ret;
> -
>  	for (byte = 0; byte < count; byte++) {
> +		ret = set_sys_lock(priv);
> +		if (ret)
> +			return ret;
> +
>  		otp_device_set_address(priv, (u16)(off + byte));
>  		data = readl(rb + MMAP_OTP_OFFSET(OTP_FUNC_CMD_OFFSET));
>  		writel(data | OTP_FUNC_RD_BIT,
> @@ -251,13 +283,20 @@ static int pci1xxxx_otp_read(void *priv_t, unsigned int off,
>  		data = readl(rb + MMAP_OTP_OFFSET(OTP_PASS_FAIL_OFFSET));
>  		if (ret < 0 || data & OTP_FAIL_BIT) {
>  			ret = -EIO;
> +			release_sys_lock(priv);
>  			goto error;
>  		}
>  
>  		buf[byte] = readl(rb + MMAP_OTP_OFFSET(OTP_RD_DATA_OFFSET));
> +
> +		if (!is_sys_lock_owned(priv)) {
> +			ret = -ETIMEDOUT;
> +			goto error;
> +		}
> +
> +		release_sys_lock(priv);
>  	}
>  error:
> -	release_sys_lock(priv);
>  	return ret;
>  }
>  
> @@ -278,11 +317,12 @@ static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
>  	if ((off + count) > priv->nvmem_config_otp.size)
>  		count = priv->nvmem_config_otp.size - off;
>  
> -	ret = set_sys_lock(priv);
> -	if (ret)
> -		return ret;
>  
>  	for (byte = 0; byte < count; byte++) {
> +		ret = set_sys_lock(priv);
> +		if (ret)
> +			return ret;
> +
>  		otp_device_set_address(priv, (u16)(off + byte));
>  
>  		/*
> @@ -309,11 +349,18 @@ static int pci1xxxx_otp_write(void *priv_t, unsigned int off,
>  		data = readl(rb + MMAP_OTP_OFFSET(OTP_PASS_FAIL_OFFSET));
>  		if (ret < 0 || data & OTP_FAIL_BIT) {
>  			ret = -EIO;
> +			release_sys_lock(priv);
>  			goto error;
>  		}
> +
> +		if (!is_sys_lock_owned(priv)) {
> +			ret = -ETIMEDOUT;
> +			goto error;
> +		}
> +
> +		release_sys_lock(priv);
>  	}
>  error:
> -	release_sys_lock(priv);
>  	return ret;
>  }
>  
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
