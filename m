Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA5305E3B;
	Tue, 30 Jun 2026 14:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830298; cv=none; b=RnQLbrAp+T8lxEs6+bZEVk8GFxZ+zVoRF2rHFBmxvekJaU5GnP20e9HHJRBVnpdlpxT0qInmpvLoLYQnrwmtrDwDddXjQTU4AbKtQwcxd6YmUlpp4+z44LIhWRU+7uhzPdfPS41pysn05cqlA2J3roGznZxkB5zrEqBAXT2z0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830298; c=relaxed/simple;
	bh=YfwEigpPGhXcuiHS4zH5F3vWZhheHmXE4GZOVvtEveQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mLP9mSI7MWHof1Uk/NhGBHlo30BesW+JOnfQuencFNIDueWiYGidiOAjEgKmBjhABSlpDXvGjABjd96p2jgorL1NPr0/3Q987d7eHDsWEIfJoHQs8h6HXAynS+TS59gw36kpdmyZ5Mtu4UCQuPIZ/wGDhbaz+t950Q3Ji41Hm3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eMz1ugPV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eMz1ugPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C951F000E9;
	Tue, 30 Jun 2026 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782830297;
	bh=eqxKC7y31kgloyrgermctK42iM3drUWTil477SSzdDs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eMz1ugPV+JIJQb9cAyopUUEQJ/os7+yXnZtU1KKX8E4VevCIrE0toBKAMSD/MjNE9
	 daJ8FSdKodVQjUUxyGsupaehRIYSdTcPYpam4+tDOIWgIKKPI7m5qCbdJs6C00eMST
	 Rs7RsT3/v5Jr04D8ie5S6wjk/B3pa6wM2WhGKgMzmWBXwGEdQ7/AEsGCN3j7TyrOb8
	 tXBamEoXsaUSbBnTxUTojmOCSmhNz8+Y8jB3+U62ycYpSvb/pvr0e+YzOoLIZnpIxk
	 cNrNBUx9QdVhbRAYvwdQWYgbzp54DrHjJHhlOXcItlIrcNt68YaGVJl1HWGXawUNFC
	 jrMS0rAl04rYA==
From: Thomas Gleixner <tglx@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Sneh Mankad
 <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
In-Reply-To: <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:38:14 +0200
Message-ID: <87mrwcqejt.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
> @@ -336,7 +418,8 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>  		return -EINVAL;
>  
>  	pdc_region_cnt = n / 3;
> -	pdc_region = kzalloc_objs(*pdc_region, pdc_region_cnt);
> +	pdc_region = devm_kcalloc(dev, pdc_region_cnt, sizeof(*pdc_region),
> +				  GFP_KERNEL);

No line break required. You have 100 characters

Other than that nit, this looks sane now.
