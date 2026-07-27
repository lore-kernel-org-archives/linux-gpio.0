Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8C1428481;
	Mon, 27 Jul 2026 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183251; cv=none; b=J3pFmmDMEMWz+sTHikigQG9PDzPBTCsip3HWG6whdREkTDRKLR8lENKREYbqn9CwadvKf6Zd3pIN+0B/+qtsOE9qNAPG+z3NmsuOBJIOt0ZxEbYTGFsj+DTHKmOov1oaoFQCxUY20tq8JVog0tA+fveiZtDgBVkrJeKmiLUYzSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183251; c=relaxed/simple;
	bh=t10LDD82XwrOtVaO7ZJVSu8lJ2IMTbdEHauI3Nd/+uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPyahOQEaucYWqktGZHkBSKwf5CncUr3/CoiXz2gv/mnJTgOFeIiB4nlP8ZjjJM6KXYzsAg7uN8crfxV103L2tVhKPUxERxLcpWF2erlcNAiPsbnrNk+AOeuTafltu6bTCAgnUdK5V1MGtqvwJGS5rZcOeNXaV7RMK9k5jBWZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxEGY8Tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxEGY8Tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932B71F000E9;
	Mon, 27 Jul 2026 20:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183248;
	bh=t10LDD82XwrOtVaO7ZJVSu8lJ2IMTbdEHauI3Nd/+uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dxEGY8TrfYCEfqkblWiu02WRjBRkFEKI64fkLucE5JCdKAODz0XRDSui7rvo4HJDc
	 6eQ7E/os++Bk5I68uVV5EtsqUaRwsJxwrfQGNHXVqbnICAiU5Vx1DzhjmqbPIMI6s9
	 etVlKxhYMHKU589qOl+yvh4FUiPbdZwVjWn+rqrqUnNNxMoOzoBmj4MRy1dCrq/f9W
	 MLeYfSWyfpiskpmJnv6zyhRY/qg3PqkFjV8YtP5YvYEN+HOqEaE3v44A2VdrfpvRJz
	 Xsiwx2ywJ0Ndnl63AMVnJdt426YCi5JZ6tcEfoDlF77TClZsbBk1lEDgqNTxipOzIt
	 u4caS7zlg7fGA==
Date: Mon, 27 Jul 2026 22:14:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v8 28/35] dt-bindings: pinctrl: airoha: an7583: add
 pon_alt pin group
Message-ID: <20260727-stalwart-ruby-cobra-2ea577@quoll>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-29-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727174141.664933-29-mikhail.kshevetskiy@iopsys.eu>

On Mon, Jul 27, 2026 at 08:41:34PM +0300, Mikhail Kshevetskiy wrote:
> Add pon_alt pin-group support for an7583 pin controller.

Why are you adding one line per patch? Organize your work properly, so
the same logical change - adding missing functions - will be in one
patch.

I am dropping all patches from this series from Patchwork.

Best regards,
Krzysztof

