Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5C560AA7
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874094; cv=none; b=RQgvS4j8pBPZ9KSU9XWBeHNZS/WDcw+/jkEquxdxeDP4Dz8IRU9XdSixL9ZiZxvKlpQBzO1FV1/8Ti5JCEFjKTzZyaL4jNTxYcTWfD/3g8tg2jcsUyVaWHLt1BASvTICx2+SCAx6o/hItmoXDZ8vyYG1rzU6d5LpWZibJDhqKGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874094; c=relaxed/simple;
	bh=pAsEvkPu3covvOGoVW/KlsUNTc00k7Qd0xwuz3K8QkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQyK6e7KqDnPsfSLkhZIynSjqNCpB05h88Xj32KYKnafbl93OqAVQJw2FF3sKIj7xAGhZsVkzrXVMl3Jf3YZS450HFGYCgB2FZ4PPscb2ztf6Y9RXTVd2FDNmU8ihKXM8sUhLQ3e2FKyGH0ADy+JD1vk5qdWbJwnA2ptus/eQZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=RNoQ8z7X; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="RNoQ8z7X"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-939c25604d4so36762485a.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 06:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874062; x=1789478862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNO/TqMTBOHVJmTKy/WseOZnYihRsPoGCcusIiyOoTY=;
        b=RNoQ8z7Xs/IqIBn1H7QZuEX8UcDt+ZJXY+/HJicZ0ZlCoNsm2JNSYt8+FQqVJWpA28
         83nAk1992L8N6lSwVm7EhMiv432dxySWQs0/XC/FnPF0HxrlScto18D346xICY/oLwyl
         irOEbF7GJoHQuL9sh6pVrmojYxJkyztF3mTnr8KtPzJpaswh3uIv4kst3avjigaA0Sal
         9gm6EEDGuq9/tvKYGCmkq9m2HIBkcbg7W94vFh2v55S9QQLgJi5p1xNRwrmq05uxnPDv
         9GoK8SvimaKPug9Ea9kMdPURJcaShAFvniEEAZaJaiIRTtjIurko2iE/a+zOS1UF95Mi
         wEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874062; x=1789478862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNO/TqMTBOHVJmTKy/WseOZnYihRsPoGCcusIiyOoTY=;
        b=g0SMGoTsNc0Oo+DSSniobA8oUUGPt1RCaw7g4rek+4PZoDM4KVMgEaqgd1SNXwG1z8
         +yliga8c6eaUdZK8Lz+ZcRDuTYXGUdLQm9e8UmpfM4rfcKYqHXi0qepR2aqe1/gpVn7E
         r1vu8AF9dzt0FxMaRqqlipyztYHWpYdr0toCjU/JXYT/ZUeXdQGWbH7e047LBaUpbZUb
         /HGOxGhgKDP7G0H2Nq39SWhxdp6SnGGN/nAZsYGOd98NrIbw1Bj1l2jlKgZF7HyCAtJ9
         PWHob5Yo30Yu53ovKnVcQ4mJvKQsjr53yfqMTVl04BnG0XhtUpjwmyiKm3ihGTtIbp2p
         jDWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDYg8xUHq59oaJZQYQxA9ymKTF3fnRRjSof65GsmovlG/Djgjkv3HHarTZXx26JtVBgz/P86TraxjU@vger.kernel.org
X-Gm-Message-State: AFuF++n4S0HozK+jSIBRkz/YXMq+alxQ7bk0edz/ss7BH7QwpMVYkYGW
	Xl7FS0yAe9dTUdNwbMHaEIUMpz5zzIepfOwh/1ln5jG4VrPrR9GKB6hv/Ypy7ySSKUI=
X-Gm-Gg: AYBFou1ULFH5a8n6aGLfP838Lo6PXbaHGwzdSUATtj/uRrXKWa+huk964kNZ94ZwotM
	8w00lhdxL4thlcdZMnhcHT3U9r3NBV1aYLjH51yqi6qbLrL5fVyAGvNDgqjCtgj2ZQdvDTJCBV0
	5I1/sX8wPTlr2WUsj+I2xzhPq1pyAMeXuG29W3Gdd505/gBGHQ0usMeBOzMElrJ0PlUy9V0wfGN
	9Y4GHeSzagj2TLdar+2Yb18f7fHFh5B1Ms0dlm3GXnAHyjFxLRfuQDg4tnA5Xi+Au1JLaitU+yv
	XHwlu4NPs2FBAksHetPPHW7ZLw3b2yjI/XLrj9VNUdzUkcB7WXi5MXwLmR21SwwWt1KqGNixpdt
	GF3YNF55K9uedzF/QLpPHbrDiswNXzKQywFKclEx1I2XzTyVYJId3/qgnGfKasy1tpjoQxk8IOb
	pNyIgwPuTANaixly8x4ZZ2HZX2KT6V+UkbvjhmW3o//wsz85dWSRd83F2g/zw4
X-Received: by 2002:a05:620a:8c0e:b0:939:6dfa:db9d with SMTP id af79cd13be357-939804fa21fmr2230570085a.50.1788874062236;
        Tue, 08 Sep 2026 06:27:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:41 -0700 (PDT)
Message-ID: <8f6cbccf-3169-4b32-9c8b-406d53449590@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:40 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: PCI: toshiba,tc9563: Document
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>,
 Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-1-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. The controller is registered as an auxiliary device by the TC9563
> power controller and accessed through the same register map.

s/power controller/power controller driver/

On the other hand, this is a devicetree binding, which should
really focus on the hardware, not the software.  The auxiliary
device and the regmap are software constructs that aren't
hardware-related.

I think this description should focus on the fact that the
TC9563 SoC (which contains the PCIe switch) *also* has a
GPIO controller that is managed via the same I2C interface.
And that it's possible the description within the binding
should be modified that way as well.  (However please defer
to any input provided by the devicetree maintainers...)

> Describe the switch node itself as the embedded GPIO controller and

s/as the/as implementing an/

> document the per-port reset-gpios property.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

I will let the devicetree maintainers comment on the way you
document your properties.

					-Alex

> ---
>   .../devicetree/bindings/pci/toshiba,tc9563.yaml       | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> index f084830c6d0c..c4cd162cb084 100644
> --- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> +++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> @@ -31,6 +31,11 @@ properties:
>       description:
>         GPIO controlling the RESX# pin.
>   
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
>     vdd18-supply: true
>   
>     vdd09-supply: true
> @@ -84,6 +89,11 @@ $defs:
>       type: object
>   
>       properties:
> +      reset-gpios:
> +        maxItems: 1
> +        description:
> +          GPIO controlling the reset line connected to the downstream port.
> +
>         toshiba,tx-amplitude-microvolt:
>           description:
>             Change Tx Margin setting for low power consumption.
> @@ -128,7 +138,7 @@ examples:
>               ranges;
>               bus-range = <0x01 0xff>;
>   
> -            pcie@0,0 {
> +            tc9563: pcie@0,0 {
>                   compatible = "pci1179,0623";
>   
>                   reg = <0x10000 0x0 0x0 0x0 0x0>;
> @@ -149,6 +159,9 @@ examples:
>   
>                   resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
>   
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +
>                   pcie@1,0 {
>                       compatible = "pciclass,0604";
>                       reg = <0x20800 0x0 0x0 0x0 0x0>;
> @@ -158,6 +171,8 @@ examples:
>                       ranges;
>                       bus-range = <0x03 0xff>;
>   
> +                    reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
> +
>                       toshiba,no-dfe-support;
>                   };
>   
> @@ -170,6 +185,8 @@ examples:
>                       ranges;
>                       bus-range = <0x04 0xff>;
>   
> +                    reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
> +
>                       toshiba,tx-amplitude-microvolt = <10>;
>                   };
>   
> 

