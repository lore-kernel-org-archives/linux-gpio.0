Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B44BD0FB;
	Mon, 28 Sep 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601696; cv=none; b=WBR2fH9Y0suC4VjHlFKGxDb5Xws2fY44r9FO/XECpZ45KXkjCW1rd0zducj5w9ZMQVBSjvs5VQkKS5TGf1iQmamHdK/XeT0Oe4H+uX0It017mmLS/HMj3MIA1GgHLD1VvnB26533kl4d6vU7bEDTawsEcO70XZ3R+Nzc2fzkbBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601696; c=relaxed/simple;
	bh=oPh6Z0d+bsuFErKPqq5GGxjmKgBzWoOJsdnpmhS2UPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpRiAJgaOfEluKT/eep9kvtP3HsBdCpXI+m0IKfrMCxHxqz4yFsJA1eVlOJad84gJCD3xYARstOxng8PLkaRlY86s2t20o5buCcBI9MFm87/5IWp01Nkep32/iJMK+3jiSs7WbCc3NDISKTTWSTVwV2g5BMEjY00wWHeTsUWZR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBIWwKhK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBIWwKhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEAA1F00893;
	Mon, 28 Sep 2026 13:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790601694;
	bh=HEjQlrzSz/9hZuS61/C4rrXkgZDZGf6FR93QXOJ5zaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kBIWwKhKOKv0kENXFht5TnHNyc/xxKjRaW/+GLhf57CIOyN+wF8fOqR/FxGJes4Er
	 LwfWrpPgvf3Tq7TshK9fauFjWnKX5mSJ4kZI+OsZhtBf2MumTuIdz7ZLzbkbKEHJWx
	 C0b8ogppypPbIxH6jfGNgQTH8wjTehOK1BeVh2IpB+20YyJxMHYA4TtWQx/QbHjdl9
	 m0utuPUqZ3GcfP2TkVaNGSMjm5aQJwLukKkxkvGqbHnCApNg+H88AXrCWGVLdl+JIG
	 F7nNGtqBCwftqTt7/ZPFmRlvAgkduXpNIGqoZBMFuttMBEtvbN7HpuIGbk335C/F4A
	 RZVTkB3oxT4/A==
Date: Mon, 28 Sep 2026 08:21:31 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Message-ID: <20260928132131.GA3950360-robh@kernel.org>
References: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>

On Fri, Sep 25, 2026 at 06:52:57PM +0000, Yassine Oudjana wrote:
> Change "subnodes" to "subnode" in subnode description for better
> grammatical accuracy, wrap all descriptions at 80 characters, and remove
> literal style indicators from descriptions that don't need their new lines
> preserved.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

The threading is broken for this series...
