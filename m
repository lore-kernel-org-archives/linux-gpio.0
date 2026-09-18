Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F054A6CFB
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.155.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789717998; cv=none; b=cfeaEeqahfCUDrr/v9iWcjwRpINUGyFpt8e/cS9O2+tmIGzOsaobn/Ygi0pJFsEoRtdiCe8ycb57rm8urHU5FskM1a7fRQTKgKWx25C95kYANtibxwucPZQ0hgaFrVIfAz52fL8P702zFt8R3z4y0TA/BI7OGcDkTbG8Ns9YJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789717998; c=relaxed/simple;
	bh=rs7o5fyQ69KDrE4c+f68M3f72xhlbarCxw5Wnu1QAAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5rIRQXzQh6OLhgOf5aEFgs3rm1Rr5teAAwpJo+cHtBRox/VHur74STEemfoqW1SBjsHqRFBMWEdNvJj8xxH/FcsI1EES/j2mHOCdo/izYIMgg6dbuTUOOpXmp2QIdoYxgWmGYTCdXNGLgXaY/pmiZ3qgR83oOF92csQRs31m5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=kjEtN2hu; arc=none smtp.client-ip=62.149.155.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="kjEtN2hu"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 7TM8xO8s9r6Qv7TMExPQZT; Fri, 18 Sep 2026 09:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1789717806; bh=rs7o5fyQ69KDrE4c+f68M3f72xhlbarCxw5Wnu1QAAE=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=kjEtN2huOHW3xgbhld+RwCowjLq2BuNcwUVVX3tgTJY0Ci1NBStJrRJO389DsmEki
	 rJm1Pgnmy/i3wfBfCwFk4gu7VJ/29P/WUaBeiyjG/T3C3Vyuq3LvNXR08m/2BNCeTv
	 RrrxKf9drcDOASh9bAPANwV4OnTJl9PNZSCvS296C9tqEDnhSmqkcTzyVwQFhhA7D5
	 U5FYrLL4sO/iQe3TebkeuIgMKVVEcYybxeGuXLm3/4pH0YNfGFzMPonYwvFqMwXiI8
	 NCOhP4lTLiIjICNrgQ3hnA4v+pJbvQZXW6z8EMULbH+eSVLUhqLp5EcEm4290F9fY/
	 uHHfV1pwHTwVg==
Message-ID: <78b01d9f-5551-4bb8-8fe1-9a992f624810@enneenne.com>
Date: Fri, 18 Sep 2026 09:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-3-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260917075611.47881-3-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLgmRDpKuM+x+ItopsDtC5jCo5SJhcfgPi3w64jVBCfoRUs58T6+lOO33oI0jbFPoZAN8bhO2nDKqmhAkjMtZWw438wPSNR8k6lM22RgKFFl8Ma7W588
 6+a2UFHEFz7T+21W9dfOmdU07HwCmM8XKY7je7q9TjbkYOw8f3zAQwbivq5qR6Q1D3e232Kg3tiaSiUcr1HTvWa53z/xYVNgx3arwOkONjLx7VrEUQebf/50
 w5vKYO6K3cCSQZQovs5UfbT3F+91oQ2eXOWssy1M50Fd/237JxGzUkVq200tJSdU9MjQVJM2lWwXQmZfQXY4smMIBbRLq56n0GFeMMHe1wPh9Tt73B+2idJt
 G+R9zIWkfY9Y4Z5d8EbvntHU10OCya0WYwO3/bmBXkoxqc5asc+BtUqtClnpNiWRVprkF45DWunk+3f/4e2nKzomzuZAip3QIfht7BZ8sMSYx4RPRoh08I5z
 xHIVwJJdAKE/sgeKhAJm1VkQzFrlm2bXb9eRXy/ZmmxAKGy+Tkd2V+J2NkBm9GGthKBAZ3soW1kP+DvP2J4pbx6ja7tIzzFBD8Ihgw==

On Thu, Sep 17, 2026 at 07:56:10AM +0000, Eliav Farber wrote:
> Document the optional "default" and "inactive" pinctrl-names and show
> both in the example.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> index 383a838744eb..db6ecb17cb54 100644
> --- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> @@ -28,6 +28,19 @@ properties:
>      description: Indicates a falling edge assert, when present. Rising edge if absent.
>      type: boolean
>
> +  pinctrl-names:
> +    description:
> +      When the PPS input is muxed through a pin controller, the standard
> +      "default" state selects the PPS/GPIO function and is applied by the
> +      driver core before probe. If a state named "inactive" is also present,
> +      it is selected when the driver is unbound or the system is shut down,
> +      handing the pins back to their alternate function. The "inactive"
> +      state, if used, requires a "default" state; its position among the
> +      names does not matter.
> +    minItems: 1
> +    contains:
> +      const: default
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

I tried:

   $ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/pps/pps-gpio.yaml \
          dt_binding_check

and it gave me:

   pps-gpio.example.dtb: pps (pps-gpio): pinctrl-names:
         ['default', 'inactive'] is too long
         from schema $id: http://devicetree.org/schemas/pps/pps-gpio.yaml

Ciao,

Rodolfo
