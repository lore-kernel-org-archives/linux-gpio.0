Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103B470EB0;
	Wed, 23 Sep 2026 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152915; cv=none; b=P15MdReiX6r2aBNz9a4z1oF8s+RgAMFVoMhPUReRzy76iEDAp+CFK9fdq/CDFwsU8rIJmKJ4LwjO7EkEIjdpyqwMnSSCVWu9txDYfc1yX/p/eGZjqzBkaWydtYhB/mTLmmA+upbem0vSGxMvBLZc20P6LFswx4Uyy2WnRCtmg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152915; c=relaxed/simple;
	bh=kX7iAJmyO1bpwYb9DvfVL8/FEwVM8F0j/LnFmfaVzfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wmm9BT2/vcYSjRAfgp4cAaNulh7UvNtydmY3fGgMoLHvnw5FY7OKrdd+qA4GkUEH78mKrQcpxJP8aKD7FKPOzyh2DGHCvzxJcPGTu4qci9+znGgAp5+nMB3fOcmucjbnk3XhauCjFOn0b6d3D13GWOAeA1iCWGVPiSX+kFPlDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CLbDwQrs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CLbDwQrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790152901;
	bh=kX7iAJmyO1bpwYb9DvfVL8/FEwVM8F0j/LnFmfaVzfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CLbDwQrsmHZlSe9YtZAqw5iEfdQV50RBuBtDTODU9KZDn7ZTbkKDblU27B+7o8Qg7
	 FyGJ1MSGJBNqhiKIIawa2c3dHM0OMxLxCrtrSlIqc7yCR2idaEZzXtt3NWNUDIMy6X
	 F0+0+6OdoTifPeq+93kTxhC35vmyoRZZSxk9NNpgiaV5a5F/zlv+BrbS0IJ+g03wx8
	 nS8B8kTe69po8si22A5IqAuh5BJ1ZUQZf7pvARJ4ZjC0vpY/rlW53pX594jx9tH3Tq
	 BMq5QgGroEmQZxZqWKZX1pg5A48vlcYYBE7qRerErMqYoUJypM5hxa5xWMiTMs2e2K
	 lwH5dfiU2S9Gw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1D8B17E020C;
	Wed, 23 Sep 2026 10:41:40 +0200 (CEST)
Message-ID: <452ebde8-d2e8-467e-8121-69c96d7dd0e5@collabora.com>
Date: Wed, 23 Sep 2026 10:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: Fix MT6797 pin nodes
To: "Rob Herring (Arm)" <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Teng <andy.teng@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260922222439.1682749-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922222439.1682749-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/26 00:24, Rob Herring (Arm) wrote:
> Allow MT6797 pinctrl state nodes named *-pins directly under the
> pinctrl controller. The existing mt6797.dtsi uses nodes such as
> i2c0-pins and uart0-pins, each with pins-* child nodes, while the
> conversion only allowed numbered state nodes such as foo-0.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

