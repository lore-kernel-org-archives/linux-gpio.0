Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE2F44E642;
	Mon, 12 Oct 2026 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794432; cv=none; b=L0NvAp35N53mQGWO+IJ7aN6grb7vJ6WSgO54NG6GBYnKVFHQnQF9mb3STWPPNW4fdjc2SxY6L+yfAxUhUSb1CCNtxi8qMIhPfLqDIfcUdKEVyHp38DG12vNqoe2PfeYUJ0hugyfsH+zG1K6oa8JAicKuyHD36KdDfUBQce0Lr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794432; c=relaxed/simple;
	bh=3acPOqONrLSgFKsfMg1vrNwvcicAeebuv1jTEDu2lI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vtlsg3dI2chk5huSwnJ32D2fyesmnMKjZ0Pd0EpaL08SX/ZjbvASCivAbk2qC1kQJpf35L78DTifa8A4HC3LKR8XB1b7iuT/2dmBx5TUUK52BN8JeiGD/JbyJk/o2O8QP0qdu8wRQLZo/7N/LFYsc7kndP49IbxHSWfhTLxCQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QeBL8p1n; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QeBL8p1n"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF9EE1650;
	Mon, 12 Oct 2026 01:40:25 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B41EA3F66F;
	Mon, 12 Oct 2026 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791794429; bh=3acPOqONrLSgFKsfMg1vrNwvcicAeebuv1jTEDu2lI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QeBL8p1nmOxulVfYhZsdUz35b2f/XQND/DCDMC+Bx6ksy5y5X8n8d7OHCkX5tYh7U
	 WKJP0q1BR+BZUlFPNboMC41r+nBKjwd2UjbDBx0GFAEswa7PGDy9/lhufIuApyGTnn
	 wpsufSLGQhNPEmR1IUFb+1S8CDoUsbU0s5hCd4eI=
Message-ID: <803c1787-999e-4239-bccd-b89e7a066961@arm.com>
Date: Mon, 12 Oct 2026 10:40:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across
 probe attempts
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261007060107.62221-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261007060107.62221-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/7/26 08:01, Pablo Mazzini wrote:
> init_pins_table() adds to npins in the driver's static descriptor, so
> after a probe deferral the count doubles and the next probe fails with
> "pin 0 already registered". Reset it first.

Yes, thanks, this is what I had in mind. And I think it deserves some 
backports:

> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> v2: reset npins instead of counting into a local (Andre)
> 
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd131..8bcd566593ae 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -84,6 +84,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>   	 * Find the total number of pins.
>   	 * Also work out how much memory we need to store all the pin names.
>   	 */
> +	desc->npins = 0;
>   	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
>   		desc->npins += pins_per_bank[i];
>   		if (pins_per_bank[i] < 10) {

