Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A61B946C;
	Thu, 26 Feb 2026 18:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129147; cv=none; b=VBlAUj7DHnXFohjORW1W3lYZHFG1nHYSw9O7KXIN3JyaIViLWpibbO4j2z9fHeKZoHtQorgIaBvTbCUUjhXapNVLi7r1+aTPPhH2+lgbLxsfUAF491ItpSdNpyyRSjUOSmoFVpzMRu1dvVpt+h8uF08oRSyg/h9QBP9kkgeJIlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129147; c=relaxed/simple;
	bh=FXHYBbqbyQJvXr779FbE0V42MyWUxyz52aXt9CzkWSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lX5jvss9OSHXyHU7qTjog3H5Xj4S6eCd9ThSRDOk+Yeh6AhOlWpjR4zBrHyBe4rcZPoQLdfNRuzywaH3t5vGwclLWXp9m91142oOjNkrdxFPGxH/52dyjPmcFP7FZO1AABEWqKk/tVKOWyKanTE4xT0eMErRxW1c21PLMfiVpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYXx2d/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYXx2d/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CB6C116C6;
	Thu, 26 Feb 2026 18:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772129146;
	bh=FXHYBbqbyQJvXr779FbE0V42MyWUxyz52aXt9CzkWSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hYXx2d/po9WcXnY/p0QyTY4LM286jmFyy4wDEIE1edsfNcSQ5KRcG+YNze1noXDW4
	 zDkpWSCVGmIME7yswd572XI95JX9YYLGYZD/BmXvp98qyfanuFNsu9zXZEi0KOjQhL
	 8QawFWhhKkfc1xQooYI+4ZXv9lDA8BMUIXov9LZaY7Zn4Y0vbBt+Dk8hoDvlsoyxPk
	 lJkfs+z+iNcAsUICB0VQxPNfUqvlxi92Tpxw+5afk0X6EvthJ99ifxoD9U1BQFCj7G
	 zJDVQD23w44SG+/G1+GP7wRX5KL8fnZS2J+Wfjgm94fdxebl5TyA8lj6khazX8X47H
	 yx2477rWofFFA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: (subset) [PATCH v3 0/6] Microchip mpfs/pic64gx pinctrl part 2
Date: Thu, 26 Feb 2026 18:05:36 +0000
Message-ID: <20260226-passover-doubling-4404f4314b70@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119-rearrange-germproof-3e3096cc0da4@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=640; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1PJXFrKgqDoVzDD7Vldh1cWt61RnAZzMwRyK9t2R/LA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkLuvPzr5onTkpg1X7TeODNxLoJrBf0y7SrBK+XCWzN4 tif2SDYUcrCIMbFICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl0cTIyrCljFH2cPPNdypH3 YRb73upPSRKbcWlpKod1jetj92uPXjP8Uw5Jn3mvPfJc7oHcpoxp19n3bWwJSo7Oer5mM1fStiO fOQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 19 Jan 2026 11:03:51 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Hey Linus,
> 
> v3 here, with the rfc dropped. I've still got the property checking
> stuff in my todo-list but not tested it sufficiently after the changes
> to add generic string properties yet.
> I only moved my drivers into the microchip dir, I'll come along and do a
> pass on the rest if you're happy with what's here.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[6/6] riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit
      https://git.kernel.org/conor/c/7982b62bedbb

Thanks,
Conor.
