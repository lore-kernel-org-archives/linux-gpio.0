Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DBA39021A;
	Fri, 24 Jul 2026 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895884; cv=none; b=MGXpMF5m54bwfKa1FZkb9b6wDJhv328+zW7uKtWJCHP2Oso6k78h+W7h0vBxeclneYbedMENFB7dN2xfg+09k6SMI9NgAZ1NOW3YcdJbDW7IhzreV3ydVS+2a7EBYu4NjhBdTzRT8O8m2je14z/OXtW/jUspWxodilCeJj/IeGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895884; c=relaxed/simple;
	bh=dEDWWpyR8FmNBGJdtP04CKQ0RFI848qzfOTxhCXPXPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXkw88DHln/NB2j/WL1gklxneKd756leOy50EmZmHDORr8ayHofeqYcpLdDh6uLH8Z+2GAR5vZNIFzTfVMhZ+xuYlwT8udTa/gF8jJKn2pd+K0S2m/0+jSeuzxuzbYCcT6B9ThqAfnaRC3zrQhsXwdxxwU0Yxh7WVVSzx15wg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AzYEbfQx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AzYEbfQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784895875;
	bh=dEDWWpyR8FmNBGJdtP04CKQ0RFI848qzfOTxhCXPXPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AzYEbfQx6krtRQHaNAIOwFk8nhKzsYLxt3JEXX/vkaLkm2QFcLK/o8X3b5CU0TWrQ
	 Uotuap2mpYT5nj0Fgm0nBk19VwUQR8/TLCjh3x5FsROOnOZyQY9LYki18XcVlFEGeW
	 CzCiLxrMU/l8N0OkKKiIwT57qvSfYNfFEgI9/qcnBqiczfP63hcPDmzXyBb19s7HRA
	 eEfhw21kQsrabt/b9VRgiHFOGsi6xFk9AtQQP+EK4BBoWxNoZJIQuZaRoDXftY9uKa
	 tfG7GGbmeZoVovVTjtdVAMsMhKIK0b8/zcJ5j7g1n88am5+OuFv9F+L2vGVyrHh4oo
	 ySdV2xiNvbtIA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA37C17E00E9;
	Fri, 24 Jul 2026 14:24:34 +0200 (CEST)
Message-ID: <cc5348d5-3bda-42be-915a-476635708165@collabora.com>
Date: Fri, 24 Jul 2026 14:24:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] pinctrl: mediatek: allow common drivers to be
 built as modules
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-4-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-4-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 05:58, Justin Yeh wrote:
> The MediaTek SoC pinctrl drivers link against the shared implementations
> in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. These
> were built-in only: their Kconfig symbols were bool, they did not export
> their entry points and they carried no MODULE_LICENSE().
> 
> To let the individual SoC drivers be built as loadable modules (required
> for Android GKI + vendor_dlkm, where vendor drivers must live outside the
> GKI vmlinux), the shared code they depend on has to be modular too.
> Otherwise selecting a SoC driver as =m forces the common symbol to =y and
> the resulting module fails to link against the unexported common entry
> points.
> 
> Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
> tristate, export the entry points used by the SoC drivers, and add
> MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.
> 
> The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() was
> never exported. It is called directly by SoC drivers such as mt7623, so
> export it as well to keep those drivers linking once they are modular.
> 
> Rather than exporting these shared symbols into the global namespace,
> export them in the "MTK_PINCTRL" symbol namespace with
> EXPORT_SYMBOL_NS_GPL() so they are only visible to drivers that opt in.
> Each SoC driver that uses them therefore declares
> MODULE_IMPORT_NS("MTK_PINCTRL").
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

