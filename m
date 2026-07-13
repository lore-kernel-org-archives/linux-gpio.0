Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE437BE71;
	Mon, 13 Jul 2026 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928117; cv=none; b=amTk1+IIx5b3L6hLl3CTGzcaC9vTcrcVx/6qLJxOxjbE5sm8MPd/sBPyb5dc17GJUP7zau3hy76IgAbOxSIqN1uuq8QMqLjh1RvW5LE7P++zHKkfshz40yqcNbUq8FacMkCOpLdEROpvIaIKfoXeAg17mNpUZHOtyVrMe9iLGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928117; c=relaxed/simple;
	bh=yMw0NCgwjTkpMczVj1/nRmFXG7mAF/3to9PqyCZ2BVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ManjoePH6hqVZ1jrIOrtO8NmoOYeU5xpYeWqUSw5ywsMgr+Upqv+hur4/lpf5Hri8O3m/2reqKTHkxecCEjv3hLzP8EqDlWb68SKx8f3B0szwex9xp8P/F/MJPp30QGvYWXlF/KOacG+IdjZKujHYIDcDYilElZe5Ex4vmXE2+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSZqzrV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSZqzrV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F6F1F00A3D;
	Mon, 13 Jul 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928115;
	bh=EIw2BCcTyrAqvybZP6qCfsnARhDfIWS5/tpUpJJR3CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSZqzrV7G2b5txZPBXw/5gEKu5V8zJeTh/qAVraJT7A8/OagkLNYIGIQRNhKZI4PA
	 j0zKeQ2Jylb4EVdjfow1luPl/VsFGKWaUvlcBEuMmYVYKpCvbWUlg/q1XoP0xkSbBX
	 421dggl0kNTWQV8CkMwCryXAuV7To21EwND7YKIDINYVv96CrzmXVEGsCfgTUgTlnh
	 jr/GXPxAoFOPuMXr6TEFh7uKQkpBwg2DQhiR8fL0aoWV3L83FSTMTTShH8uCmAvbzD
	 ssZASH2hr4jcY1MQeqPoWT/rSxZnC15EVZWi4xzz1+xEK7299xS/EHvvOrYWh/nDsG
	 KRQ9JBX8aEUZg==
Date: Mon, 13 Jul 2026 09:35:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikolai Burov <nikolai.burov@jolla.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
Message-ID: <20260713-gifted-loyal-labradoodle-a54aef@quoll>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>

On Fri, Jul 10, 2026 at 06:00:23PM +0300, Nikolai Burov wrote:
> Add new DT bindings for the pin controller found in the MT6858
> (MediaTek Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
>  1 file changed, 190 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

