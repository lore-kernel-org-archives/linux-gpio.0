Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1049F3264F3;
	Fri, 13 Mar 2026 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408561; cv=none; b=dl1WCKai07lrtEyuTYa2uNNwbuYsgVJCbX+GDmzVCsplUtfhMkl/vD8G5sXsYlkJ6s1GH+OZ1dFVJWPxhsBtDxxmq04V/5UmTomfRtQCHeJ8o3bSG2JVoTxlnHDuItRcg2UZPPirD/nPZw3lQg6u6GQEVoQ6zUuomGyhLSJaBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408561; c=relaxed/simple;
	bh=mHNhZ03zfau6eX8H6TCWVw0KXYoxPIRYjfKW+oWukeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TK343m7clF0DUllE6yMDaAtDoLaO6Y7q95/cGjeHXey+2xvLay15uye1zoapWHMYxn1LZ9H2+y2Q4i+TRVPKCtPPrEeJCaiIVWjzSUse611ooQWjMNQU4D1nw7vCrWQIYiElCxCNm+I+jHO4aiInW0XeKmtmDr/XbBPJT4JNgXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVfhP+rs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVfhP+rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCE2C19421;
	Fri, 13 Mar 2026 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408560;
	bh=mHNhZ03zfau6eX8H6TCWVw0KXYoxPIRYjfKW+oWukeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVfhP+rs4cqnhi7doSpJgURhOUX4ptbAk9UDrr3VBQKqlu7RoobylVilcp0aRkkpl
	 OLp6x2esDmuNO9an7KpZ54GTrnQySZCjlLXHhgt1CU07hXZaP8WJKqGINS6uWOGSyy
	 cK+LRifEnlWEp5leomxoJPriaT9fZqDwvsN1xA6zFzhhHvpyxdoUcMy0LNhfE6NVO/
	 WcvSgyOdq32hcOrvI96+KUB3lEZbYZeXi08VzJwJvBGmNCg8FRKqsKDlzR2eoL2imD
	 9TsW7FCwjjUJTwllMyGVqd5Gf09L69Wt5PRJEujL6hk1qOvuSo6F6pSvFQjoheqq3k
	 BgxLU3/MSlZ6g==
Date: Fri, 13 Mar 2026 14:29:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com, 
	mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl:
 Add Glymur pinctrl
Message-ID: <20260313-brawny-tidy-bullfrog-a99a63@quoll>
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260311124230.2241781-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311124230.2241781-2-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Mar 11, 2026 at 12:42:28PM +0000, Srinivas Kandagatla wrote:
> Document compatible for Qualcomm Glymur SoC LPASS TLMM pin controller,
> fully compatible with previous SM8650 generation (same amount of pins
> and functions).
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

