Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338763;
	b=wuiURtP3JlTSpxd1qu+DbR51y3kD4P5E5GVKMFaUlC2lgLufvBGESPYKo4Ty+AXalUQO
	 4nTXsw00QzrO0admB30MSVAGWELEWIJuPQ3ttLXcRb+VfhPRWn1tzg252kO/AWEaJ6MOO
	 iza0mmhhCYER9tsA3teFU4s7LRh7iJjbLZWD6JGekymYnJKj9U3Ncj0QEUTfQWB8S8+cw
	 wbp5Y4Ae+PKXG5uwyXOIWHO+RruvDuUNp9ZIW0pfPHQQyhv2Kgtl72l04MZkgYR1KuMxi
	 QKgM7uzStIZFbrgq4tribOaxaFBsqOV/17N4Re5+pArBwltMQu367r6a4aIhSB5Vaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338763;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2I8vq1te86R5k4Yvi4aSwE2vl91WuDRteqWewLtKBQg=;
	b=4x3OsVgRc6WMagFEo9C1HdWOr0IzedESrljcpCtxgxj1OwTjphvWvCC6bf3Hx+2WVuAP
	 py019/4UKjBTkldMuNKTFDXRl4+FcL5nPDF3GV03Bv7yCZUs44VOVI8c1bj61YJtuHZpw
	 6M85PP0//+jnAWJaLLdPzEoNQFTwveg0sCUNmoAwOPkn7iIKiaLFuxQ45O6e7ioWdYq8i
	 3R5d76c0S5mO3OpduLiG+2W9xMjKQ3sioLGblabGcL/trfGAQUqZBvSduMaCDwm5GIrxU
	 mM+3heDWi7a3VvzLinXAGTOM50GZ6cI6AE3uRiKAjzQwQ44OwVKwx5cJKleyWTZb4EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lQ/+0Nxm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6395B606A320;
	Tue, 10 Nov 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lQ/+0Nxm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20101F0089F;
	Tue, 10 Nov 2026 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338762;
	bh=2I8vq1te86R5k4Yvi4aSwE2vl91WuDRteqWewLtKBQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lQ/+0NxmYvHxSfnSIONTHNAPyURfbEWLrhrOoZJO+2LDWE5xgSmkLnzeiZkASZHeH
	 5o23T5MNbRpKaR7CRy1zV7x68/7qCQQ/ba36ep08wwkca0Db/mEZn0dpmdrYuJTTGs
	 /BW48Jh+fw2tDZFQn24sj/fKvnu7a+BdNcDp6ywgfHBDj6zQeA8ERNyjKEyYt0Rluz
	 +4TvuWD8MGB8c7Ytwr1Wqv8zUMmOKNKcLhNI0NeQ0WGHmeAlMn+6FTZGuK4uyh7Zt/
	 7tGKSdGa4byuApcbhVslzDwNy3HtdzHh31lywsBQWZeRql+bUmFKnm3sZbEpCeMeXs
	 lNiwO/1U9ICFw==
Date: Tue, 10 Nov 2026 13:25:58 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt
 per implemented bank
Message-ID: <179433875840.1485523.100233134463965104.robh@kernel.org>
References: <20261025142412.112216-1-pmazzini@gmail.com>
 <20261025142412.112216-3-pmazzini@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025142412.112216-3-pmazzini@gmail.com>


On Sun, 25 Oct 2026 14:24:11 +0000, Pablo Mazzini wrote:
> The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
> implemented, and the driver no longer counts it. Go back to one
> interrupt, and one debounce period, per implemented bank: 10 for both.
> 
> This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
> increase IRQ banks number").
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

