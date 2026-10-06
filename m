Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D3C3BBA01;
	Tue,  6 Oct 2026 23:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791329035; cv=none; b=dlHM1R5RtzXiMiR5ZTfD6deWv9iKH9SnlCwPEaLHCLZfkRmD3LdxWMvThNsEPS1HsXam/r3AlazB8+BB94KIzPUhQ4LJwG4/4urJItOZgS6rZetljSNf6/bkRSYcoIRdI1/4GSJ4Sm9XxSyjdwIw4TB8FA6RObhno2JDDLiongk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791329035; c=relaxed/simple;
	bh=aCf+ecADbpzZJB4b2Abbl4SbvxENP8Hj3uwHBY5Y/2g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EI+VxtiMO2uuj0M8oV4YwgYO6ifrUi3XF9wK2vb/dDHgiawTkrEpxsGHG8SANYsodBIK1DbM4JvvehF89zUovDjjX2hIjesVFdiMnijr8KbaBu7uXR8394P2OohMA88C+tOCAo06g5k9m316TDHhmbwMoNISaz3kxJyfncEUCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pvSidUC1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pvSidUC1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DC63152B;
	Tue,  6 Oct 2026 16:23:39 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D1B3F763;
	Tue,  6 Oct 2026 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791329022; bh=aCf+ecADbpzZJB4b2Abbl4SbvxENP8Hj3uwHBY5Y/2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pvSidUC1OjgIh52WAADE1kQvxGBSINL9WVgf6mcIrbC1OnU0w/KAbTE2G8jnpcQq6
	 XqBPHRzVa6qVBjNd071DFriJEpI+r0sDcZg8lNcslFrPmSzcQolMjEzLLCpF7uC4z+
	 ZuZ0ShU4AHBNWB9AiZcps9b0WFIECbmsoDSO9oSA=
Date: Wed, 7 Oct 2026 01:23:37 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across
 probe attempts
Message-ID: <20261007012337.6765eae7@ryzen.lan>
In-Reply-To: <20261006210313.43163-1-pmazzini@gmail.com>
References: <20261006210313.43163-1-pmazzini@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 22:03:13 +0100
Pablo Mazzini <pmazzini@gmail.com> wrote:

Hi Pablo,

> init_pins_table() adds to npins in the driver's static descriptor, so
> after a probe deferral the count doubles and the next probe fails with
> "pin 0 already registered". Count into a local instead.

Can't we just initialise desc->npins to 0, at the beginning of
init_pins_table? I think Sashiko suggested that even...

Cheers,
Andre

> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd131..1c1888394cf1 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>  					      struct sunxi_pinctrl_desc *desc)
>  {
>  	struct sunxi_desc_pin *pins, *cur_pin;
> -	int name_size = 0;
> +	int name_size = 0, npins = 0;
>  	int port_base = desc->pin_base / PINS_PER_BANK;
>  	char *pin_names, *cur_name;
>  	int i, j;
> @@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>  	 * Also work out how much memory we need to store all the pin names.
>  	 */
>  	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
> -		desc->npins += pins_per_bank[i];
> +		npins += pins_per_bank[i];
>  		if (pins_per_bank[i] < 10) {
>  			/* 4 bytes for "PXy\0" */
>  			name_size += pins_per_bank[i] * 4;
> @@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>  		}
>  	}
>  
> -	if (desc->npins == 0) {
> +	if (npins == 0) {
>  		dev_err(dev, "no ports defined\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
> +	desc->npins = npins;
> +
> +	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  	if (!pins)
>  		return ERR_PTR(-ENOMEM);
>  

