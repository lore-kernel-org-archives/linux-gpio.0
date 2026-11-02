Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646991;
	b=jQOedbi10Wt/DjOYSDE4LI2H4mZEHMzgBHmf2uA1EcCUmFkkcFoVA0P+0ls5JK1oUr0r
	 yaOzhV8FqLOhe5MYzFVN0eGZEk0Z38996QfQobox/6pHf33FMtsUUaH0RJQpbzBtS7kio
	 rLHgfiT1AoHd3bp7lzsOkWGpyLW/g5p+w8YyqYPPvVH7PXT2khdSmEeGo7ahImuSGMUwN
	 wXUuI3dsu0oRbgMZnBSKj2iIqf6y53j4OkW0KainCi9iVlQ2lbSg6PSw19gWiJ08n3tBJ
	 S+T38MbI1A1WV1uLhhcUBF4vrtBKMBOFjXFd/k6FzO+EejGGptgucej+HpodrisYhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646991;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VbAaauU+tOjWUhy13M+E36i6rI1cWNNx68RKW+3FocQ=;
	b=NJA3nUZdHO7t93UVAqzU0z8m4TAe4b84UeKlMD3XfLRWF3PlViJFpGKUEJNi1cq8z55T
	 lsLIMRQhnfdkxk1ClTcIBE3lPwn7DsGaHoKXxv+XMk5yTsQu1CGGBWoUGtgHKqXNOGq+w
	 IW6SG3+yyxRLNhxwCWL66VdPAeywqPblxwdXe9auDEoJhRSRyCF5G951cZ8hdyCgduydq
	 xfC42Dzqzu06oAfs1xW6r66VtQt+erDl5I89rEZjF9hoYyXF5Xdckywo/gkEcflAWy4Hk
	 CLCPUgB29meEBZ5crOkjzSkO0Gavp3WV4Uq1XfY8aqWWO8CeznBUZ/0VQ/Kn5JsaIZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDu0+tIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476F606D812;
	Mon,  2 Nov 2026 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDu0+tIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC061F0157E;
	Mon,  2 Nov 2026 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646990;
	bh=VbAaauU+tOjWUhy13M+E36i6rI1cWNNx68RKW+3FocQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UDu0+tIg0nx+V6+xDSJs8thduUykWOL2F2oShDpZKNBFu1NUv9poV+V23KMDTFNvk
	 wSEvWtETln2mAVoevNNBpPXIG0rLKOq8Q+msXIYOolYSekNQHHcN+IqASL4u3kk+TV
	 7tlZl+PxJOYfsrcKSt7wX1DqdS14Rx1oil8CYcQcf77AmXxJNGYgzryHxBM/mmH06Q
	 i7WLkUJZSdV+8HG44KhkiB+17Gzf+Z/1wiM1y203VZF4Q/iR7VM9HR+Dx3dt9gvwM+
	 KIu4jSJ5sCgb238PRJIotWYq2DyqEs3VrxllHDTTi4rf916nwVtKBdyNo2H0/FHjFo
	 CrvbqItaIBEWw==
Date: Mon, 2 Nov 2026 13:16:28 -0600
From: Rob Herring <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Linus Walleij <linusw@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v10 03/11] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Message-ID: <20261102191628.GA834063-robh@kernel.org>
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
 <20260928-rzg2-sr-boards-v10-3-91752ea39cbc@solid-run.com>
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
In-Reply-To: <20260928-rzg2-sr-boards-v10-3-91752ea39cbc@solid-run.com>

On Mon, Sep 28, 2026 at 07:33:54PM +0200, Josua Mayer wrote:
> Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
> described by one node per speed and linked by peer-hub property.
> 
> It is however possible to install this Hub to a USB-2.0-only host, in
> which case the USB-3.0 peer has no place in device-tree.
> 
> Remove peer-hub from required properties.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
>  1 file changed, 1 deletion(-)

Applied for 7.4-rc as the .dts change has already been applied, and 
Greg seems a bit behind.

Rob
