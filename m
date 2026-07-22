Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DDD33D6F0;
	Wed, 22 Jul 2026 08:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709358; cv=none; b=sgEfbwACSYVgcOtN71lBUfhXp+fQanas6VKK9rGtlhw4VCYCF6X/6+KChXsdBbQzY28eHUCFQjqphGlbDt20ACRUw5IKUPZ8xYtoB0NfFOSRJHooxmsh65297HpjIdJhfpGb+4VUQGqV4QCuTZkNul2k5uwh4qcO22i0yaKzw1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709358; c=relaxed/simple;
	bh=WD6MXlBWYlF2tyZhCnQGVXS5jehdKt/r6vLrLtoVMrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+DLg3KHMruUIxWMHA8SnQVZXTahk77zLodB9Mk+3IM7aoushy78x+ZvVvPF1UrPb+5WMq3CliK3u+QDrSwBZPY7Vbxr7yXlNar2m5lypDuuRYb88AK7BVIz9gGCw7Ka/rEUm4KHmrHwyByWxgpxFROEcTKQpKRNtrEgFNhLii4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EtOzt6ln; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EtOzt6ln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784709355;
	bh=WD6MXlBWYlF2tyZhCnQGVXS5jehdKt/r6vLrLtoVMrU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EtOzt6lnh2uAXYLGiDylE9t8kz52gJ/syahT09WiSvMnliHyFv8xYcuembWrrlKiY
	 mnJWwxyzjfgmppCcGdT1JJ1hAt1iWH/zW71UoYhqdbmFhvPwM4OIIQHlmF8X0OXX/U
	 2I3EAXJrwuW4vdndh5q5974a6qm7U1rMzq7d2Iv0dK3HSGOMcZv/h5iX7KKTbLtmx9
	 v+djWb5Wh6g+kQydacjSE7QMZMuzsNAGId+Q9lUc6KoQJ1/d8FR3QnGFiv795oRpiV
	 n9N0AC2r12gAEkEmlls8TWoRMSKYRpHQN+N5i96x93O/jCJgliyu/270SELHeqWMPj
	 bOv2C34Bd/Q8Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1A8017E0FA2;
	Wed, 22 Jul 2026 10:35:54 +0200 (CEST)
Message-ID: <10f4ec41-5f90-4b19-a59a-26a76f533a77@collabora.com>
Date: Wed, 22 Jul 2026 10:35:54 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] pinctrl: mediatek: allow common drivers to be
 built as modules
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
 <20260713083808.168957-4-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260713083808.168957-4-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/26 10:37, Justin Yeh wrote:
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

Some of the pinctrl drivers are missing
       MODULE_DEVICE_TABLE(of, [match_array])

...therefore module build will fail.

Have you tested compiling the kernel with *all of the MediaTek pinctrl drivers*
set as module??? :-)

Cheers,
Angelo

> ---
