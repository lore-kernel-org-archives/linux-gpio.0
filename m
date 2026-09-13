Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED5370AFB
	for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789319220; cv=none; b=kBdtBGYJ8k62H34c5fIEZFgdUjMfS2jjwpV5QTnx73SOv75LquYmTUwjlVa7zM8c/+2pIdACZxhZ6o8mG77Z4cPOrvgGzHroc4TKpl+dMgmXW03s97Nk5wqnV+18oBtcHcoRiArwXJgy0DDh4I1QeWLpH+ZwqPxwDb4UVuIWyMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789319220; c=relaxed/simple;
	bh=55HOlgxv5Osy61VeA0QW3rB1klhKperyZUva8emw96E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEkhPRzwvO42rsbkZR7Mg21e19+VfX3gQBY1nRyjZebpOl9maBYsZsweaVPmU/nezbivlRENo6t9LCk4r7qKb/5mWOvoMFHXj4iMyHBmAw6Q6JRSX53fqgwNqv81Xsob+44O0nEh0AW7dqX7Gitip3YyJJTW58Hzn52KQvgAUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dekYmsWU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dekYmsWU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so7083235e9.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2026 10:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789319217; x=1789924017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLfGELYFsfdMyOIjPBzlfKUMxy/FgAuN3WPbdQvjEjI=;
        b=dekYmsWUMA7orNWR6WnDt3hnCugYL9EL5TDQAiY5o7DHGi0kZ6P3aa+BKVulfH0MU2
         JR5PzjfyJALmC4niZdo2ziA6iK2Zhyyi7LUJj0RXuN54DkAcYuT7uEyaVGsGBiWabpQc
         v5LfckbHJotM4pgsQKpOWHeVVY04nArvmu3uI99e6aJ16K7bohTfkwRtCRpOpraIAGtT
         zQLvfTNhCKjdVy272vFGDiZPFm+DhLah/lQkiDtNp3VMiA15jWKAYqvGOqFcKcVpPyKZ
         D6FlgIU8PbWHBFOVrWc8ZuJf/udoIjz9PwxzwS5+TXfiWoq2bjSicAvqGmlQf9QpYKwi
         pBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789319217; x=1789924017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLfGELYFsfdMyOIjPBzlfKUMxy/FgAuN3WPbdQvjEjI=;
        b=er26MkLfQfuK5/fUCGd8QB6+T3O7AJq5RoL5OV12uL/ZCTxvl74QJn61+SrSR8UoaL
         d6Tk5Ay3ruYzZi0AQ/QMZrAOkGh3mIX2ow3Cd68n2Kl5MU3VjkjW30lHSFcxq0aSR62/
         bEkd4ysBVfQ5wZPcj9e320m+Lc6QJce7Gz0212RrQ22nOIg1fTL6KMvU/KzmScb8Cd0T
         qr43VadaLlFu1pHMTAD+GuDpvrqepnKyvr9gQHVx1z65M8/47GUBtgVHLX8cKQQ0RqZo
         4Xi/IhsLeHQlU6sCyAPvMYlwCFmnW3obC2jhzCPs1cVkKeNt2A3Vle/gTt0LhvFReOZR
         EnYA==
X-Forwarded-Encrypted: i=1; AKwUvBwE8iUfZL/BeCEBiF1gA/EM8Nm28pd7QcQAY23rQGInsQ2OyLvN+7Bdoq+0L+F5fxh6HyZW8xLwhX+Z@vger.kernel.org
X-Gm-Message-State: AFuF++ku2shnB6NRZEsrBi+FjOCljFlchPeZqQU3kMBdqDkryAFajxs/
	jKt7Zapj0CWGpCS5QAmAZ803+hwrBk1oj3Opr90RBuMFY5yQAZGrKBYl
X-Gm-Gg: AYBFou2obpIncY/1QXRwOzwGSjtvlPWQOaCuJO68ZJmyLfekjf4XBrl7PaBUoo5m9eu
	NZUPFrajxEwWI4/ORfIlf71Yrk+Rx9ml76Ui7b1iawlyM/jCGMlm7kpVNz91YcMYkkpuiu8QXeD
	junbI2VwdGOItPewOlG9jemp3ICaxjJM2CN4ymNWGT34fFjW+qsWxCbGZk8QT/sADoOqsVLSh29
	uFaR2owk8kLGn8aERsLaZgMIdoXDFTALbSR+AGjj1TLfGpiYPL5GziMDwBOGHWzA+dwLEclFQmy
	px0/TmFHiKuL0vW6pPSuYw2TRfScGtbB6uXDGoUTSy90iMuqSdtb06GnQEUgEOSsiKXZCRpKtC6
	9t0xLnqq6jNghIPrHd6DkgkzxKMCk1p6ORFgD8jDSOJClb9VXwtjXCnJSV/VmQu+ncmhac4aJsa
	bqbM0wQshILOgE7dNnJllCKA0HkF4e23MIVxtEAtuLJjFpZjeYTQpeSBUEYH8lro1JRaDqOLIe/
	UVAHk/t5Aue4rOp2yeZEg==
X-Received: by 2002:a05:600d:4443:20b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49e76065da4mr22473745e9.11.1789319216429;
        Sun, 13 Sep 2026 10:06:56 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6aac22bbsm116205845e9.0.2026.09.13.10.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 10:06:54 -0700 (PDT)
Message-ID: <7dfe251c-7c1f-46c9-a3e4-fb7388ddae49@gmail.com>
Date: Sun, 13 Sep 2026 20:06:52 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] phy: cpcap-usb: add DCP detection and make UART
 idle mode optional
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
 <20260711204210.197144-5-ivo.g.dimitrov.75@gmail.com>
 <oheoylzdj3arrnfdm6747cuubllkdmg4gx7vm3zhs3owuooj4v@zdbytrztbdp4>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <oheoylzdj3arrnfdm6747cuubllkdmg4gx7vm3zhs3owuooj4v@zdbytrztbdp4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9.09.26 г. 19:07 ч., Manivannan Sadhasivam wrote:
> On Sat, Jul 11, 2026 at 11:42:07PM +0300, Ivaylo Dimitrov wrote:
>> Handle DCP separately from USB host connections using CPCAP charger
>> detection status.
>>
>> Make the existing idle UART mode optional via the "enable_uart" module
>> parameter. When disabled (default), the PHY remains in its USB/charger
>> detection configuration while idle.
>>
>> Also initialize the PHY into the baseline configuration required for
>> reliable charger detection during probe.
>>
>> Use the optional "safe" pinctrl state before switching between modes to
>> avoid glitches on USB or UART lines.
>>
> 
> Looks like this change is doing multiple things at once. Please split the
> changes logically to separate patches.
> 
will spliting in two:

patch1: enable_uart + safe pinctrl
patch2: DCP detection + init on probe

be ok or you want me to split even more? To me it makes sense as 
enable_uart will be few lines only if sent as a separate patch and I 
don't think splitting DCP detection + init on probe makes sense.

>> Note: Enabling UART idle mode increases idle power consumption (by 25mW
>> on droid4).
>>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>>
>> # Conflicts:
>> #	drivers/phy/motorola/phy-cpcap-usb.c
> 
> What is this conflict?

an artefact from nth local rebase/merge before submission :) .

> 
>> ---
>>   drivers/phy/motorola/phy-cpcap-usb.c | 301 +++++++++++++++++++++------
>>   1 file changed, 238 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
>> index 741145c89e5b..2d770ff19e93 100644
>> --- a/drivers/phy/motorola/phy-cpcap-usb.c
>> +++ b/drivers/phy/motorola/phy-cpcap-usb.c
>> @@ -110,6 +110,15 @@ enum cpcap_gpio_mode {
>>   	CPCAP_OTG_DM_DP,
>>   };
>>   
>> +enum cpcap_mode {
>> +	CPCAP_UNKNOWN,
>> +	CPCAP_IDLE,
>> +	CPCAP_CHARGER,
>> +	CPCAP_USB,
>> +	CPCAP_USB_HOST,
>> +	CPCAP_DOCK,
>> +};
>> +
>>   struct cpcap_phy_ddata {
>>   	struct regmap *reg;
>>   	struct device *dev;
>> @@ -119,15 +128,19 @@ struct cpcap_phy_ddata {
>>   	struct pinctrl_state *pins_ulpi;
>>   	struct pinctrl_state *pins_utmi;
>>   	struct pinctrl_state *pins_uart;
>> +	struct pinctrl_state *pins_safe;
>>   	struct gpio_desc *gpio[2];
>>   	struct iio_channel *vbus;
>>   	struct iio_channel *id;
>>   	struct regulator *vusb;
>>   	atomic_t active;
>> -	unsigned int vbus_provider:1;
>> -	unsigned int docked:1;
>> +	enum cpcap_mode mode;
>>   };
>>   
>> +static bool cpcap_enable_uart;
>> +module_param_named(enable_uart, cpcap_enable_uart, bool, 0644);
>> +MODULE_PARM_DESC(enable_uart,
>> +		 "Enable UART on the USB connector while idle (increases power consumption)");
> 
> Use of module params is discouraged these days. Also, you are disabling it by
> default, which could cause surprises to users who have boards wired up for debug
> console. But considering that it consumes a lot of power, I think it is OK to
> disable it this way. I can't think of another way to add this knob.
> 

Me neither, that's why I came up with a module parameter. Yes, I 
understand disabling it by default may cause regression for some 
(presumably knowledgeable) users, however, I think stripping ~25% from 
idle power usage for the others worths it.

>>   static bool cpcap_usb_vbus_valid(struct cpcap_phy_ddata *ddata)
>>   {
>>   	int error, value = 0;
>> @@ -196,8 +209,9 @@ static int cpcap_phy_get_ints_state(struct cpcap_phy_ddata *ddata,
>>   	return 0;
>>   }
>>   
> 
> [...]
> 
>> @@ -473,21 +559,10 @@ static int cpcap_usb_set_usb_mode(struct cpcap_phy_ddata *ddata)
>>   {
>>   	int error;
>>   
>> -	/* Disable lines to prevent glitches from waking up mdm6600 */
>> -	error = cpcap_usb_gpio_set_mode(ddata, CPCAP_UNKNOWN_DISABLED);
>> +	error = cpcap_usb_set_safe_mode(ddata);
>>   	if (error)
>>   		return error;
>>   
>> -	if (ddata->pins_utmi) {
>> -		error = pinctrl_select_state(ddata->pins, ddata->pins_utmi);
>> -		if (error) {
>> -			dev_err(ddata->dev, "could not set usb mode: %i\n",
>> -				error);
>> -
>> -			return error;
>> -		}
>> -	}
>> -
>>   	error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC1,
>>   				   CPCAP_BIT_VBUSPD, 0);
>>   	if (error)
>> @@ -503,11 +578,23 @@ static int cpcap_usb_set_usb_mode(struct cpcap_phy_ddata *ddata)
>>   		goto out_err;
>>   
>>   	error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC2,
>> -				   CPCAP_BIT_USBXCVREN,
>> +				   CPCAP_BIT_USBXCVREN |
>> +				   CPCAP_BIT_UARTMUX0 |
>> +				   CPCAP_BIT_EMUMODE0,
> 
> As Sashiko noted, you are not clearing CPCAP_BIT_USBSUSPEND bit set in
> cpcap_usb_set_idle_mode().
> 

Vendor kernel does not do it and we are using the patch with 
CPCAP_BIT_USBSUSPEND not cleared for few months with no issues 
whatsoever, so I am not convinced this is needed. However, tests on the 
device didn't show any difference if I clear the bit so OK, will do.

>>   				   CPCAP_BIT_USBXCVREN);
>>   	if (error)
>>   		goto out_err;
>>   
>> +	if (ddata->pins_utmi) {
>> +		error = pinctrl_select_state(ddata->pins, ddata->pins_utmi);
>> +		if (error) {
>> +			dev_err(ddata->dev, "could not set usb mode: %i\n",
>> +				error);
>> +
>> +			return error;
>> +		}
>> +	}
>> +
>>   	/* Enable USB mode */
>>   	error = cpcap_usb_gpio_set_mode(ddata, CPCAP_OTG_DM_DP);
>>   	if (error)
>> @@ -521,6 +608,38 @@ static int cpcap_usb_set_usb_mode(struct cpcap_phy_ddata *ddata)
>>   	return error;
>>   }
>>   
>> +static int cpcap_usb_set_dcp_mode(struct cpcap_phy_ddata *ddata)
>> +{
>> +	int error;
>> +
>> +	error = cpcap_usb_set_safe_mode(ddata);
>> +	if (error)
>> +		return error;
>> +
>> +	error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC2,
>> +				   CPCAP_BIT_USBXCVREN |
>> +				   CPCAP_BIT_UARTMUX0 |
>> +				   CPCAP_BIT_EMUMODE0, 0);
>> +	if (error)
>> +		goto out_err;
>> +
>> +	error = regmap_update_bits(ddata->reg, CPCAP_REG_USBC3,
>> +				   CPCAP_BIT_SUSPEND_SPI, 0);
>> +	if (error)
>> +		goto out_err;
>> +
>> +	error = cpcap_usb_gpio_set_mode(ddata, CPCAP_DM_DP);
>> +	if (error)
>> +		goto out_err;
>> +
>> +	return 0;
>> +
>> +out_err:
>> +	dev_err(ddata->dev, "%s failed with %i\n", __func__, error);
> 
> Don't print function names in the error log.
> 

Ok.

Will send new series, just LMK if you want the patch split in 2 or more 
patches.

Thanks,
Ivo
