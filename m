Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F19D3F86E1;
	Wed,  7 Oct 2026 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405698; cv=none; b=SwhwEc3LxPX7LCIyF/RBpWmsR5ViBHGsfUSMIYt1x5BZS0+oF6fAABk+/vhXJL7x6lMma36Y0fzqp4qpTIEyMO7BvsBLXbPPK3SyuNDJlrzzwl3NJXYAXdm9KYg1ScSDZwDAvhBUbHp1n9K9u/LdbG5k/G7eT7sSq0VvvqtkOYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405698; c=relaxed/simple;
	bh=1pzvtpSh+yOxiFIpu9WnOaZlxBnGOTgPepf+RLiN8zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXu4SDoMbnj8fn+nzroBy5xth6f9S9vB2xmmQbQCpleq2YM7DaqTb/65jc5MID6YEFEs/yW+XrPJbHs9JvU4C1UTR2s2Caq+gBdHDwcWw+CZALf0NGfB4qSJT0uqUqjr+0SyQhCgqmr9TB3iVzT0EnLJqMLyMvCcimyFmMkHOUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VA/qr666; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VA/qr666"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D5B1F000FF;
	Wed,  7 Oct 2026 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405696;
	bh=E7GHKs/+rU6QX/UK+ptVMR+q6KVloN3C+fXipgzGtNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VA/qr666bDcGCiGkNwuSakG6ABOxHRkHptD28tAHut9dZUq/mtzRu3AKs3YhoVULr
	 hHP2eR1JqYSwQ5uJgN1I+nnTsHvt59BNZysyZ9gEAB9IIBr8gpdxROitI7bA7F/qPR
	 HWBW7cAmuPi5s96+xgH16TKibF4OEt/VLTnzCcm1UEpgV8lLRDErRyQgswP5PlL3HA
	 3CkByHDuB2Ez4y3UtVkOd6DryRob0cKSWcAGgwPyhSxgH3cAc/3xZulsT0qubbodq8
	 HSbopRZxUE1qFrp7tTp5YDAdF1tBUBkKK6Gq5OR9nFkkb96QNiIWYtPd7KyUgdxgIC
	 hQpGzXsvKZo+g==
Date: Wed, 7 Oct 2026 15:41:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
	devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: brcm,nsp-gpio: Convert to DT
 schema
Message-ID: <179140569536.225256.15729083704635110285.robh@kernel.org>
References: <20261004193647.182052-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004193647.182052-1-rosenp@gmail.com>


On Sun, 04 Oct 2026 12:36:47 -0700, Rosen Penev wrote:
> The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
> documented in the legacy text binding, so dtbs_check reported "failed to
> match any schema" for the gpio@20 node in bcm-nsp.dtsi.
> 
> Convert the text binding to DT schema. Beyond a direct conversion:
> 
> - Require pin configuration nodes to use a '-pins' suffix and GPIO hogs
>   a '-hog' suffix, as the old example used arbitrary node names. No
>   in-tree DTS has child nodes under this controller, so nothing is
>   affected.
> - Document slew-rate, which the driver supports but the text binding
>   never listed.
> - Add #interrupt-cells and gpio-line-names, and make #interrupt-cells
>   depend on interrupt-controller.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v4: rewrite to add extra stuff not present in original.
>  v3: add additionalProperties
>  v2: don't drop gpio-hog
>  .../bindings/pinctrl/brcm,nsp-gpio.txt        |  80 -----------
>  .../bindings/pinctrl/brcm,nsp-gpio.yaml       | 130 ++++++++++++++++++
>  2 files changed, 130 insertions(+), 80 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,nsp-gpio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

