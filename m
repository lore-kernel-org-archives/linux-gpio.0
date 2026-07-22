Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5F3B47E0;
	Wed, 22 Jul 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734054; cv=none; b=tu9+67Dya41gf+JRVZabxxfJkDyM2O+6LwiP9z1wNlhwxvx/0Hgn8T1ONMSh7QdUFuHfrOt8OXglBDVCDV9u1w6+Lr9G2DTICKXvXBPz9jF2pBtQhR1RLDrAo6/Gkck02TKPEr+4g2A6KS/IFToq0uO+mPcpNTkRbMaIlH7Bdrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734054; c=relaxed/simple;
	bh=qwsKUoYfZBB8tDUtKeH8fbL4Jc+zOssVP1wiLVGZqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEIJmyvD3sN82pJeXniOfqIak9Yi0hM8s26QbXKMBpkEY6Z69LMlgJXUslHk7iWOHIivJ8jk19D7D0EHv9nD/Mo9prZAFRokbCICCp6igzTYDD6xO6z9jGBqQzTUXPvI63iQDvc0D/CukwhtlilydVUV6VWX4uMm0GBjKLoPpPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQWM+KEE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQWM+KEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912391F000E9;
	Wed, 22 Jul 2026 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784734037;
	bh=dhUVTQj42y//P1Vg6BUOQL8RosJqKNOqghEIqM4Zenw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mQWM+KEEeV7Yvns05CC8tUwnqtwyIjIKVg1JkyYxYIqcZ8yV4pAfLmIn98RUgufR9
	 fHrs4zyb/4/q6nBbHsuqYQrI+USsAKtwAVfpx2p2EUOd8o5cUEHsFLwDwrAxGYsFOj
	 1am8Z/4enG952QU8/IemkYoeta9oaymVlmBaoW5S4B4UVEe2LbHML2jcOc+f2Bw351
	 3ZUOYu5DWJi+ExAqRWo2cdl/qJlLL4k+o9ObKvQPMiWIsa4zis9Vhc7ZI3GY/fzhOn
	 GFMBkOqvMWWr6vUC0nb1JhKl8XgRpHvTelHe/1Rf2DN7sEZM4qh5qxbLbN4+XcRtg8
	 xFQkA5cHbkBnw==
Date: Wed, 22 Jul 2026 10:27:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Message-ID: <178473403449.962632.12615541678335814089.robh@kernel.org>
References: <20260709193927.108105-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709193927.108105-1-chenyou910331@gmail.com>


On Fri, 10 Jul 2026 03:39:27 +0800, Chen-Yu Yeh wrote:
> Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
> name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
> follow the GPIO hog naming convention, but the mt7622 pinctrl binding
> only allows child nodes matching '-pins(-[a-z]+)?$', causing a
> dtbs_check warning:
> 
>   mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
>   'asm-sel-hog' does not match any of the regexes:
>   '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
> 
> Allow gpio-hog nodes in the pinctrl node, following the same pattern
> as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
> gpio-hogs").
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

