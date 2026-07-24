Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E955412BEF;
	Fri, 24 Jul 2026 12:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784895899; cv=none; b=Bl/Nj53k9noAYHzNGBkM0JMRmjpXxnra+Skn/yEeOy9XKs2MJze8rjJmI3HikpFXEGT3urFYjxSnSZJbUKlFF3z25bFjS10X31vFVuLWjTCI8n4GjxA74VeKBq3+ntEqZ4EO6fGkMrfOtMVUr1QNWhVJ2xJ7CbYkUEk51kaAxCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784895899; c=relaxed/simple;
	bh=bS1CDh+2Qn5hpHQnRIoCnLbebTACj8iP+9ZHQacVIxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2F0ET+HuguqSI/xcRVq8mAOOjdh4oXnSWI2tego7JBQqcGJakvD8lGt5PMzTLomz1OUQcvYqEuXXFYHhdrSQRqSNpXzMjymMB3CIaJwSQ9UH1DE1zV+CXPMVa1Jqp2NV8WYk6f/deNrulxxCjBB1zYu6QT7mLOCSeIPMSSSwY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EEYeAO7g; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EEYeAO7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784895895;
	bh=bS1CDh+2Qn5hpHQnRIoCnLbebTACj8iP+9ZHQacVIxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EEYeAO7g6EJLonaF6x+qTb/XkpP3ggmZpsC3zmaR9d2oGLsa238Sv1iF7CSF1WzLV
	 chjxd/j+bbM1awMByBaLk9/Xpk4sVljL4+s/iiXZxxGvV/s0dkA26BhM0j2lrxE5OJ
	 fGrXoF851gyF2Os0C6sUF7nqZyCwQfRaBR1jlp9JTeBXnbaGKDCzoBzvMYImAD23ks
	 BpghihiPfSQgKlXjTRg0XOdVD6zQ/WsS3Wm4A28h9Zz+h3rQbwv7Duh1Lg7+5iSEDu
	 v/g0VFPIDZSyEb2Lc56QcMtoK32Tt2J3yJHShc6qWrFjOweYZTGYOm6dGcbAy7Vp4O
	 GUXvxYXgwcziQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6855417E00E9;
	Fri, 24 Jul 2026 14:24:55 +0200 (CEST)
Message-ID: <8088ac34-4f1e-4c87-8718-77d4e6e6e9b6@collabora.com>
Date: Fri, 24 Jul 2026 14:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] pinctrl: mediatek: mt7986: register both platform
 drivers from a single initcall
To: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
 <20260723035823.2041832-5-justin.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260723035823.2041832-5-justin.yeh@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 05:58, Justin Yeh wrote:
> The MT7986 driver registers two separate platform drivers (mt7986a and
> mt7986b) and used to call arch_initcall() twice, once for each.
> 
> This is fine while the driver is built-in, but a single translation unit
> can only provide one module_init(). Since arch_initcall() expands to
> module_init() when built as a module, having two of them would break the
> module build with a redefinition of init_module()/__inittest().
> 
> Fold both platform drivers into a single driver array and register them
> from one initcall using platform_register_drivers(), matching the shape of
> the other MediaTek pinctrl SoC drivers. platform_register_drivers() also
> rolls back the first registration if the second one fails.
> 
> No functional change for built-in builds; this is a preparatory cleanup
> for enabling module builds.
> 
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

