Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243329405;
	Mon,  7 Sep 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772507; cv=none; b=vEEqXg0OB6rvbUDxda6fKFZzlU/Aeg9SbQNWxjz8vhWkbwWwIxZqfNmpZPRqGIDuKBiL+/qn2okFRByPYb/VhZK4Xx6XcUKL/B29lvanmX3Kph67uI0ezRRgmOKAiQQCmyqGsvhZl+KtLFjew7Vn+vvOVwVu8G/nDyecZTOEUwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772507; c=relaxed/simple;
	bh=yAZBsyqAUs5mrF94dZw5BTxiKBfvU5TkPnHaBKxFCrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPwplmofl8w9hVtlhMqojtTMYPQUXvM4MuWlLfl5k+EQZDQjZ7xDe6xXpG5SErcrMgFFoUpmP8kRZpXyfkPp3W1HtkE3GHmfPKm+O8Rh0eo1e0fTA0GnsLpJ6jaV/XLteeZd80nBxXp75FeJAHFxZ7/ORH8a+rQtdg1+rj2BZok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oDZsHBdd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oDZsHBdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788772504;
	bh=yAZBsyqAUs5mrF94dZw5BTxiKBfvU5TkPnHaBKxFCrs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oDZsHBddIrpQ1YJt7hAIxSHZzRGcMCY4t0+bAIUzbvZapgskn+gsYmxHXnr/Hbavc
	 9SsTTSRghDCriMKvdiOkYC00DSVpkprvD3EhybYRt1cy7tUiHJIrwWYvTGl8SIuAyw
	 Y+WXr9N5v4Aea4wAyBIPGbCt3pLOibMNkuPwtzFCMa7OCb3RoUDA0/ax1R13vadeZm
	 gSWZxcOuo/8enX5Nk1umBVGaPZ/CmlYQHb9fXUqfDxRY5QYrUEoC8nmG7r3j7Q/fzd
	 56YRkvm0Mkuj9JustA4wCwtaiWevDUiC0XyotMgXupiapDfKBwjKf3hqsDyWcJzwbf
	 4J1NrWiyPegaQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4AF3717E0699;
	Mon, 07 Sep 2026 11:15:03 +0200 (CEST)
Message-ID: <468b57bd-6f82-4dc7-82ad-71838b6ac12b@collabora.com>
Date: Mon, 7 Sep 2026 11:15:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-2-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-2-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 05:58, Justin Yeh wrote:
> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
> 
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
> 
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implements the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

