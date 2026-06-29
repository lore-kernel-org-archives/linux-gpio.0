Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B339B49D;
	Mon, 29 Jun 2026 06:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715466; cv=none; b=h8y+Qu9rtOIyaj7hczt9/z1XGhFXY5TBBTR6ckgO4XN1hXw8c2rJAYQHQk6kc8IuVb2abHK8lWiEk4ikw3DiVN/4YY/eRLZ00VE/1T5SBwEMkH/pSDCHGsZUEp5gPu5bxSEhptB3cAsHN8rObjo1phSO27sX9OeQjKtXa3oWewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715466; c=relaxed/simple;
	bh=gxya11ivfMHvj8VRFrdcKYcTfA4FRJ93BSH8V7y5QdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+4zhbfpFbiXipmaI8nE7MlfgwLG/mrfctv6A0Ck3nQ/0OZMilsfEsdS/78cr+B/ZVyP4MjG4/xB/TKIbeWrdVt9YckqqgcVTf2hx71cri4UtW0Uc81KV2DAWfZr/SIwYbDkZSCwzrhS/R1gy4QyM/YL38F0Uz/mnCKsqcODs5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E66D1F000E9;
	Mon, 29 Jun 2026 06:44:24 +0000 (UTC)
Date: Mon, 29 Jun 2026 08:43:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 17/17] pinctrl: airoha: add support of an7563 SoC
Message-ID: <20260629-natural-vengeful-doberman-7b979b@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>

On Sun, Jun 28, 2026 at 05:37:33PM +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha an7563 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++++

I could understand ignoring checkpatch when removing pieces of ABI.
I can imagine it feels logical to someone.

This I do not understand. REQUIREMENT to run checkpatch is there for a reason.

Best regards,
Krzysztof

