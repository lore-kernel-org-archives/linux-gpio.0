Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F173368A9;
	Mon,  3 Aug 2026 21:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785790921; cv=none; b=LH7CmDNeqOHbrFuKuVNeN8bxtoKAhHHuh9r3nnHyhU+Q2yxSbPsp+Ya5DZbV+zlMcNWN3HzuYQu8CzYc1tToS/TDUNByICfzoUDT7WMveNAwCPS8DKjbXIQ7eEuGb5fxxuvrM+TzL5lR10q8CIr+GrorrqYbHwfdXjYZwnFRUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785790921; c=relaxed/simple;
	bh=0JZzRtjbnCEUqsOeRvTcTCfw45rThLjS7V1dfHDHyDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoOWXqv7ZsBRTN2K2ldsReuAVuq7Q6Sf7kzihM8f7EgDho6na6SlYBXAFVjY4gcjt7YdYvn5s7mQz7JdHKxQUpPQsy/OZwtA2DW9DqEY1O2dzKVwlusv69MyWrFSr4xobq7KdU7tZfMIRbjt2uFPjM7200SVECalhMGaY1wkE1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+UfxwyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+UfxwyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82B61F000E9;
	Mon,  3 Aug 2026 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785790919;
	bh=K823aeVnLWiFC9DZSLy6gcKUdGvBcqjCRa+MlKVZBF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b+UfxwyIYwHvVlV/KgIy9kLBn9fV0BfcHw9WRoIIYuLWXrlG383xaR1XgghLw6VdK
	 Tsj2A07x9L6ZImRxAKfu52JOmYPvHBSnVzjLMIQni0oENLefZ0US5Bjt1Y77/NJOja
	 STQRQ71noarfGB6RaRk8+cZv2UediSIhM6MATbLGS2i669utkmZVE5RzijkuQT7JJZ
	 2MlyGGzX7vJJSYRee1cB34+ZXWqw0HrnUQac+Ou89l7sY64zYGKqxYa+0DU18vjYxr
	 f2siUxu9/76mAMxL6z8Xk1QMxnMMODCM99GyqFuUc0QOxLiuDsPQbEDtqOFiJltJjZ
	 FjyU1crsVDdqQ==
Date: Mon, 3 Aug 2026 16:01:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	simona.toaca@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	daniel.baluta@gmail.com, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT
 schema
Message-ID: <178579091859.459898.14250243901681967047.robh@kernel.org>
References: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-ti-iodelay-v2-1-995f55f605bf@gmail.com>


On Wed, 22 Jul 2026 22:15:54 +0530, Bhargav Joshi wrote:
> Convert TI IODELAY controller from text to DT schema. Document child
> properties missing from text bindings for proper validation.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - Add pinctrl-pin-array as required for child node
> - Support generic child node that ends with _conf
> - Link to v1: https://lore.kernel.org/r/20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com
> ---
>  .../bindings/pinctrl/ti,dra7-iodelay.yaml          | 83 ++++++++++++++++++++++
>  .../devicetree/bindings/pinctrl/ti,iodelay.txt     | 47 ------------
>  2 files changed, 83 insertions(+), 47 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

