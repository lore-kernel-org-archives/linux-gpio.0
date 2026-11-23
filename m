Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450619;
	b=WPaYLggJu1VMfS0FZ6KLA80wMN/Xy5uAvlogsZWdWWBvwvE/Y4NBRyYQ5QSYpFFbNQRQ
	 O944Uxpnkx6Tfzm4WBKIG6sDiMpAmhyC3A7ygDxgG0ISZOnjYT8WN4rQIzUruhLCETOry
	 4oBkiH/qkMzntrCbdn96b5LJks0l/XMwex96QgpiNtldOofR8nKiRgDqy7DJZQ25N3NsO
	 kOgnOIYl3NpT7kF6DlBUPkuEB0m+F2/gt1oNshdVRHuONC/NgeMXCJAOn0ir8N+42A1mP
	 ya+6SUjoVfzSj/1CAqTBTHwULBKjYreDOcuMZVMT6o16P3Tq1TxmoQ4DwL8fqOgpWcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450619;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Y6freCjEe2/ag4vYb4af1x9n5Tn4xa986zFu7+LZx7w=;
	b=cpjhd95E9Dw/ekIQq4tEhc017fLh6vSAqyt5NGStJ1ITVkq8+RWPRMWcou3JwJ6mgfuR
	 43kSJmWVsw/UQwpDbuwB6YTnFep5cp5sPMdjByfJ5xhAQlRtqIDMgs2JtMjvKiQwMR6l5
	 FAIqQYqQ7n+JLgrPGvrXZVtLFTGbpuQjtH4+jVhw7ebyEAr/CYMUqUoseHinXONNYKTtQ
	 61Z5JzP9SsUcPz93KcUgJBqzVcSlEwdUMYRMUGZqwmTLHWwHQ8o9muxGcIVDjla6G/B8L
	 EIo0iNDsnE/B0yYgmj7kFbE69ywoRRCONBH6kFDGxoStVJtbE39+J8G+Y8ynnEmf9aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImNqb2MD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 840A5606A32E;
	Mon, 23 Nov 2026 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ImNqb2MD
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A5D451F000CF;
	Mon, 23 Nov 2026 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450618;
	bh=Y6freCjEe2/ag4vYb4af1x9n5Tn4xa986zFu7+LZx7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ImNqb2MDG0vKXvXzdxDEHkBHB3y3zdylZi3As9Sv26aaPwufV36HCFO3Z7xXg+l3H
	 0BzcOzMxsIQ1Yepet4eKoI7/Y5BdlKCHBJcVtDhITURibBOe3DH+LeRtXTsqQKNm6B
	 cg/rkr9anx8hGMbgakwG2WziPkInql1FM6zg2nIGBmsE/kHDOzI4hjF7/l+Z4KS8sj
	 E3GMNg4fDmsU/8kSWG5VUNTq2qSiR6c46dF63OD4BtSo6EGWXAgHYOKWk/DUOQtOHW
	 stnJM2GN1ZxmDYx5ie3ddKaeQsdIUOYCF9cEdjI+eKmJr7UDhP7ShrSf0pCZ67b+BW
	 AZJJqnUAq3VPA==
Date: Mon, 23 Nov 2026 17:16:55 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Message-ID: <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
 <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com>

On Mon, Nov 16, 2026 at 09:23:59PM +0000, Stanislav Aleksandrov wrote:
> Add the pinctrl driver for the TLMM block found in the Qualcomm Halliday
> SoC: 224 GPIOs with their functions and PDC wakeup interrupts, the UFS
> reset pin and the SDC2 pins.
> 
> The tables are based on Qualcomm's downstream pinctrl-anorak driver.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

...

> +
> +static const struct msm_gpio_wakeirq_map halliday_pdc_map[] = {
> +	{ 18, 99 },  { 31, 120 }, { 37, 101 }, { 40, 103 }, { 41, 104 },
> +	{ 43, 106 }, { 44, 107 }, { 45, 92 },  { 46, 83 },  { 47, 86 },
> +	{ 53, 111 }, { 57, 121 }, { 60, 56 },  { 61, 108 }, { 62, 109 },
> +	{ 66, 110 }, { 68, 57 },  { 72, 112 }, { 74, 43 },  { 78, 114 },
> +	{ 84, 67 },  { 86, 66 },  { 87, 100 }, { 91, 102 }, { 94, 93 },
> +	{ 98, 123 }, { 100, 44 }, { 101, 97 }, { 103, 75 }, { 104, 52 },
> +	{ 106, 48 }, { 110, 53 }, { 111, 76 }, { 112, 49 }, { 113, 50 },
> +	{ 115, 54 }, { 118, 58 }, { 119, 77 }, { 122, 62 }, { 123, 63 },
> +	{ 129, 61 }, { 133, 65 }, { 137, 69 }, { 139, 70 }, { 142, 71 },
> +	{ 145, 74 }, { 146, 45 }, { 147, 78 }, { 148, 60 }, { 150, 119 },
> +	{ 152, 85 }, { 153, 79 }, { 154, 80 }, { 155, 81 }, { 157, 84 },
> +	{ 163, 88 }, { 164, 89 }, { 165, 73 }, { 166, 90 }, { 167, 91 },
> +	{ 169, 82 }, { 170, 95 }, { 171, 98 }, { 172, 47 }, { 175, 46 },
> +	{ 186, 129 }, { 189, 131 }, { 194, 116 }, { 196, 117 }, { 199, 113 },
> +	{ 201, 128 }, { 207, 115 }, { 208, 132 }, { 210, 135 }, { 212, 136 },
> +	{ 215, 137 },
> +};

Can you verify the pdc map against the interrupt map? It looks incomplete to
me, there should be more wake GPIOs. Unless you have a reason to not
include all of them?

> +
> +static const struct msm_pinctrl_soc_data halliday_tlmm = {
> +	.pins = halliday_pins,
> +	.npins = ARRAY_SIZE(halliday_pins),
> +	.functions = halliday_functions,
> +	.nfunctions = ARRAY_SIZE(halliday_functions),
> +	.groups = halliday_groups,
> +	.ngroups = ARRAY_SIZE(halliday_groups),
> +	.ngpios = 225,
> +	.wakeirq_map = halliday_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(halliday_pdc_map),
> +	.egpio_func = 9,

There's no egpio function. I assume you copied it from sm8550 but I
think you should do something similar to commit a326b0523fc1 ("pinctrl:
qcom: sa8775p: Enable egpio function") here.

Thanks,
Bartosz
