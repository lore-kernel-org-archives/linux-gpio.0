Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B45625E7
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874109; cv=none; b=GeF4rANBZEAAYi4gMvTeNFxkmr8q+KN8c+RFm7syYS/HHMFEn1KEO5PwDD8Wr/HPFTmwlS7lY7/mumyLHHavLPRvPuT3BI8FWI3utohf+0chtjQ4wE9mFX+sBdUzgLk3/SaaZ/B1Altc1ksKqcUcHQlkgXa1xvlG1pn0LDtG6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874109; c=relaxed/simple;
	bh=hgC/ODhmvpQIXajTqQbdCbpcyTOqi2fqT0bk/7HtYG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZMlhFC9oGjxpRYEmiMq4DJeX287nyelwTwC4UIwB2kAJp8oGHpvn26MuZ2er44Y+oc9LIRxlPTI6RutdEo5+AK65pE4KGTab2I6Etkuu+ST7Aq0uk4WDimfwsqhK0eb7Ay1NyFeR2fLyxxDeB4SSg/I2tpkpDx7ZoSqAEPeqII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Dix1vpMK; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Dix1vpMK"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-939b87879daso92291285a.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788874090; x=1789478890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCrdWA50X2yOwE1UwjNDpc7YkWkuiPRBy93RdSxUyhs=;
        b=Dix1vpMKwzuFjd4Aji1DJrEW95qYTNFQhTPtK/lCC3SOBzXIVbaq1bkgfwBTj36mpU
         Ulci4IeJZNhpiAtSoDMO/W2rZ/YNDEK0V6M7MQhnF/VUBqI9zIhMVR9oySjSDBgBAb5K
         joeOxQjbphD8q9dDUyjROZMQoLKidxTX+Euwj3kEtG6nNV5tjTygtzhKm6YNWnHeZHvq
         4y66x5zHIY+Mq3JcPjdf/mXaPdb4+BvV/RRQ9RUxS+udfHgVKNPTmMxWQrWUyfKtgPu5
         p94FzojkhQDLMkl+TMfdUCCKmP4YIWKDJZnpyuYCE5xiBHC/k9x6naPJBhwK9/iNUKhE
         OV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874090; x=1789478890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCrdWA50X2yOwE1UwjNDpc7YkWkuiPRBy93RdSxUyhs=;
        b=JbV8Rr9foro69mGR6mplPLYustdFq5okHhqd8RwRX0uAAx8TmZmvrka2deGbxmEZD2
         gv/Y690dB5d9HK2RBIb8kgWoARvcfN3DQoQCSLkhD23OmI0t/Ta/XUq7zqpoCPJer6rn
         FvkatlkX51h0Mx1ciPr0OvuqkZzdQuU8wM7eebSMZu2oii1ASHoNMTjN5HVrtwjCNuoG
         olHeZW/KM/WpwmB3yEI5xTQMg1RqAQQIjO0lEgjc7QP30FlP/YcchVEaCXG3Kx0Xn5Y7
         sZAZOrek697rDzwciYpDzGnVYGMUjf2ay4GusGD9ER2Bu3K7GKD+u2Zp2sB2SZ4FCV2h
         fkuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKqlFtgqZPhX+nBxlJonws94f2mUH8WHtIPqmjnObPV1yEs4wFMxPxBs+4u100bx242ISldt/R1EX9@vger.kernel.org
X-Gm-Message-State: AFuF++lrORTi8BQRrXMrIDXWSz2crXmHdR0h+8hA0c5M2PdMJ0vwigMe
	RjQWzTKcxBerYPR+z/rfTnrsu0xTVQcGtJxIYvieo/3IkDpfFDa6bByuwrlUjzP7rXg=
X-Gm-Gg: AYBFou0Qfy/cyYMVozBhDnn4l8Qr58NGWjYKtDn0jB8hGGV73TQ/qXdImlQUwqH57jk
	bjamIjpBuzS2UdX4SQs4nmJxZ4vR/3OPNwIvJ6QXCzu2LzaegwcKL8iJkmo0FvGwy9290YyWXFQ
	/kKJ/rV6eeN3XQ+s0pXMpQaShN0iHptjw1G5Zef6mBEpoVCq18KkXCjlMAzA4y+dU1JNM9vYSek
	e3SXgLbTBYy9SJMt0+VX2qAG0T2yhob8ELwbPpO6kd11aTFXKjkhFf1YVZDP8XtkovYaiwsgqMB
	1DSOgqBB8FaornsMo+fY9pIvezYOwrPQzCudJZZRhy/+MsL5uEtppoVFIAFF986vVINbASX6A0j
	3WlVJhm9qYEtZr5lbSoCvIh8nmtAz7z8g/QXS1Fx5+mmth1aO5z/OtZlRAvO1asU+xMVpS4KIBW
	BhxlAvfFmNdwXnbtsvbc/xLcX2sebHIh5kMJ5q3Nv2S69kz39SZeLsIsIhG+Vl
X-Received: by 2002:a05:620a:7115:b0:939:6df7:5e0f with SMTP id af79cd13be357-93980506519mr3377731985a.51.1788874070415;
        Tue, 08 Sep 2026 06:27:50 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b8fbc1dbsm249492285a.11.2026.09.08.06.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:27:50 -0700 (PDT)
Message-ID: <aeb341e6-0019-47e4-9522-7780cce9dbce@riscstar.com>
Date: Tue, 8 Sep 2026 08:27:48 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qcs6490-rb3gen2: Enable TC9563
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
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904-pci-tc9563-aux-v3-0-5b1449d62ba2@oss.qualcomm.com>
 <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260904-pci-tc9563-aux-v3-5-5b1449d62ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/4/26 12:15 PM, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines. The controller is registered as an auxiliary device by the TC9563
> power controller and accessed through the same i2c device.
> 
> Describe the switch node itself as the embedded GPIO controller and us
> it to drive the PERST# reset lines of the two external downstream port
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Looks good.  Thanks a lot for doing this Lorenzo.

Reviewed-by: Alex Elder <elder@riscstar.com>> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index a13315bf0fb0..4da7342ca90d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -867,7 +867,7 @@ &pcie1_phy {
>   &pcie1_port0 {
>   	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>   
> -	pcie@0,0 {
> +	tc9563: pcie@0,0 {
>   		compatible = "pci1179,0623";
>   		reg = <0x10000 0x0 0x0 0x0 0x0>;
>   		#address-cells = <3>;
> @@ -891,6 +891,9 @@ pcie@0,0 {
>   		pinctrl-0 = <&tc9563_resx_n>;
>   		pinctrl-names = "default";
>   
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
>   		pcie1_switch0_dsp1: pcie@1,0 {
>   			reg = <0x20800 0x0 0x0 0x0 0x0>;
>   			#address-cells = <3>;
> @@ -899,6 +902,7 @@ pcie1_switch0_dsp1: pcie@1,0 {
>   			device_type = "pci";
>   			ranges;
>   			bus-range = <0x3 0xff>;
> +			reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
>   		};
>   
>   		pcie@2,0 {
> @@ -909,6 +913,7 @@ pcie@2,0 {
>   			device_type = "pci";
>   			ranges;
>   			bus-range = <0x4 0xff>;
> +			reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
>   
>   			/* Renesas μPD720201 PCIe USB3.0 Host Controller */
>   			usb-controller@0,0 {
> 

