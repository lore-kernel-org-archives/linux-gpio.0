Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1110B41B8F1
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 07:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629421; cv=none; b=sfUqvnB/MCo/zR56ZjZl08NEv51hRere8ofKp57ncFdXweu2NeGXadMlr0hYgsOkCuA7z1fh6b2Ou0veVPxxuIAwjPo3twXx8O3h56bu2Wxa/Y1M4shNpIzR6RZUii+d3VHpdH90Lc62NP/Jmy3zrwMlWdWhfmzVobjsQxOhAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629421; c=relaxed/simple;
	bh=dqFYgL67SMUIOT+q7ezzhOZSFcUErpOaOgJkh1aCdbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkpDQCsnMHsxpYYdzUEv+fiQtZLPA8KJYX1E9KFOkMk5xwd+hysbHS+Bdl1ib2evLcWa301iyth9/01C8kXh55F5AKMp4RD1ciWr9Csx6JzuVJ7NOtCfBhzkUzfv0E65+oTMKzNxdwpnhi09MLnwXvMLvs9suKs26bkxs3DHMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=D21ANzwg; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="D21ANzwg"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 76JXxtAOsGd7876JXxGCvG; Thu, 17 Sep 2026 09:13:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1789629228; bh=dqFYgL67SMUIOT+q7ezzhOZSFcUErpOaOgJkh1aCdbs=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=D21ANzwgOrMYQippvrouIoSYF+ISA8Jg+0jJt3bTFUVWSej/vTwr1am85fq91LqXX
	 LhMV5QFZ9SRfR36iyyTA2ZQOWP2X9EzoW+4tgACaDG36Me5xYX9ZEsWCl77sD3byS9
	 rEWIpvzuYHAS1RxQt1Zy/PjcsxhsDCjHERE6tbIDFgY0rMax5HWPnYlLNQIR6qUsc/
	 uywvA0cOtR5uGWETl3mSPhJzY28TKh+D+1Ha+i8Com8F83yYeRdUn6BbyhXtPfuhwT
	 UBsrnYFnT0Xscx/WiUKeAFOtSr3uIQ/MQ5O8w+daT88oJGW7nfKyJ4iOgcqml9xqW6
	 un1V4r/p0kojw==
Message-ID: <34ecbb41-0cf9-417b-9562-fc31726d8a35@enneenne.com>
Date: Thu, 17 Sep 2026 09:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
 <20260916182641.9768-2-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260916182641.9768-2-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIpz3j/B7k4mwxb15UfXD960CzMBiOv2Dp+pyieXKRx0pf/ZD6sm2tHLLk0GOLH9jj1Mhj9Fwevt0X8XOjsQCqnzkD+L3CTa7mQKDO94CdNggQcnJfRl
 zae1o4YxZEC4U5pVS8RyRkFvSIbkRC6ihAx7919HjtR6rRwi7ShlBrEOPgHck+fnwch/buFdOn5C79DT2+IruuEQI6Ao6NdVljn61SXfhLozMS+OxT8PL0Qr
 ASg1s3SwjMfkgH3cuGDxvnwLUFA+BqUmK9a0AV3ki3SRjjlROc9A8axqZICjhlhqJPhF5wPrOZaQI4o71qLFWJEOH61OQFsJln2Lx8jWR2LUwOQp3xt9lbaF
 5dmPANSHmVvGNQzweIihNyVHWbSCzGCpsy19vKz1xxw5SQOpjEd+uArxsSBlO/C0l2KBkfMV+jzwWLhsOHel5WdSP97oVMbkZhcxE4G1T0Px+c4gnxu6kSK3
 qsuhKVp1BJwjsM1zXA/x+6o+s/bdqsSy9HANEgm846BOKFGS1TVgay2jll2bgeXr73FQX8RhicOeyphSYjtv86xWtuA4G8tl1cO1sw==

On 16/09/2026 20:26, Eliav Farber wrote:
> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> index 383a838744eb..7d11ec4656ee 100644
> --- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> @@ -28,6 +28,19 @@ properties:
>      description: Indicates a falling edge assert, when present. Rising edge if absent.
>      type: boolean
>  
> +  pinctrl-names:
> +    description:
> +      When the PPS input is muxed through a pin controller, the "default"
> +      state selects the PPS/GPIO function and is applied by the driver core
> +      before probe. The optional "inactive" state, when present, is selected
> +      when the driver is unbound or the system is shut down, handing the pins
> +      back to their alternate function. As "inactive" is the state to restore
> +      after "default", it may only appear as the second entry.

The driver looks the states up by name, not by index, and only
requires that "default" exists. Why you say that?

> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: inactive

AFAIK the tuple rules out ["default", "sleep"] and ["init", "default"]
for good, and this is ABI.

> +
>  required:
>    - compatible
>    - gpios
> @@ -40,8 +53,9 @@ examples:
>  
>      pps {
>          compatible = "pps-gpio";
> -        pinctrl-names = "default";
> +        pinctrl-names = "default", "inactive";
>          pinctrl-0 = <&pinctrl_pps>;
> +        pinctrl-1 = <&pinctrl_pps_inactive>;
>          gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
>          assert-falling-edge;
>          echo-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;

Ciao,

Rodolfo
