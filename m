Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6953DDAF9;
	Thu,  6 Aug 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000335; cv=none; b=pSjR7tvzayKa4ei9+l8hy3PnnrAE6gW8QVRdVHb+InLcGx4HirIOw6IYVyQN8BzPOEB0h+iuDw0sPM0bFE3yF+o3ERwiknYw1Y1HmdqtCgjE3FFnkRX/hZ6za5/yMhxHk10xcGCWh/Dq3EbtdX80BeDXq2M7VPFmXMcBfuRYwP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000335; c=relaxed/simple;
	bh=DRUJgTFf3Z71bCJJ5kneAi20KrDnWPgGP241xMLpX3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3NtdVr9HRv/47VfPZ4c26EpHR9zDfcCm6KE3VV0DENk2ZGO+o1TxyFhetvIvfCSiSxnzRKY2WFLw+T7THUfpk4hDG0iw8wYrsBglYdK/6W0W/dzi+8LUmfbOrFjCwbfqzGW6+IqMRmAIXvEtbzAcCGWJQltOHxj6bxd/2BVh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0pEO5JI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0pEO5JI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B291F00A3A;
	Thu,  6 Aug 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000334;
	bh=WpVM/b9ChkcZhLidnj7GV/0zthZKodJLUBqWI25jIh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0pEO5JI5OXPlf8SpauwiywtF3V6Ud1rGIiGNEvEthQBJmiMy1OXGDyMy0+FI8ZPb
	 l2Rr8lW0q8eKXzez9lhZS5tfZdv5sDyg7W7f5Hy+7Jny/yxmrOFAtOzGOT/a158gyP
	 LLLGV8u3wjmppsdYjJMwWledPpnyIsC9fTUFI2dSnTDHpd8BbugEHK/TUw5Az0+ya+
	 Lf9qZbbJB6/KMtzP6XlaYwxNfDMcHfQw8j0x3eiLiG1uX4HCR8qrq4fqqN09Pcx/hv
	 bkTLHlMdHTwRCa9Y4otp6WblfqQYEBNNTPqy0SwCru7vFi9edoVpiW1ZkuyxDpvTop
	 E2LwFl7ooq8dA==
Date: Thu, 6 Aug 2026 09:12:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Subject: Re: [PATCH v10 31/36] dt-bindings: pinctrl: airoha: an7583: add
 missed features
Message-ID: <20260806-muscular-tench-of-elegance-8ec390@quoll>
References: <20260805123408.3767648-1-mikhail.kshevetskiy@iopsys.eu>
 <20260805123408.3767648-32-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805123408.3767648-32-mikhail.kshevetskiy@iopsys.eu>

On Wed, Aug 05, 2026 at 03:34:03PM +0300, Mikhail Kshevetskiy wrote:
> Changes:
> * add i2c0 pin-group support for i2c pin-function
> * add npu_uart pin-group support for uart pin-function
> * add pon_alt pin-group support for pon pin-function
> * add support for olt pin group/function
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../bindings/pinctrl/airoha,an7583-pinctrl.yaml  | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

This is still incorrectly organized.

Please organize the patch documenting the bindings
before the patch using them.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

With this fixed:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

