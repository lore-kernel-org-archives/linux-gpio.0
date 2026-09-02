Received: from mail11 (ip-86-49-165-115.net.vodafone.cz [86.49.165.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270A3515F2;
	Wed,  2 Sep 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=86.49.165.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372761; cv=none; b=uuelK9Y3SB/X0cbzKLCeF2CyHOHzNC5YtWgZBFplXRNXRUvB2/LoQw1VmYoNuzknqI6YhRVAuDgh9DbSrNNkoSNv18JdN9EWr7RMrg/tOjr84lDLzeteHlrNPiN2ZZrPHbDCdW8tXjBLpQ1O57rtys5nuNjVbvCnnDmhpgcMywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372761; c=relaxed/simple;
	bh=3kUHlwJaMzoOXdzCj33gaEgDw7tGWnaruX4FJGq8s64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okWwdLxIDQ9jKflFPGItcU6iVWqLTPMYvlRuFJc1iRRKn2cvBzOcznVN0w1NWVfM/XnNA47sTmPwRH6do4cViSmj/sjZ+dyGIpiTx1pBvPMHs8Ev6sCoxMUj2xaZ65wv7ko2gU8QuqCwK2106G3TDCfsT7MJ344+2T6Rn9x5TDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lipicko.cz; spf=pass smtp.mailfrom=lipicko.cz; dkim=pass (2048-bit key) header.d=lipicko.cz header.i=@lipicko.cz header.b=tWdDVoKv; arc=none smtp.client-ip=86.49.165.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lipicko.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lipicko.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lipicko.cz header.i=@lipicko.cz header.b="tWdDVoKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lipicko.cz; s=mail;
	t=1788372750; bh=3kUHlwJaMzoOXdzCj33gaEgDw7tGWnaruX4FJGq8s64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:From:
	 Sender:To:CC:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Reply-To;
	b=tWdDVoKvVqPG6EsvtKMnPN4pM22zogj+viR5cfniEtY8tAw1N9niCB31u4JnQKObh
	 /anRa1YEDnJ/xFGMbczWZ1m5sq4wn5tyZ8L5PG9jtFJHTPn6LLB9iXXhflj7GpzUMW
	 vlZb5klsxIDDn2wzKuuSl9RpQXbZ3BlMMW9DkqAtww5bZbSzHa8uVtSTcauWNGvd0y
	 x/JRoj5lYosbsClK6ZqF+aSDjJyM/Dj7dd05NY5ccG6CIdLZV2xnj2XT6oyOK9cC7H
	 scQnQNUVGCkkX93rU3py8Hv8H/DZRVGfpkCa6dZTqrdzfeXLV9jASLr5RPHl2oeafg
	 qR55Lqf6HWtgg==
Received: from [192.168.11.133] (siemens-ex975lvv1e-68a40ebdecb9.lipicko.cz [192.168.11.133])
	by mail11 (Postfix) with ESMTP id 43CD63E0248;
	Wed, 02 Sep 2026 20:12:29 +0200 (CEST)
Message-ID: <96dea031-069f-4ee1-8756-fb545a5e38ed@lipicko.cz>
Date: Wed, 2 Sep 2026 20:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Try to retrieve driver data for
 pure platform drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 =?UTF-8?Q?Radek_V=C3=A1lko?= <rvalko@lipicko.cz>
References: <20260831142853.1995573-1-andriy.shevchenko@linux.intel.com>
 <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Radek_V=C3=A1lko?= <rvalko@lipicko.cz>
In-Reply-To: <20260831142853.1995573-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

thanks for the patch.

I tested [PATCH v1 2/2] successfully on the affected Intel Atom
C3000 / Denverton system, first with Linux 6.12.105 and now also
with Linux 6.12.107.

With the patch applied, the original -ENODATA (-61) probe failure
is gone. The pinctrl device registers successfully:

denverton-pinctrl.0 yes yes

and the GPIO controller exposes all 154 lines:

gpiochip0 - 154 lines

Tested-by: Radek Válko <rvalko@lipicko.cz>

Thanks,
Radek

On 8/31/26 16:25, Andy Shevchenko wrote:
> The Denverton pinctrl device can be instantiated by the Intel LPC
> driver as an MFD platform device named "denverton-pinctrl".
>
> On affected systems the platform device does not carry the INTC3000
> ACPI match data itself. As a result, intel_pinctrl_probe_by_hid()
> fails to obtain the SoC data using device_get_match_data() and
> returns -ENODATA.
>
> This might be also true for other platforms that can be enumerated
> by ACPI _HID. Fix the above by trying the pure platform driver data
> in case the firmware node is not set or doesn't carry the necessary
> information.
>
> Reported-by: Radek Válko <rvalko@lipicko.cz>
> Closes: https://lore.kernel.org/r/20260827184259.32386-1-rvalko@lipicko.cz
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/intel/pinctrl-intel.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 7aa7f81ac405..50ffad6a7610 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1716,13 +1716,32 @@ int intel_pinctrl_probe(struct platform_device *pdev,
>   }
>   EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, "PINCTRL_INTEL");
>   
> +static const struct intel_pinctrl_soc_data *
> +intel_pinctrl_get_soc_data_by_hid(struct platform_device *pdev)
> +{
> +	const struct intel_pinctrl_soc_data *data;
> +	const struct platform_device_id *id;
> +	struct device *dev = &pdev->dev;
> +
> +	data = device_get_match_data(dev);
> +	if (data)
> +		return data;
> +
> +	id = platform_get_device_id(pdev);
> +	if (!id)
> +		return ERR_PTR(-ENODEV);
> +
> +	data = (const struct intel_pinctrl_soc_data *)id->driver_data;
> +	return data ?: ERR_PTR(-ENODATA);
> +}
> +
>   int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
>   {
>   	const struct intel_pinctrl_soc_data *data;
>   
> -	data = device_get_match_data(&pdev->dev);
> -	if (!data)
> -		return -ENODATA;
> +	data = intel_pinctrl_get_soc_data_by_hid(pdev);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
>   
>   	return intel_pinctrl_probe(pdev, data);
>   }
